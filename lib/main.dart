import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/plugins/app.dart';
import 'package:fl_clash/plugins/tile.dart';
import 'package:fl_clash/plugins/vpn.dart';
import 'package:fl_clash/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sp_util/sp_util.dart';

import 'application.dart';
import 'clash/core.dart';
import 'clash/lib.dart';
import 'common/common.dart';
import 'models/models.dart';

// Keep a reference to the service isolate's ReceivePort so it is not
// garbage-collected after the entrypoint returns. Register its SendPort
// with IsolateNameServer so other isolates can look it up.
ReceivePort? _serviceKeepAlive;

Future<void> main() async {
  globalState.isService = false;
  WidgetsFlutterBinding.ensureInitialized();
  final version = await system.version;
  // On Android, defer preload of the native clash service so it does not
  // block the main isolate during critical startup frames. This prevents
  // service initialization (which drives native->Dart handoff) from
  // contributing to PerfMonitor long-frame kills during cold start.
  // Keep the original synchronous preload on non-Android platforms.
  if (Platform.isAndroid) {
    // Schedule as an event so main() can continue and render first frame.
    Timer.run(() {
      clashCore.preload();
    });
  } else {
    await clashCore.preload();
  }
  await globalState.initApp(version);
  await android?.init();
  await window?.init(version);
  HttpOverrides.global = FlClashHttpOverrides();

  await SpUtil.getInstance(); // 初始化 SpUtil

  runApp(ProviderScope(
    child: const Application(),
  ));
}

@pragma('vm:entry-point')
Future<void> _service(List<String> flags) async {
  // Minimal synchronous work so native executeDartEntrypoint finishes quickly.
  globalState.isService = true;
  WidgetsFlutterBinding.ensureInitialized();
  commonPrint.log('service entrypoint: start');

  // Create a top-level ReceivePort and keep a reference so it is not
  // garbage-collected when this function returns. Register the SendPort
  // with the IsolateNameServer so the main isolate (or native code)
  // can look it up if needed.
  _serviceKeepAlive = ReceivePort();
  try {
    IsolateNameServer.removePortNameMapping(serviceIsolate);
  } catch (_) {}
  IsolateNameServer.registerPortWithName(
    _serviceKeepAlive!.sendPort,
    serviceIsolate,
  );

  // Listen for an explicit stop message; this mirrors previous behavior
  // where a 'stop' is sent to terminate the service isolate.
  _serviceKeepAlive!.listen((message) {
    if (message == 'stop') {
      try {
        IsolateNameServer.removePortNameMapping(serviceIsolate);
      } catch (_) {}
      commonPrint.log('service isolate: received stop message; closing keep-alive port');
      try {
        _serviceKeepAlive?.close();
      } catch (_) {}
      // Do NOT exit the process from the service isolate. Let the main
      // isolate perform any teardown it needs without terminating the app.
      return;
    }
  });

  // Start the real (potentially expensive) initialization asynchronously
  // as an event (not a microtask) so the entrypoint can yield immediately.
  // Use Timer.run to schedule work after the microtask queue is drained.
  Timer.run(() {
    final keepAliveSend = _serviceKeepAlive!.sendPort;
    _serviceInit(flags, keepAliveSend).catchError((e, s) {
      // Avoid exiting the entire process from the service isolate.
      // Previously this would call exit(1) and terminate the app when
      // service initialization failed, which matches the "consumer
      // closed input channel" + process death observed in logs.
      commonPrint.log('service init failed: $e\n$s');
      try {
        keepAliveSend.send('stop');
      } catch (_) {
        // best-effort only
      }
      // Do not call exit here — leave the isolate alive for diagnostics.
    });
  });
  commonPrint.log('service entrypoint: scheduled init and returning');
  // returning without awaiting keeps the synchronous entrypoint tiny
  // Do NOT await the keep-alive port here — returning lets the native side
  // consider the entrypoint complete while the isolate remains alive
  // because of the top-level _serviceKeepAlive reference.
}

