import 'dart:async';

import 'package:animations/animations.dart';
import 'package:zhuquejiasu/clash/clash.dart';
import 'package:zhuquejiasu/enum/enum.dart';
import 'package:zhuquejiasu/l10n/l10n.dart';
import 'package:zhuquejiasu/plugins/service.dart';
import 'package:zhuquejiasu/widgets/scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common/common.dart';
import 'controller.dart';
import 'models/models.dart';
import 'models/user.dart';

typedef UpdateTasks = List<FutureOr Function()>;

class GlobalState {
  static GlobalState? _instance;
  bool isService = false;
  Timer? timer;
  Timer? groupsUpdateTimer;
  late Config config;
  late AppState appState;
  late PackageInfo packageInfo;
  Function? updateCurrentDelayDebounce;
  PageController? pageController;
  late Measure measure;
  DateTime? startTime;
  UpdateTasks tasks = [];
  final safeMessageOffsetNotifier = ValueNotifier(Offset.zero);
  final navigatorKey = GlobalKey<NavigatorState>();
  late AppController appController;

  Completer<void>? _prewarmCompleter;

  late User user;

  GlobalKey<CommonScaffoldState> homeScaffoldKey = GlobalKey();

  bool get isStart => startTime != null && startTime!.isBeforeNow;

  GlobalState._internal();

  factory GlobalState() {
    _instance ??= GlobalState._internal();
    return _instance!;
  }

  PackageInfo _fallbackPackageInfo() {
    return PackageInfo(
      appName: appName,
      packageName: "com.follow.zhuque",
      version: "0.0.0",
      buildNumber: "0",
    );
  }

  Future<PackageInfo> _resolvePackageInfo() async {
    if (system.isHarmony) {
      return _fallbackPackageInfo();
    }
    try {
      return await PackageInfo.fromPlatform();
    } on MissingPluginException catch (error, stackTrace) {
      debugPrint(
        "[GlobalState] PackageInfo.fromPlatform missing: $error\n$stackTrace",
      );
      return _fallbackPackageInfo();
    } catch (error, stackTrace) {
      debugPrint(
        "[GlobalState] PackageInfo.fromPlatform failed: $error\n$stackTrace",
      );
      return _fallbackPackageInfo();
    }
  }

  initApp(int version) async {
    commonPrint.log("GlobalState.initApp start version=$version");
    appState = AppState(
      version: version,
      viewWidth: other.getScreenSize().width,
      requests: FixedList(1000),
      logs: FixedList(1000),
      traffics: FixedList(30),
      totalTraffic: Traffic(),
    );
    await init();
    schedulePrewarm();
    commonPrint.log("GlobalState.initApp completed");
  }

  init() async {
    commonPrint.log("GlobalState.init start");
    packageInfo = await _resolvePackageInfo();
    config =
        await preferences.getConfig() ?? Config(themeProps: defaultThemeProps);
    await globalState.migrateOldData(config);
    await AppLocalizations.load(
      other.getLocaleForString(config.appSetting.locale) ??
          WidgetsBinding.instance.platformDispatcher.locale,
    );
    commonPrint.log(
      "GlobalState.init loaded config profiles=${config.profiles.length}",
    );
  }

  String get ua => config.patchClashConfig.globalUa ?? packageInfo.ua;

  startUpdateTasks([UpdateTasks? tasks]) async {
    if (timer != null && timer!.isActive == true) return;
    if (tasks != null) {
      this.tasks = tasks;
    }
    await executorUpdateTask();
    timer = Timer(const Duration(seconds: 1), () async {
      startUpdateTasks();
    });
  }

  executorUpdateTask() async {
    for (final task in tasks) {
      await task();
    }
    timer = null;
  }

  stopUpdateTasks() {
    if (timer == null || timer?.isActive == false) return;
    timer?.cancel();
    timer = null;
  }

  handleStart([UpdateTasks? tasks]) async {
    startTime ??= DateTime.now();
    await ensurePrewarm();
    await clashCore.startListener();
    await service?.startVpn();
    unawaited(clashCore.maybeUpdateGeoAssets());
    startUpdateTasks(tasks);
  }

  Future updateStartTime() async {
    startTime = await clashLib?.getRunTime();
  }

  Future handleStop() async {
    startTime = null;
    await clashCore.stopListener();
    await clashLib?.stopTun();
    await service?.stopVpn();
    stopUpdateTasks();
  }

