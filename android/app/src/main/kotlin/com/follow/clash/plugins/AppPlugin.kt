package com.follow.clash.plugins

import android.Manifest
import android.app.Activity
import android.app.ActivityManager
import android.content.Intent
import android.content.pm.ApplicationInfo
import android.content.pm.ComponentInfo
import android.content.pm.PackageManager
import android.net.VpnService
import android.os.Build
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.content.ContextCompat.getSystemService
import androidx.core.content.FileProvider
import androidx.core.content.pm.ShortcutInfoCompat
import androidx.core.content.pm.ShortcutManagerCompat
import androidx.core.graphics.drawable.IconCompat
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.follow.clash.FlClashApplication
import com.follow.clash.GlobalState
import com.follow.clash.R
import com.follow.clash.extensions.awaitResult
import com.follow.clash.extensions.getActionIntent
import com.follow.clash.extensions.getBase64
import com.follow.clash.models.Package
import com.google.gson.Gson
import io.flutter.embedding.android.FlutterActivity
import android.util.Log
import android.os.SystemClock
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import kotlinx.coroutines.async
import kotlinx.coroutines.awaitAll
import java.io.File
import java.lang.ref.WeakReference
import java.util.zip.ZipFile

class AppPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {

    private var activityRef: WeakReference<Activity>? = null

    private lateinit var channel: MethodChannel

    private lateinit var scope: CoroutineScope

    // Detailed debug tag for AppPlugin heavy-path tracing
    private val APPPLUGIN_TAG = "ZhuqueGlobal[APPPLUGIN]"

    // Cached results to avoid doing heavy work during cold-start.
    // If a request comes in very early after plugin attach, we return quickly and
    // schedule a background computation to populate the cache.
    private var cachedChinaPackagesJson: String? = null
    private var computingChinaPackages: Boolean = false
    private var pluginAttachedAt: Long = 0L


    private var vpnCallBack: (() -> Unit)? = null

    private val iconMap = mutableMapOf<String, String?>()

    private val packages = mutableListOf<Package>()

    private val skipPrefixList = listOf(
        "com.google",
        "com.android.chrome",
        "com.android.vending",
        "com.microsoft",
        "com.apple",
        "com.zhiliaoapp.musically", // Banned by China
    )

    private val chinaAppPrefixList = listOf(
        "com.tencent",
        "com.alibaba",
        "com.umeng",
        "com.qihoo",
        "com.ali",
        "com.alipay",
        "com.amap",
        "com.sina",
        "com.weibo",
        "com.vivo",
        "com.xiaomi",
        "com.huawei",
        "com.taobao",
        "com.secneo",
        "s.h.e.l.l",
        "com.stub",
        "com.kiwisec",
        "com.secshell",
        "com.wrapper",
        "cn.securitystack",
        "com.mogosec",
        "com.secoen",
        "com.netease",
        "com.mx",
        "com.qq.e",
        "com.baidu",
        "com.bytedance",
        "com.bugly",
        "com.miui",
        "com.oppo",
        "com.coloros",
        "com.iqoo",
        "com.meizu",
        "com.gionee",
        "cn.nubia",
        "com.oplus",
        "andes.oplus",
        "com.unionpay",
        "cn.wps"
    )

    private val chinaAppRegex by lazy {
        ("(" + chinaAppPrefixList.joinToString("|").replace(".", "\\.") + ").*").toRegex()
    }

    val VPN_PERMISSION_REQUEST_CODE = 1001

    val NOTIFICATION_PERMISSION_REQUEST_CODE = 1002

