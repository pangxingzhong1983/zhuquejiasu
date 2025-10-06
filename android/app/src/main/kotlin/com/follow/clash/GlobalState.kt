package com.follow.clash

import android.content.Context
import androidx.lifecycle.MutableLiveData
import com.follow.clash.plugins.AppPlugin
import com.follow.clash.plugins.ServicePlugin
import com.follow.clash.plugins.TilePlugin
import com.follow.clash.plugins.VpnPlugin
import io.flutter.FlutterInjector
import android.util.Log
import android.os.SystemClock
import android.view.Choreographer
import android.os.Looper
import android.os.MessageQueue
import java.util.concurrent.atomic.AtomicBoolean
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import java.util.concurrent.locks.ReentrantLock
import kotlin.concurrent.withLock

enum class RunState {
    START,
    PENDING,
    STOP
}


object GlobalState {
    val runLock = ReentrantLock()

    val runState: MutableLiveData<RunState> = MutableLiveData<RunState>(RunState.STOP)
    var flutterEngine: FlutterEngine? = null
    private var serviceEngine: FlutterEngine? = null
    private var serviceEngineInitializing: Boolean = false

    fun getCurrentAppPlugin(): AppPlugin? {
        val currentEngine = if (flutterEngine != null) flutterEngine else serviceEngine
        return currentEngine?.plugins?.get(AppPlugin::class.java) as AppPlugin?
    }

    suspend fun getText(text: String): String {
        return getCurrentAppPlugin()?.getText(text) ?: ""
    }

    fun getCurrentTilePlugin(): TilePlugin? {
        val currentEngine = if (flutterEngine != null) flutterEngine else serviceEngine
        return currentEngine?.plugins?.get(TilePlugin::class.java) as TilePlugin?
    }

    fun getCurrentVPNPlugin(): VpnPlugin? {
        return serviceEngine?.plugins?.get(VpnPlugin::class.java) as VpnPlugin?
    }

    fun handleToggle() {
        val starting = handleStart()
        if (!starting) {
            handleStop()
        }
    }

    fun handleStart(): Boolean {
        if (runState.value == RunState.STOP) {
            runState.value = RunState.PENDING
            runLock.lock()
            val tilePlugin = getCurrentTilePlugin()
            if (tilePlugin != null) {
                tilePlugin.handleStart()
            } else {
                initServiceEngine()
            }
            return true
        }
        return false
    }

    fun handleStop() {
        if (runState.value == RunState.START) {
            runState.value = RunState.PENDING
            runLock.lock()
            getCurrentTilePlugin()?.handleStop()
        }
    }

    fun handleTryDestroy() {
        if (flutterEngine == null) {
            destroyServiceEngine()
        }
    }

    fun destroyServiceEngine() {
        runLock.withLock {
            serviceEngine?.destroy()
            serviceEngine = null
        }
    }

    fun initServiceEngine() {
        val calledAt = SystemClock.elapsedRealtime()
        Log.d("ZhuqueGlobal", "initServiceEngine: called at ${calledAt}ms thread=${Thread.currentThread().name}")

        // Avoid blocking the caller (typically main thread / MethodChannel handler).
        val lockRequest = SystemClock.elapsedRealtime()
        runLock.withLock {
            val lockAcquired = SystemClock.elapsedRealtime()
            Log.d("ZhuqueGlobal", "initServiceEngine: runLock acquired after ${lockAcquired - lockRequest}ms")
            if (serviceEngine != null) {
                Log.d("ZhuqueGlobal", "initServiceEngine: serviceEngine already present, returning")
                return@withLock
            }
            if (serviceEngineInitializing) {
                Log.d("ZhuqueGlobal", "serviceEngine already initializing, skipping duplicate call")
                return@withLock
            }
            serviceEngineInitializing = true
        }

    Log.d("ZhuqueGlobal", "initServiceEngine: scheduling main-thread init after first frame (preferred)")
    // Experimental switch: when true, delay executeDartEntrypoint by this many ms after
    // engine creation so we can validate whether moving the native->Dart handoff
    // outside the early startup window avoids PerfMonitor kills. Toggleable and
    // intentionally conservative; disable or reduce before landing to production.
    val ENABLE_EXPERIMENTAL_DELAY = true
    val EXPERIMENTAL_DELAY_MS = 1500L
        // Prepare the actual init work as a lambda so we can call it from different scheduling paths
        // Guard to ensure performInit only runs once even if multiple scheduling paths trigger it
        val initInvoked = AtomicBoolean(false)
        val performInit = Runnable {
            if (initInvoked.compareAndSet(false, true)) {
            val handlerStart = SystemClock.elapsedRealtime()
            Log.d("ZhuqueGlobal", "initServiceEngine: init runnable start at ${handlerStart}ms thread=${Thread.currentThread().name}")
            try {
                val lockRequest2 = SystemClock.elapsedRealtime()
                runLock.withLock {
                    val lockAcquired2 = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "initServiceEngine[handler]: runLock acquired after ${lockAcquired2 - lockRequest2}ms")
                    if (serviceEngine != null) {
                        serviceEngineInitializing = false
                        Log.d("ZhuqueGlobal", "initServiceEngine[handler]: serviceEngine already initialized")
                        return@withLock
                    }

                    val createStart = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "initServiceEngine[handler]: creating FlutterEngine at ${createStart}ms")
                    val engine = FlutterEngine(FlClashApplication.getAppContext())
                    val createEnd = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "initServiceEngine[handler]: FlutterEngine created in ${createEnd - createStart}ms")

                    // Register plugins with timing
                    val pluginStart1 = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "initServiceEngine[handler]: adding VpnPlugin start at ${pluginStart1}ms")
                    engine.plugins.add(VpnPlugin)
                    val pluginEnd1 = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "initServiceEngine[handler]: VpnPlugin added in ${pluginEnd1 - pluginStart1}ms")