  Future<bool?> showMessage({
    required String title,
    required InlineSpan message,
    String? confirmText,
    bool cancelable = true,
  }) async {
    return await showCommonDialog<bool>(
      child: Builder(
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Container(
              width: 300,
              constraints: const BoxConstraints(maxHeight: 200),
              child: SingleChildScrollView(
                child: SelectableText.rich(
                  TextSpan(
                    style: Theme.of(context).textTheme.labelLarge,
                    children: [message],
                  ),
                  style: const TextStyle(overflow: TextOverflow.visible),
                ),
              ),
            ),
            actions: [
              if (cancelable)
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(appLocalizations.cancel),
                ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(confirmText ?? appLocalizations.confirm),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<T?> showCommonDialog<T>({
    required Widget child,
    bool dismissible = true,
  }) async {
    final navigatorState = navigatorKey.currentState;
    final context = navigatorState?.context ?? navigatorKey.currentContext;
    if (context == null) {
      debugPrint(
        "[GlobalState] showCommonDialog skipped: navigator context not ready",
      );
      return null;
    }
    return await showModal<T>(
      context: context,
      configuration: FadeScaleTransitionConfiguration(
        barrierColor: Colors.black38,
        barrierDismissible: dismissible,
      ),
      builder: (_) => child,
      filter: filter,
    );
  }

  Future<T?> safeRun<T>(
    FutureOr<T> Function() futureFunction, {
    String? title,
    bool silence = true,
  }) async {
    try {
      final res = await futureFunction();
      return res;
    } catch (e) {
      commonPrint.log("$e");
      if (silence) {
        showNotifier(e.toString());
      } else {
        showMessage(
          title: title ?? appLocalizations.tip,
          message: TextSpan(text: e.toString()),
        );
      }
      return null;
    }
  }

  showNotifier(String text) {
    if (text.isEmpty) {
      return;
    }
    final context = navigatorKey.currentContext;
    if (context == null) {
      debugPrint(
        "[GlobalState] showNotifier skipped: navigator context not ready -> $text",
      );
      return;
    }
    context.showNotifier(text);
  }

  openUrl(String url) async {
    final res = await showMessage(
      message: TextSpan(text: url),
      title: appLocalizations.externalLink,
      confirmText: appLocalizations.go,
    );
    if (res != true) {
      return;
    }
    launchUrl(Uri.parse(url));
  }

  Future<void> migrateOldData(Config config) async {
    final clashConfig = await preferences.getClashConfig();
    if (clashConfig != null) {
      config = config.copyWith(patchClashConfig: clashConfig);
      preferences.clearClashConfig();
      preferences.saveConfig(config);
    }
  }

  CoreState getCoreState() {
    final currentProfile = config.currentProfile;
    return CoreState(
      vpnProps: config.vpnProps,
      onlyStatisticsProxy: config.appSetting.onlyStatisticsProxy,
      currentProfileName: currentProfile?.label ?? currentProfile?.id ?? "",
      bypassDomain: config.networkProps.bypassDomain,
    );
  }

  getUpdateConfigParams([bool? isPatch]) {
    final currentProfile = config.currentProfile;
    final clashConfig = config.patchClashConfig;
    return UpdateConfigParams(
      profileId: config.currentProfileId ?? "",
      config: clashConfig.copyWith(
        globalUa: ua,
        tun: clashConfig.tun.copyWith(
          routeAddress: config.networkProps.routeMode == RouteMode.bypassPrivate
              ? defaultBypassPrivateRouteAddress
              : clashConfig.tun.routeAddress,
        ),
      ),
      params: ConfigExtendedParams(
        isPatch: isPatch ?? false,
        selectedMap: currentProfile?.selectedMap ?? {},
        overrideDns: config.overrideDns,
        testUrl: config.appSetting.testUrl,
      ),
    );
  }

  void schedulePrewarm({bool force = false}) {
    if (!force &&
        _prewarmCompleter != null &&
        !(_prewarmCompleter?.isCompleted ?? true)) {
      return;
    }
    final completer = Completer<void>();
    _prewarmCompleter = completer;
    Future(() async {
      try {
        await clashCore.preload();
        await ClashCore.initGeo();
        final params = getUpdateConfigParams();
        final hasProfile =
            params.profileId.isNotEmpty ||
            config.profiles.isNotEmpty ||
            config.currentProfileId != null;
        if (!hasProfile) {
          return;
        }
        final res = await clashCore.updateConfig(params);
        if (res.isNotEmpty) {
          commonPrint.log('[Prewarm] updateConfig failed: $res');
        }
        try {
          final controller = appController;
          await controller.applyProfile(silence: true);
          await controller.updateGroups();
        } catch (_) {
          // appController 尚未就绪时忽略，待后续流程处理
        }
      } catch (e, st) {
        commonPrint.log('[Prewarm] error: $e');
        commonPrint.log('$st');
      } finally {
        if (!completer.isCompleted) {
          completer.complete();
        }
      }
    });
  }

  Future<void> ensurePrewarm() async {
    if (_prewarmCompleter == null) {
      schedulePrewarm();
    }
    try {
      await _prewarmCompleter?.future;
    } catch (_) {}
  }

  void markPrewarmReady() {
    final completer = _prewarmCompleter;
    if (completer == null) {
      _prewarmCompleter = Completer<void>()..complete();
      return;
    }
    if (!completer.isCompleted) {
      completer.complete();
    }
  }
}

final globalState = GlobalState();