// Move the previous heavy service startup into this helper which runs
// asynchronously after the entrypoint yields. This keeps the initial
// synchronous time small to avoid PerfMonitor watchdog triggers.
Future<void> _serviceInit(List<String> flags, SendPort keepAliveSend) async {
  final quickStart = flags.contains("quick");
  final clashLibHandler = ClashLibHandler();
  await globalState.init();

  tile?.addListener(
    _TileListenerWithService(
      onStop: () async {
        await app?.tip(appLocalizations.stopVpn);
        clashLibHandler.stopListener();
        clashLibHandler.stopTun();
        await vpn?.stop();
        // allow main isolate to terminate normally
        try {
          keepAliveSend.send('stop');
        } catch (_) {}
        commonPrint.log('service tile:onStop -> requested stop; closing keep-alive port');
        try {
          _serviceKeepAlive?.close();
        } catch (_) {}
        return;
      },
    ),
  );

  vpn?.handleGetStartForegroundParams = () {
    final traffic = clashLibHandler.getTraffic();
    return json.encode({
      "title": clashLibHandler.getCurrentProfileName(),
      "content": "$traffic"
    });
  };

  vpn?.addListener(
    _VpnListenerWithService(
      onStarted: (int fd) {
        commonPrint.log("vpn started fd: $fd");
        final time = clashLibHandler.startTun(fd);
        commonPrint.log("vpn start tun time: $time");
      },
      onDnsChanged: (String dns) {
        clashLibHandler.updateDns(dns);
      },
    ),
  );

  final invokeReceiverPort = ReceivePort();

  clashLibHandler.attachInvokePort(
    invokeReceiverPort.sendPort.nativePort,
  );

  invokeReceiverPort.listen(
    (message) async {
      final invokeMessage = InvokeMessage.fromJson(json.decode(message));
      switch (invokeMessage.type) {
        case InvokeMessageType.protect:
          final fd = Fd.fromJson(invokeMessage.data);
          await vpn?.setProtect(fd.value);
          clashLibHandler.setFdMap(fd.id);
        case InvokeMessageType.process:
          final process = ProcessData.fromJson(invokeMessage.data);
          final processName = await vpn?.resolverProcess(process) ?? "";
          clashLibHandler.setProcessMap(
            ProcessMapItem(
              id: process.id,
              value: processName,
            ),
          );
      }
    },
  );
  if (!quickStart) {
    _handleMainIpc(clashLibHandler);
  } else {
    commonPrint.log("quick start");
    await ClashCore.initGeo();
    app?.tip(appLocalizations.startVpn);
    final homeDirPath = await appPath.homeDirPath;
    clashLibHandler
        .quickStart(
      homeDirPath,
      globalState.getUpdateConfigParams(),
      globalState.getCoreState(),
    )
        .then(
      (res) async {
        if (res.isNotEmpty) {
          await vpn?.stop();
          try {
            keepAliveSend.send('stop');
          } catch (_) {}
          commonPrint.log('service quickStart: non-empty res -> requested stop');
          try {
            _serviceKeepAlive?.close();
          } catch (_) {}
          return;
        }
        await vpn?.start(
          clashLibHandler.getAndroidVpnOptions(),
        );
        clashLibHandler.startListener();
      },
    );
  }
}

_handleMainIpc(ClashLibHandler clashLibHandler) {
  final sendPort = IsolateNameServer.lookupPortByName(mainIsolate);
  if (sendPort == null) {
    return;
  }
  final serviceReceiverPort = ReceivePort();
  serviceReceiverPort.listen((message) async {
    final res = await clashLibHandler.invokeAction(message);
    sendPort.send(res);
  });
  sendPort.send(serviceReceiverPort.sendPort);
  final messageReceiverPort = ReceivePort();
  clashLibHandler.attachMessagePort(
    messageReceiverPort.sendPort.nativePort,
  );
  messageReceiverPort.listen((message) {
    sendPort.send(message);
  });
}

@immutable
class _TileListenerWithService with TileListener {
  final Function() _onStop;

  const _TileListenerWithService({
    required Function() onStop,
  }) : _onStop = onStop;

  @override
  void onStop() {
    _onStop();
  }
}

@immutable
class _VpnListenerWithService with VpnListener {
  final Function(int fd) _onStarted;
  final Function(String dns) _onDnsChanged;

  const _VpnListenerWithService({
    required Function(int fd) onStarted,
    required Function(String dns) onDnsChanged,
  })  : _onStarted = onStarted,
        _onDnsChanged = onDnsChanged;

  @override
  void onStarted(int fd) {
    super.onStarted(fd);
    _onStarted(fd);
  }

  @override
  void onDnsChanged(String dns) {
    super.onDnsChanged(dns);
    _onDnsChanged(dns);
  }
}