                    val pluginStart2 = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "initServiceEngine[handler]: adding AppPlugin start at ${pluginStart2}ms")
                    engine.plugins.add(AppPlugin())
                    val pluginEnd2 = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "initServiceEngine[handler]: AppPlugin added in ${pluginEnd2 - pluginStart2}ms")

                    val pluginStart3 = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "initServiceEngine[handler]: adding TilePlugin start at ${pluginStart3}ms")
                    engine.plugins.add(TilePlugin())
                    val pluginEnd3 = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "initServiceEngine[handler]: TilePlugin added in ${pluginEnd3 - pluginStart3}ms")

                    val vpnService = DartExecutor.DartEntrypoint(
                        FlutterInjector.instance().flutterLoader().findAppBundlePath(),
                        "_service"
                    )

                    // At this point the service engine has been created and plugins
                    // registered. Optionally delay the executeDartEntrypoint call so the
                    // synchronous dart-entering work occurs later (outside the critical
                    // startup frames). Do not block the current thread while waiting.
                    serviceEngine = engine
                    serviceEngineInitializing = false
                    val handlerEndPreDart = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "initServiceEngine[handler]: engine ready at ${handlerEndPreDart}ms; scheduling executeDartEntrypoint (delayEnabled=${ENABLE_EXPERIMENTAL_DELAY})")

                    val postDartRunnable = Runnable {
                        try {
                            val dartStart = SystemClock.elapsedRealtime()
                            Log.d("ZhuqueGlobal", "GLOBALDBG_EXEC_DART_START: executeDartEntrypoint starting at ${dartStart}ms thread=${Thread.currentThread().name}")
                             // To avoid an early 'quick' service startup path that
                             // may call exit(0) from the service isolate and kill
                             // the whole process, do not pass the experimental
                             // "quick" flag here. Keep the execution flags null
                             // so the service runs the normal initialization flow.
                             engine.dartExecutor.executeDartEntrypoint(
                                 vpnService,
                                 null
                             )
                            val dartEnd = SystemClock.elapsedRealtime()
                            val dartDuration = dartEnd - dartStart
                            Log.d("ZhuqueGlobal", "GLOBALDBG_EXEC_DART_DONE: executeDartEntrypoint completed duration=${dartDuration}ms")
                            if (dartDuration > 200) {
                                Log.w("ZhuqueGlobal", "GLOBALDBG_EXEC_DART_SLOW: executeDartEntrypoint took ${dartDuration}ms which exceeds 200ms threshold")
                                try {
                                    val st = Thread.currentThread().stackTrace.joinToString("\n")
                                    Log.w("ZhuqueGlobal", "GLOBALDBG_EXEC_DART_SLOW_STACK:\n$st")
                                } catch (_: Exception) {
                                    // ignore stack formatting errors
                                }
                            }
                         } catch (e: Exception) {
                             Log.e("ZhuqueGlobal", "executeDartEntrypoint failed", e)
                         }
                     }

                    if (ENABLE_EXPERIMENTAL_DELAY) {
                        val mainHandler2 = android.os.Handler(android.os.Looper.getMainLooper())
                        mainHandler2.postDelayed(postDartRunnable, EXPERIMENTAL_DELAY_MS)
                        Log.d("ZhuqueGlobal", "initServiceEngine[handler]: executeDartEntrypoint delayed by ${EXPERIMENTAL_DELAY_MS}ms")
                    } else {
                        postDartRunnable.run()
                    }
                    val handlerEnd = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "initServiceEngine[handler]: completed total ${handlerEnd - handlerStart}ms (engine ready)")
                }
            } catch (e: Exception) {
                runLock.withLock {
                    serviceEngineInitializing = false
                }
                Log.e("ZhuqueGlobal", "initServiceEngine failed", e)
            }
            }
    }

    try {
            val mainHandler = android.os.Handler(android.os.Looper.getMainLooper())
            // Post to main looper, then schedule for the next frame so the app gets its first frame rendered
            mainHandler.post {
                try {
                        // Prefer initializing when the main Looper is idle so we don't interfere with
                        // critical rendering or input handling during app startup.
                        Log.d("ZhuqueGlobal", "initServiceEngine: posting idle callback via Looper message queue")
                        val queue = Looper.getMainLooper().queue
                        val idleHandler = MessageQueue.IdleHandler {
                            performInit.run()
                            // return false to remove the idle handler after it runs once
                            false
                        }
                        queue.addIdleHandler(idleHandler)

                        // Safety fallback: if the queue never goes idle within a short window,
                        // run the init after a small delay. performInit is guarded so double-run is safe.
                        mainHandler.postDelayed({
                            performInit.run()
                        }, 500)
                } catch (e: Exception) {
                    // Fallback to the old delayed handler in case Choreographer is unavailable
                    Log.w("ZhuqueGlobal", "Choreographer scheduling failed, falling back to delayed handler", e)
                    mainHandler.postDelayed({ performInit.run() }, 500)
                }
            }
        } catch (e: Exception) {
            runLock.withLock {
                serviceEngineInitializing = false
            }
            Log.e("ZhuqueGlobal", "initServiceEngine scheduling failed", e)
        }
    }
}