    private var isBlockNotification: Boolean = false

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val t0 = SystemClock.elapsedRealtime()
        Log.d("ZhuqueGlobal", "AppPlugin.onAttachedToEngine: start at ${t0}ms thread=${Thread.currentThread().name}")
        scope = CoroutineScope(Dispatchers.Default)
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "app")
        channel.setMethodCallHandler(this)
        pluginAttachedAt = t0
        val t1 = SystemClock.elapsedRealtime()
        Log.d("ZhuqueGlobal", "AppPlugin.onAttachedToEngine: done in ${t1 - t0}ms")
    }

    private fun initShortcuts(label: String) {
        val shortcut = ShortcutInfoCompat.Builder(FlClashApplication.getAppContext(), "toggle")
            .setShortLabel(label)
            .setIcon(
                IconCompat.createWithResource(
                    FlClashApplication.getAppContext(),
                    R.mipmap.ic_launcher_round
                )
            )
            .setIntent(FlClashApplication.getAppContext().getActionIntent("CHANGE"))
            .build()
        ShortcutManagerCompat.setDynamicShortcuts(
            FlClashApplication.getAppContext(),
            listOf(shortcut)
        )
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        scope.cancel()
    }

    private fun tip(message: String?) {
        if (GlobalState.flutterEngine == null) {
            Toast.makeText(FlClashApplication.getAppContext(), message, Toast.LENGTH_LONG).show()
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "moveTaskToBack" -> {
                activityRef?.get()?.moveTaskToBack(true)
                result.success(true)
            }

            "updateExcludeFromRecents" -> {
                val value = call.argument<Boolean>("value")
                updateExcludeFromRecents(value)
                result.success(true)
            }

            "initShortcuts" -> {
                initShortcuts(call.arguments as String)
                result.success(true)
            }

            "getPackages" -> {
                scope.launch {
                    val start = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "AppPlugin.getPackages: start at ${start}ms")
                    val json = getPackagesToJson()
                    val end = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "AppPlugin.getPackages: completed in ${end - start}ms")
                    result.success(json)
                }
            }

            "getChinaPackageNames" -> {
                scope.launch {
                    val callTs = SystemClock.elapsedRealtime()
                    // Fast-path: if we already have cached result, return it immediately.
                    cachedChinaPackagesJson?.let {
                        Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} getChinaPackageNames: returning cached result (age=${callTs - pluginAttachedAt}ms)")
                        result.success(it)
                        return@launch
                    }

                    // If this call happens very early after plugin attach, don't perform
                    // the heavy computation synchronously. Instead schedule it on IO and
                    // return an empty list immediately so the cold-start path stays fast.
                    val EARLY_WINDOW_MS = 4000L
                    if (!computingChinaPackages && callTs - pluginAttachedAt <= EARLY_WINDOW_MS) {
                        Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} getChinaPackageNames: early-call detected (age=${callTs - pluginAttachedAt}ms), scheduling background compute and returning fast")
                        computingChinaPackages = true
                        // Background compute and populate cache
                        scope.launch(Dispatchers.IO) {
                            try {
                                val json = computeChinaPackageNames()
                                cachedChinaPackagesJson = json
                                Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} computeChinaPackageNames: background compute completed, cached length=${json.length}")
                            } catch (e: Exception) {
                                Log.w("ZhuqueGlobal", "${APPPLUGIN_TAG} computeChinaPackageNames: background compute FAILED", e)
                            } finally {
                                computingChinaPackages = false
                            }
                        }
                        result.success(Gson().toJson(emptyList<String>()))
                        return@launch
                    }

                    // Otherwise do a normal computation and cache result for future calls.
                    val json = computeChinaPackageNames()
                    cachedChinaPackagesJson = json
                    result.success(json)
                }
            }

            "getPackageIcon" -> {
                scope.launch {
                    val packageName = call.argument<String>("packageName")
                    if (packageName == null) {
                        result.success(null)
                        return@launch
                    }
                    val packageIcon = getPackageIcon(packageName)
                    packageIcon.let {
                        if (it != null) {
                            result.success(it)
                            return@launch
                        }
                        if (iconMap["default"] == null) {
                            iconMap["default"] =
                                FlClashApplication.getAppContext().packageManager?.defaultActivityIcon?.getBase64()
                        }
                        result.success(iconMap["default"])
                        return@launch
                    }
                }
            }

            "tip" -> {
                val message = call.argument<String>("message")
                tip(message)
                result.success(true)
            }

            "openFile" -> {
                val path = call.argument<String>("path")!!
                openFile(path)
                result.success(true)
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    private fun openFile(path: String) {
        val file = File(path)
        val uri = FileProvider.getUriForFile(
            FlClashApplication.getAppContext(),
            "${FlClashApplication.getAppContext().packageName}.fileProvider",
            file
        )

        val intent = Intent(Intent.ACTION_VIEW).setDataAndType(
            uri,
            "text/plain"
        )

        val flags =
            Intent.FLAG_GRANT_WRITE_URI_PERMISSION or Intent.FLAG_GRANT_READ_URI_PERMISSION

        val resInfoList = FlClashApplication.getAppContext().packageManager.queryIntentActivities(
            intent, PackageManager.MATCH_DEFAULT_ONLY
        )

        for (resolveInfo in resInfoList) {
            val packageName = resolveInfo.activityInfo.packageName
            FlClashApplication.getAppContext().grantUriPermission(
                packageName,
                uri,
                flags
            )
        }

        try {
            activityRef?.get()?.startActivity(intent)
        } catch (e: Exception) {
            println(e)
        }
    }

    private fun updateExcludeFromRecents(value: Boolean?) {
        val am = getSystemService(FlClashApplication.getAppContext(), ActivityManager::class.java)
        val task = am?.appTasks?.firstOrNull {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                it.taskInfo.taskId == activityRef?.get()?.taskId
            } else {
                it.taskInfo.id == activityRef?.get()?.taskId
            }
        }

        when (value) {
            true -> task?.setExcludeFromRecents(value)
            false -> task?.setExcludeFromRecents(value)
            null -> task?.setExcludeFromRecents(false)
        }
    }

    private suspend fun getPackageIcon(packageName: String): String? {
        val packageManager = FlClashApplication.getAppContext().packageManager
        if (iconMap[packageName] == null) {
            iconMap[packageName] = try {
                packageManager?.getApplicationIcon(packageName)?.getBase64()
            } catch (_: Exception) {
                null
            }

        }
        return iconMap[packageName]
    }

    private fun getPackages(): List<Package> {
        val packageManager = FlClashApplication.getAppContext().packageManager
        val t0 = SystemClock.elapsedRealtime()
        Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} getPackages: invoked at ${t0}ms thread=${Thread.currentThread().name} (cached=${packages.isNotEmpty()})")
        if (packages.isNotEmpty()) return packages
        packageManager?.getInstalledPackages(PackageManager.GET_META_DATA)?.filter {
            it.packageName != FlClashApplication.getAppContext().packageName
                    || it.requestedPermissions?.contains(Manifest.permission.INTERNET) == true
                    || it.packageName == "android"

        }?.map {
            Package(
                packageName = it.packageName,
                label = it.applicationInfo?.loadLabel(packageManager).toString(),
                isSystem = (it.applicationInfo!!.flags and ApplicationInfo.FLAG_SYSTEM) == 1,
                lastUpdateTime = it.lastUpdateTime
            )
        }?.let { packages.addAll(it) }
        val t1 = SystemClock.elapsedRealtime()
        Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} getPackages: loaded ${packages.size} packages in ${t1 - t0}ms")
        return packages
    }

    private suspend fun getPackagesToJson(): String {
        return withContext(Dispatchers.Default) {
            Gson().toJson(getPackages())
        }
    }

    // Original heavy computation extracted so it can be invoked either inline or
    // in background without duplicating logic. Behavior is unchanged.
    private suspend fun computeChinaPackageNames(): String {
        val start = SystemClock.elapsedRealtime()
        Log.d("ZhuqueGlobal", "AppPlugin.computeChinaPackageNames: start at ${start}ms thread=${Thread.currentThread().name}")
        Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} computeChinaPackageNames: scheduling checks thread=${Thread.currentThread().name}")
        return withContext(Dispatchers.Default) {
            val pkgNames = getPackages().map { it.packageName }
            Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} computeChinaPackageNames: total candidates=${pkgNames.size}")
            val deferreds = pkgNames.map { pkg ->
                async(Dispatchers.IO) {
                    val asyncStart = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} isChinaPackage async START package=${pkg} at ${asyncStart}ms thread=${Thread.currentThread().name}")
                    val hit = isChinaPackage(pkg)
                    val asyncEnd = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} isChinaPackage async END package=${pkg} result=${hit} duration=${asyncEnd - asyncStart}ms")
                    if (hit) Log.d("ZhuqueGlobal", "AppPlugin.computeChinaPackageNames: package flagged china=${pkg}")
                    hit
                }
            }
            val results = deferreds.awaitAll()
            val chinaList = pkgNames.zip(results).filter { it.second }.map { it.first }
            val end = SystemClock.elapsedRealtime()
            Log.d("ZhuqueGlobal", "AppPlugin.computeChinaPackageNames: completed in ${end - start}ms (candidates=${chinaList.size})")
            Gson().toJson(chinaList)
        }
    }

    fun requestVpnPermission(callBack: () -> Unit) {
        vpnCallBack = callBack
        val intent = VpnService.prepare(FlClashApplication.getAppContext())
        if (intent != null) {
            Log.d("ZhuqueGlobal", "AppPlugin.requestVpnPermission: starting activity for result at ${SystemClock.elapsedRealtime()}ms")
            activityRef?.get()?.startActivityForResult(intent, VPN_PERMISSION_REQUEST_CODE)
            return
        }
        vpnCallBack?.invoke()
    }

    fun requestNotificationsPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            val permission = ContextCompat.checkSelfPermission(
                FlClashApplication.getAppContext(),
                Manifest.permission.POST_NOTIFICATIONS
            )
            if (permission != PackageManager.PERMISSION_GRANTED) {
                if (isBlockNotification) return
                if (activityRef?.get() == null) return
                activityRef?.get()?.let {
                    Log.d("ZhuqueGlobal", "AppPlugin.requestNotificationsPermission: requesting at ${SystemClock.elapsedRealtime()}ms")
                    ActivityCompat.requestPermissions(
                        it,
                        arrayOf(Manifest.permission.POST_NOTIFICATIONS),
                        NOTIFICATION_PERMISSION_REQUEST_CODE
                    )
                    return
                }
            }
        }
    }

    suspend fun getText(text: String): String? {
        return withContext(Dispatchers.Default){
            channel.awaitResult<String>("getText", text)
        }
    }

    private suspend fun isChinaPackage(packageName: String): Boolean {
        val startTs = SystemClock.elapsedRealtime()
        Log.d("ZhuqueGlobal", "AppPlugin.isChinaPackage: start check ${packageName} at ${startTs}ms thread=${Thread.currentThread().name}")
        return withContext(Dispatchers.IO) {
        val packageManager = FlClashApplication.getAppContext().packageManager ?: return@withContext false
        // Fast path: if the package name matches any skip prefix, bail out quickly.
        if (skipPrefixList.any { packageName == it || packageName.startsWith("$it.") }) {
            return@withContext false
        }
        val packageManagerFlags = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            PackageManager.MATCH_UNINSTALLED_PACKAGES or PackageManager.GET_ACTIVITIES or PackageManager.GET_SERVICES or PackageManager.GET_RECEIVERS or PackageManager.GET_PROVIDERS
        } else {
            @Suppress("DEPRECATION")
            PackageManager.GET_UNINSTALLED_PACKAGES or PackageManager.GET_ACTIVITIES or PackageManager.GET_SERVICES or PackageManager.GET_RECEIVERS or PackageManager.GET_PROVIDERS
        }
        if (packageName.matches(chinaAppRegex)) {
            Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} isChinaPackage: quick match by package regex for ${packageName}")
            return@withContext true
        }
        try {
            val packageInfo = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                packageManager.getPackageInfo(
                    packageName,
                    PackageManager.PackageInfoFlags.of(packageManagerFlags.toLong())
                )
            } else {
                packageManager.getPackageInfo(
                    packageName, packageManagerFlags
                )
            }
            Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} isChinaPackage: got packageInfo for ${packageName} publicSource=${packageInfo.applicationInfo?.publicSourceDir} activities=${packageInfo.activities?.size ?: 0} services=${packageInfo.services?.size ?: 0}")
            mutableListOf<ComponentInfo>().apply {
                packageInfo.services?.let { addAll(it) }
                packageInfo.activities?.let { addAll(it) }
                packageInfo.receivers?.let { addAll(it) }
                packageInfo.providers?.let { addAll(it) }
            }.forEach {
                if (it.name.matches(chinaAppRegex)) return@withContext true
            }
            val publicSource = packageInfo.applicationInfo?.publicSourceDir
            Log.d("ZhuqueGlobal", "AppPlugin.isChinaPackage: inspecting apk publicSource=${publicSource}")
            ZipFile(File(publicSource)).use { zip ->
                val entries = zip.entries().toList()
                Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} isChinaPackage: zip entries=${entries.size} for ${packageName}")
                // Quick scan for firebase markers first.
                if (entries.any { it.name.startsWith("firebase-") }) {
                    Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} isChinaPackage: firebase markers found in ${packageName}, quick-skip")
                    return@withContext false
                }
                // Iterate dex entries; parse each on IO dispatcher only.
                for (packageEntry in entries) {
                    if (!(packageEntry.name.startsWith("classes") && packageEntry.name.endsWith(
                            ".dex"
                        ))
                    ) {
                        continue
                    }
                    if (packageEntry.size > 15_000_000) {
                        return@withContext true
                    }
                    val input = zip.getInputStream(packageEntry).buffered()
                    val dexStart = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} isChinaPackage: parsing dex entry=${packageEntry.name} size=${packageEntry.size} for ${packageName} start=${dexStart}ms")
                    val dexFile = try {
                        DexBackedDexFile.fromInputStream(null, input)
                    } catch (e: Exception) {
                        Log.w("ZhuqueGlobal", "${APPPLUGIN_TAG} isChinaPackage: failed to parse dex for ${packageName}: ${e.message}", e)
                        return@withContext false
                    }
                    val dexEnd = SystemClock.elapsedRealtime()
                    Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} isChinaPackage: parsed dex entry=${packageEntry.name} in ${dexEnd - dexStart}ms for ${packageName}")
                    for (clazz in dexFile.classes) {
                        val clazzName =
                            clazz.type.substring(1, clazz.type.length - 1).replace("/", ".")
                                .replace("$", ".")
                        if (clazzName.matches(chinaAppRegex)) return@withContext true
                    }
                }
            }
        } catch (e: Exception) {
            Log.w("ZhuqueGlobal", "${APPPLUGIN_TAG} isChinaPackage: unexpected failure when inspecting ${packageName}", e)
            return@withContext false
        }
        val endTs = SystemClock.elapsedRealtime()
        Log.d("ZhuqueGlobal", "${APPPLUGIN_TAG} isChinaPackage: completed check ${packageName} duration=${endTs - startTs}ms result=false")
        return@withContext false
    }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityRef = WeakReference(binding.activity)
        binding.addActivityResultListener(::onActivityResult)
        binding.addRequestPermissionsResultListener(::onRequestPermissionsResultListener)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activityRef = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activityRef = WeakReference(binding.activity)
    }

    override fun onDetachedFromActivity() {
        channel.invokeMethod("exit", null)
        activityRef = null
    }

    private fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == VPN_PERMISSION_REQUEST_CODE) {
            if (resultCode == FlutterActivity.RESULT_OK) {
                GlobalState.initServiceEngine()
                vpnCallBack?.invoke()
            }
        }
        return true
    }

    private fun onRequestPermissionsResultListener(
        requestCode: Int,
        permissions: Array<String>,
        grantResults: IntArray
    ): Boolean {
        if (requestCode == NOTIFICATION_PERMISSION_REQUEST_CODE) {
            isBlockNotification = true
        }
        return true
    }
}
