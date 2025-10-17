import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'dart:developer' as developer;
import 'package:archive/archive.dart';
import 'package:zhuquejiasu/clash/clash.dart';
import 'package:zhuquejiasu/common/archive.dart';
import 'package:zhuquejiasu/enum/enum.dart';
import 'package:zhuquejiasu/providers/providers.dart';
import 'package:zhuquejiasu/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common/file_crypto.dart';
import 'common/common.dart';
import 'fragments/update_dialog.dart';
import 'models/models.dart';

class AppController {
  Completer<void>? _initCompleter;

  Future<void> waitForInitCompleted() async {
    final completer = _initCompleter ??= Completer<void>();
    await completer.future;
  }

  Future<void> ensureInitializationReady() async {
    await waitForInitCompleted();
    await globalState.ensurePrewarm();
    final waitStart = DateTime.now();
    const timeout = Duration(seconds: 15);
    while (_ref.read(groupsProvider).isEmpty) {
      if (DateTime.now().difference(waitStart) > timeout) {
        throw '初始化代理列表超时';
      }
      try {
        await updateGroups();
        await updateProviders();
      } catch (_) {}
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }
  }

  bool lastTunEnable = false;
  int? lastProfileModified;

  final BuildContext context;
  final WidgetRef _ref;

  AppController(this.context, WidgetRef ref) : _ref = ref;

  updateClashConfigDebounce() {
    debouncer.call(DebounceTag.updateClashConfig, () {
      updateClashConfig(true);
    });
  }

  updateGroupsDebounce() {
    debouncer.call(DebounceTag.updateGroups, updateGroups);
  }

  addCheckIpNumDebounce() {
    debouncer.call(DebounceTag.addCheckIpNum, () {
      _ref.read(checkIpNumProvider.notifier).add();
    });
  }

  applyProfileDebounce({
    bool silence = false,
  }) {
    debouncer.call(DebounceTag.applyProfile, (silence) {
      applyProfile(silence: silence);
    }, args: [silence]);
  }

  savePreferencesDebounce() {
    debouncer.call(DebounceTag.savePreferences, savePreferences);
  }

  changeProxyDebounce(String groupName, String proxyName) {
    debouncer.call(DebounceTag.changeProxy,
        (String groupName, String proxyName) async {
      await changeProxy(
        groupName: groupName,
        proxyName: proxyName,
      );
      await updateGroups();
    }, args: [groupName, proxyName]);
  }

  restartCore() async {
    await clashService?.reStart();
    await initCore();

    if (_ref.read(runTimeProvider.notifier).isStart) {
      await globalState.handleStart();
    }
  }

  updateStatus(bool isStart) async {
    if (isStart) {
      final profile = _ref.read(currentProfileProvider);
      final currentLastModified = await profile?.profileLastModified;
      final shouldApplyProfile = profile != null &&
          (currentLastModified == null ||
              lastProfileModified == null ||
              currentLastModified > (lastProfileModified ?? 0));
      if (shouldApplyProfile) {
        await applyProfile(silence: true, refreshGroups: false);
      }
      await globalState.handleStart([
        updateRunTime,
        updateTraffic,
      ]);
      if (shouldApplyProfile) {
        Future.microtask(() async {
          try {
            await updateGroups();
            await updateProviders();
          } catch (_) {}
        });
      } else {
        addCheckIpNumDebounce();
      }
    } else {
      await globalState.handleStop();
      await clashCore.resetTraffic();
      _ref.read(trafficsProvider.notifier).clear();
      _ref.read(totalTrafficProvider.notifier).value = Traffic();
      _ref.read(runTimeProvider.notifier).value = null;
      // tray.updateTrayTitle(null);
      addCheckIpNumDebounce();
    }
  }

  updateRunTime() {
    final startTime = globalState.startTime;
    if (startTime != null) {
      final startTimeStamp = startTime.millisecondsSinceEpoch;
      final nowTimeStamp = DateTime.now().millisecondsSinceEpoch;
      _ref.read(runTimeProvider.notifier).value = nowTimeStamp - startTimeStamp;
    } else {
      _ref.read(runTimeProvider.notifier).value = null;
    }
  }

  updateTraffic() async {
    final traffic = await clashCore.getTraffic();
    _ref.read(trafficsProvider.notifier).addTraffic(traffic);
    _ref.read(totalTrafficProvider.notifier).value =
        await clashCore.getTotalTraffic();
  }

  addProfile(Profile profile) async {
    _ref.read(profilesProvider.notifier).setProfile(profile);
    if (_ref.read(currentProfileIdProvider) != null) return;
    _ref.read(currentProfileIdProvider.notifier).value = profile.id;
  }

  deleteProfile(String id) async {
    _ref.read(profilesProvider.notifier).deleteProfileById(id);
    clearEffect(id);
    if (globalState.config.currentProfileId == id) {
      final profiles = globalState.config.profiles;
      final currentProfileId = _ref.read(currentProfileIdProvider.notifier);
      if (profiles.isNotEmpty) {
        final updateId = profiles.first.id;
        currentProfileId.value = updateId;
      } else {
        currentProfileId.value = null;
        updateStatus(false);
      }
    }
  }

  updateProviders() async {
    _ref.read(providersProvider.notifier).value =
        await clashCore.getExternalProviders();
  }

  updateLocalIp() async {
    _ref.read(localIpProvider.notifier).value = null;
    await Future.delayed(commonDuration);
    _ref.read(localIpProvider.notifier).value = await other.getLocalIpAddress();
  }

  Future<void> updateProfile(Profile profile) async {
    final newProfile = await profile.update();
    _ref
        .read(profilesProvider.notifier)
        .setProfile(newProfile.copyWith(isUpdating: false));
    if (profile.id == _ref.read(currentProfileIdProvider)) {
      applyProfileDebounce(silence: true);
    }
  }

  setProfile(Profile profile) {
    _ref.read(profilesProvider.notifier).setProfile(profile);
  }

  setProfileAndAutoApply(Profile profile) {
    _ref.read(profilesProvider.notifier).setProfile(profile);
    if (profile.id == _ref.read(currentProfileIdProvider)) {
      applyProfileDebounce(silence: true);
    }
  }

  setProfiles(List<Profile> profiles) {
    _ref.read(profilesProvider.notifier).value = profiles;
  }

  addLog(Log log) {
    _ref.read(logsProvider).add(log);
  }

  updateOrAddHotKeyAction(HotKeyAction hotKeyAction) {
    final hotKeyActions = _ref.read(hotKeyActionsProvider);
    final index =
        hotKeyActions.indexWhere((item) => item.action == hotKeyAction.action);
    if (index == -1) {
      _ref.read(hotKeyActionsProvider.notifier).value = List.from(hotKeyActions)
        ..add(hotKeyAction);
    } else {
      _ref.read(hotKeyActionsProvider.notifier).value = List.from(hotKeyActions)
        ..[index] = hotKeyAction;
    }

    _ref.read(hotKeyActionsProvider.notifier).value = index == -1
        ? (List.from(hotKeyActions)..add(hotKeyAction))
        : (List.from(hotKeyActions)..[index] = hotKeyAction);
  }

  List<Group> getCurrentGroups() {
    return _ref.read(currentGroupsStateProvider.select((state) => state.value));
  }

  String getRealTestUrl(String? url) {
    return _ref.read(getRealTestUrlProvider(url));
  }

  int getProxiesColumns() {
    return _ref.read(getProxiesColumnsProvider);
  }

  addSortNum() {
    return _ref.read(sortNumProvider.notifier).add();
  }

  getCurrentGroupName() {
    final currentGroupName = _ref.read(currentProfileProvider.select(
      (state) => state?.currentGroupName,
    ));
    return currentGroupName;
  }

  ProxyCardState getProxyCardState(proxyName) {
    return _ref.read(getProxyCardStateProvider(proxyName));
  }

  getSelectedProxyName(groupName) {
    return _ref.read(getSelectedProxyNameProvider(groupName));
  }

  updateCurrentGroupName(String groupName) {
    final profile = _ref.read(currentProfileProvider);
    if (profile == null || profile.currentGroupName == groupName) {
      return;
    }
    setProfile(
      profile.copyWith(currentGroupName: groupName),
    );
  }

  Future<void> updateClashConfig([bool? isPatch]) async {
    final commonScaffoldState = globalState.homeScaffoldKey.currentState;
    if (commonScaffoldState?.mounted != true) return;
    await commonScaffoldState?.loadingRun(() async {
      await _updateClashConfig(
        isPatch,
      );
    });
  }

  Future<void> _updateClashConfig([bool? isPatch]) async {
    final profile = _ref.watch(currentProfileProvider);
    final patchConfig = _ref.read(patchClashConfigProvider);
    final appSetting = _ref.read(appSettingProvider);
    bool enableTun = patchConfig.tun.enable;
    if (enableTun != lastTunEnable &&
        lastTunEnable == false &&
        !Platform.isAndroid) {
      final code = await system.authorizeCore();
      switch (code) {
        case AuthorizeCode.none:
          break;
        case AuthorizeCode.success:
          lastTunEnable = enableTun;
          await restartCore();
          return;
        case AuthorizeCode.error:
          enableTun = false;
      }
    }
    if (appSetting.openLogs) {
      clashCore.startLog();
    } else {
      clashCore.stopLog();
    }
    final res = await clashCore.updateConfig(
      globalState.getUpdateConfigParams(isPatch),
    );
    if (res.isNotEmpty) throw res;
    lastTunEnable = enableTun;
    lastProfileModified = await profile?.profileLastModified;
    globalState.markPrewarmReady();
  }

  Future _applyProfile({bool refreshGroups = true}) async {
    await clashCore.requestGc();
    await updateClashConfig();
    if (refreshGroups) {
      await updateGroups();
      await updateProviders();
    }
    globalState.markPrewarmReady();
  }

  Future applyProfile({bool silence = false, bool refreshGroups = true}) async {
    if (silence) {
      await _applyProfile(refreshGroups: refreshGroups);
    } else {
      final commonScaffoldState = globalState.homeScaffoldKey.currentState;
      if (commonScaffoldState?.mounted != true) return;
      await commonScaffoldState?.loadingRun(() async {
        await _applyProfile(refreshGroups: refreshGroups);
      });
    }
    addCheckIpNumDebounce();
  }

  handleChangeProfile() {
    _ref.read(delayDataSourceProvider.notifier).value = {};
    applyProfile();
  }

  updateBrightness(Brightness brightness) {
    _ref.read(appBrightnessProvider.notifier).value = brightness;
  }

  autoUpdateProfiles() async {
    // 订阅由 WebDAV 备份负责，此处不再自动拉取远程订阅链接。
    return;
  }

  Future<void> updateGroups() async {
    _ref.read(groupsProvider.notifier).value = await retry(
      task: () async {
        return await clashCore.getProxiesGroups();
      },
      retryIf: (res) => res.isEmpty,
    );
  }

  updateProfiles() async {
    for (final profile in _ref.read(profilesProvider)) {
      if (profile.type == ProfileType.file) {
        continue;
      }
      await updateProfile(profile);
    }
  }

  updateSystemColorSchemes(ColorSchemes colorSchemes) {
    _ref.read(appSchemesProvider.notifier).value = colorSchemes;
  }

  savePreferences() async {
    commonPrint.log("save preferences");
    await preferences.saveConfig(globalState.config);
  }

  changeProxy({
    required String groupName,
    required String proxyName,
  }) async {
    await clashCore.changeProxy(
      ChangeProxyParams(
        groupName: groupName,
        proxyName: proxyName,
      ),
    );
    if (_ref.read(appSettingProvider).closeConnections) {
      clashCore.closeConnections();
    }
    addCheckIpNumDebounce();
  }

  handleBackOrExit() async {
    if (_ref.read(appSettingProvider).minimizeOnExit) {
      if (system.isDesktop) {
        await savePreferencesDebounce();
      }
      await system.back();
    } else {
      await handleExit();
    }
  }

  handleExit() async {
    try {
      await updateStatus(false);
      await clashCore.shutdown();
      await clashService?.destroy();
      await proxy?.stopProxy();
      await savePreferences();
    } finally {
      system.terminate();
    }
  }

  // 检查更新
  autoCheckUpdate() async {
    // if (!_ref.read(appSettingProvider).autoCheckUpdate) return;
    final res = await request.checkForUpdate();
    checkUpdateResultHandle2(data: res);
  }

  checkUpdateResultHandle2({
    dynamic data,
    bool handleError = false,
  }) async {
    if (data != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => UpdateDialog(data: data),
      );
    }
  }

  checkUpdateResultHandle({
    Map<String, dynamic>? data,
    bool handleError = false,
  }) async {
    if (data != null) {
      final tagName = data['tag_name'];
      final body = data['body'];
      final submits = other.parseReleaseBody(body);
      final textTheme = context.textTheme;
      final res = await globalState.showMessage(
        title: appLocalizations.discoverNewVersion,
        message: TextSpan(
          text: "$tagName \n",
          style: textTheme.headlineSmall,
          children: [
            TextSpan(
              text: "\n",
              style: textTheme.bodyMedium,
            ),
            for (final submit in submits)
              TextSpan(
                text: "- $submit \n",
                style: textTheme.bodyMedium,
              ),
          ],
        ),
        confirmText: appLocalizations.goDownload,
      );
      if (res != true) {
        return;
      }
      launchUrl(
        Uri.parse("https://github.com/$repository/releases/latest"),
      );
    } else if (handleError) {
      globalState.showMessage(
        title: appLocalizations.checkUpdate,
        message: TextSpan(
          text: appLocalizations.checkUpdateError,
        ),
      );
    }
  }

  _handlePreference() async {
    if (await preferences.isInit) {
      return;
    }
    final res = await globalState.showMessage(
      title: appLocalizations.tip,
      message: TextSpan(text: appLocalizations.cacheCorrupt),
    );
    if (res == true) {
      final file = File(await appPath.sharedPreferencesPath);
      final isExists = await file.exists();
      if (isExists) {
        await file.delete();
      }
    }
    await handleExit();
  }

  Future<void> initCore() async {
    final isInit = await clashCore.isInit;
    if (!isInit) {
      await clashCore.setState(
        globalState.getCoreState(),
      );
      final ok = await clashCore.init();
      if (!ok) {
        // core initialization failed (missing assets / download failed).
        // Show a non-blocking message and skip core-dependent steps.
        developer.log(
          'clashCore.init() failed - skipping applyProfile',
          name: 'AppController',
        );
        try {
          globalState.showMessage(
            title: 'Error',
            message: TextSpan(
                text: 'Core initialization failed: missing geo data assets.'),
            confirmText: 'OK',
          );
        } catch (e) {
          // If UI not ready to show message, just log it.
          developer.log(
            'unable to show init failure message',
            name: 'AppController',
            error: e,
          );
        }
        return;
      }
    }
    await applyProfile();
  }

  init() async {
    final initCompleter = _initCompleter ??= Completer<void>();
    await _handlePreference();

    /// 免责声明
    try {
      await initCore();
      await _preAuthorizeTun();
      await _initStatus();
      updateTray(true);
      autoLaunch?.updateStatus(
        _ref.read(appSettingProvider).autoLaunch,
      );
      autoCheckUpdate();
      if (!_ref.read(appSettingProvider).silentLaunch) {
        window?.show();
      } else {
        window?.hide();
      }
      _ref.read(initProvider.notifier).value = true;
      addCheckIpNumDebounce();
      if (!initCompleter.isCompleted) {
        initCompleter.complete();
      }
    } catch (e, st) {
      if (!initCompleter.isCompleted) {
        initCompleter.completeError(e, st);
      }
      rethrow;
    }
  }

  Future<void> _preAuthorizeTun() async {
    if (Platform.isAndroid) {
      return;
    }
    final patchConfig = _ref.read(patchClashConfigProvider);
    if (!patchConfig.tun.enable || lastTunEnable) {
      return;
    }
    final code = await system.authorizeCore();
    if (code == AuthorizeCode.success) {
      lastTunEnable = true;
    } else if (code == AuthorizeCode.error) {
      _ref.read(patchClashConfigProvider.notifier).value = patchConfig.copyWith(
        tun: patchConfig.tun.copyWith(enable: false),
      );
    }
  }

  _initStatus() async {
    if (Platform.isAndroid) {
      await globalState.updateStartTime();
    }
    var status = globalState.isStart == true
        ? true
        : _ref.read(appSettingProvider).autoRun;

    // 默认为不启动
    status = false;
    await updateStatus(false);
    if (!status) {
      addCheckIpNumDebounce();
    }
  }

  setDelay(Delay delay) {
    _ref.read(delayDataSourceProvider.notifier).setDelay(delay);
  }

  toPage(
    int index, {
    bool hasAnimate = false,
  }) {
    final navigations = _ref.read(currentNavigationsStateProvider).value;
    if (index > navigations.length - 1) {
      return;
    }
    _ref.read(currentPageLabelProvider.notifier).value =
        navigations[index].label;
    final isAnimateToPage = _ref.read(appSettingProvider).isAnimateToPage;
    final isMobile =
        _ref.read(viewWidthProvider.notifier).viewMode == ViewMode.mobile;
    if (isAnimateToPage && isMobile || hasAnimate) {
      globalState.pageController?.animateToPage(
        index,
        duration: kTabScrollDuration,
        curve: Curves.easeOut,
      );
    } else {
      globalState.pageController?.jumpToPage(index);
    }
  }

  toProfiles() {
    final index = _ref.read(currentNavigationsStateProvider).value.indexWhere(
          (element) => element.label == PageLabel.profiles,
        );
    if (index != -1) {
      toPage(index);
    }
  }

  initLink() {
    linkManager.initAppLinksListen(
      (url) async {
        final res = await globalState.showMessage(
          title: "${appLocalizations.add}${appLocalizations.profile}",
          message: TextSpan(
            children: [
              TextSpan(text: appLocalizations.doYouWantToPass),
              TextSpan(
                text: " $url ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              TextSpan(
                  text:
                      "${appLocalizations.create}${appLocalizations.profile}"),
            ],
          ),
        );

        if (res != true) {
          return;
        }
        addProfileFormURL(url);
      },
    );
  }

  Future<bool> showDisclaimer() async {
    return await globalState.showCommonDialog<bool>(
          dismissible: false,
          child: AlertDialog(
            title: Text(appLocalizations.disclaimer),
            content: Container(
              width: dialogCommonWidth,
              constraints: const BoxConstraints(maxHeight: 200),
              child: SingleChildScrollView(
                child: SelectableText(
                  appLocalizations.disclaimerDesc,
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop<bool>(false);
                },
                child: Text(appLocalizations.exit),
              ),
              TextButton(
                onPressed: () {
                  _ref.read(appSettingProvider.notifier).updateState(
                        (state) => state.copyWith(disclaimerAccepted: true),
                      );
                  Navigator.of(context).pop<bool>(true);
                },
                child: Text(appLocalizations.agree),
              )
            ],
          ),
        ) ??
        false;
  }

  addProfileFormURL(String url) async {
    if (globalState.navigatorKey.currentState?.canPop() ?? false) {
      globalState.navigatorKey.currentState?.popUntil((route) => route.isFirst);
    }
    toProfiles();
    final commonScaffoldState = globalState.homeScaffoldKey.currentState;
    if (commonScaffoldState?.mounted != true) return;
    final profile = await commonScaffoldState?.loadingRun<Profile>(
      () async {
        return await Profile.normal(
          url: url,
        ).update();
      },
      title: "${appLocalizations.add}${appLocalizations.profile}",
    );
    if (profile != null) {
      await addProfile(profile);
    }
  }

  addProfileFormFile() async {
    final platformFile = await globalState.safeRun(picker.pickerFile);
    final bytes = platformFile?.bytes;
    if (bytes == null) {
      return null;
    }
    if (!context.mounted) return;
    globalState.navigatorKey.currentState?.popUntil((route) => route.isFirst);
    toProfiles();
    final commonScaffoldState = globalState.homeScaffoldKey.currentState;
    if (commonScaffoldState?.mounted != true) return;
    final profile = await commonScaffoldState?.loadingRun<Profile?>(
      () async {
        await Future.delayed(const Duration(milliseconds: 300));
        return await Profile.normal(label: platformFile?.name).saveFile(bytes);
      },
      title: "${appLocalizations.add}${appLocalizations.profile}",
    );
    if (profile != null) {
      await addProfile(profile);
    }
  }

  addProfileFormQrCode() async {
    final url = await globalState.safeRun(picker.pickerConfigQRCode);
    if (url == null) return;
    addProfileFormURL(url);
  }

  updateViewWidth(double width) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ref.read(viewWidthProvider.notifier).value = width;
    });
  }

  setProvider(ExternalProvider? provider) {
    _ref.read(providersProvider.notifier).setProvider(provider);
  }

  List<Proxy> _sortOfName(List<Proxy> proxies) {
    return List.of(proxies)
      ..sort(
        (a, b) => other.sortByChar(
          other.getPinyin(a.name),
          other.getPinyin(b.name),
        ),
      );
  }

  List<Proxy> _sortOfDelay({
    required List<Proxy> proxies,
    String? testUrl,
  }) {
    return List.of(proxies)
      ..sort(
        (a, b) {
          final aDelay =
              _ref.read(getDelayProvider(proxyName: a.name, testUrl: testUrl));
          final bDelay =
              _ref.read(getDelayProvider(proxyName: b.name, testUrl: testUrl));
          if (aDelay == null && bDelay == null) {
            return 0;
          }
          if (aDelay == null || aDelay == -1) {
            return 1;
          }
          if (bDelay == null || bDelay == -1) {
            return -1;
          }
          return aDelay.compareTo(bDelay);
        },
      );
  }

  List<Proxy> getSortProxies(List<Proxy> proxies, [String? url]) {
    return switch (_ref.read(proxiesStyleSettingProvider).sortType) {
      ProxiesSortType.none => proxies,
      ProxiesSortType.delay => _sortOfDelay(
          proxies: proxies,
          testUrl: url,
        ),
      ProxiesSortType.name => _sortOfName(proxies),
    };
  }

  clearEffect(String profileId) async {
    final profilePath = await appPath.getProfilePath(profileId);
    final providersPath = await appPath.getProvidersPath(profileId);
    return await Isolate.run(() async {
      if (profilePath != null) {
        await File(profilePath).delete(recursive: true);
      }
      if (providersPath != null) {
        await File(providersPath).delete(recursive: true);
      }
    });
  }

  updateTun() {
    _ref.read(patchClashConfigProvider.notifier).updateState(
          (state) => state.copyWith.tun(enable: !state.tun.enable),
        );
  }

  updateSystemProxy() {
    _ref.read(networkSettingProvider.notifier).updateState(
          (state) => state.copyWith(
            systemProxy: !state.systemProxy,
          ),
        );
  }

  updateStart() {
    updateStatus(!_ref.read(runTimeProvider.notifier).isStart);
  }

  updateCurrentSelectedMap(String groupName, String proxyName) {
    final currentProfile = _ref.read(currentProfileProvider);
    if (currentProfile != null &&
        currentProfile.selectedMap[groupName] != proxyName) {
      final SelectedMap selectedMap = Map.from(
        currentProfile.selectedMap,
      )..[groupName] = proxyName;
      _ref.read(profilesProvider.notifier).setProfile(
            currentProfile.copyWith(
              selectedMap: selectedMap,
            ),
          );
    }
  }

  updateCurrentUnfoldSet(Set<String> value) {
    final currentProfile = _ref.read(currentProfileProvider);
    if (currentProfile == null) {
      return;
    }
    _ref.read(profilesProvider.notifier).setProfile(
          currentProfile.copyWith(
            unfoldSet: value,
          ),
        );
  }

  changeMode(Mode mode) {
    _ref.read(patchClashConfigProvider.notifier).updateState(
          (state) => state.copyWith(mode: mode),
        );
    // if (mode == Mode.global) {
    //   updateCurrentGroupName(GroupName.GLOBAL.name);
    // }
    // addCheckIpNumDebounce();
  }

  updateAutoLaunch() {
    _ref.read(appSettingProvider.notifier).updateState(
          (state) => state.copyWith(
            autoLaunch: !state.autoLaunch,
          ),
        );
  }

  updateVisible() async {
    final visible = await window?.isVisible();
    if (visible != null && !visible) {
      window?.show();
    } else {
      window?.hide();
    }
  }

  updateMode() {
    _ref.read(patchClashConfigProvider.notifier).updateState(
      (state) {
        final index = Mode.values.indexWhere((item) => item == state.mode);
        if (index == -1) {
          return null;
        }
        final nextIndex = index + 1 > Mode.values.length - 1 ? 0 : index + 1;
        return state.copyWith(
          mode: Mode.values[nextIndex],
        );
      },
    );
  }

  Future<bool> exportLogs() async {
    final logsRaw = _ref.read(logsProvider).list.map(
          (item) => item.toString(),
        );
    final data = await Isolate.run<List<int>>(() async {
      final logsRawString = logsRaw.join("\n");
      return utf8.encode(logsRawString);
    });
    return await picker.saveFile(
          other.logFile,
          Uint8List.fromList(data),
        ) !=
        null;
  }

  Future<List<int>> backupData() async {
    final homeDirPath = await appPath.homeDirPath;
    final profilesPath = await appPath.profilesPath;
    final configJson = globalState.config.toJson();
    return Isolate.run<List<int>>(() async {
      final archive = Archive();
      archive.addJson("config.json", configJson);
      archive.addDirectoryToArchive(profilesPath, homeDirPath);
      final zipEncoder = ZipEncoder();
      return zipEncoder.encode(archive);
    });
  }

  updateTray([bool focus = false]) async {
    tray.update(
      trayState: _ref.read(trayStateProvider),
    );
  }

  recoveryData(
    List<int> data,
    RecoveryOption recoveryOption,
  ) async {
    final archive = await Isolate.run<Archive>(() {
      final zipDecoder = ZipDecoder();
      return zipDecoder.decodeBytes(data);
    });
    final homeDirPath = await appPath.homeDirPath;
    final configs =
        archive.files.where((item) => item.name.endsWith(".enc")).toList();
    final profiles = archive.files.where((item) => !item.name.endsWith(".enc"));
    final configIndex =
        configs.indexWhere((config) => config.name == "config.enc");
    if (configIndex == -1) throw "invalid backup file";
    final configFile = configs[configIndex];

    // 先将 Uint8List 转换为字符串
    final contentString = String.fromCharCodes(configFile.content);
    final cleanContent = contentString.replaceAll(RegExp(r'^"|"$'), '');
    var dec = FileCrypto.decryptContent(cleanContent);
    var tempConfig = Config.compatibleFromJson(
      json.decode(dec),
    );
    for (final profile in profiles) {
      final filePath = join(homeDirPath, profile.name);
      final file = File(filePath);
      await file.create(recursive: true);

      // 转换为字符串
      // final encryptedContent = utf8.decode(profile.content);
      // final contentString =  String.fromCharCodes(profile.content);
      // final cleanContent = contentString.replaceAll(RegExp(r'^"|"$'), '');
      // var dec = FileCrypto.decryptContent(encryptedContent);
      await file.writeAsBytes(profile.content);
      // await file.writeAsString(dec);
    }
    final clashConfigIndex =
        configs.indexWhere((config) => config.name == "clashConfig.json");
    if (clashConfigIndex != -1) {
      final clashConfigFile = configs[clashConfigIndex];
      tempConfig = tempConfig.copyWith(
        patchClashConfig: ClashConfig.fromJson(
          json.decode(
            FileCrypto.decryptContent(utf8.decode(
              clashConfigFile.content,
            )),
          ),
        ),
      );
    }
    _recovery(
      tempConfig,
      recoveryOption,
    );
  }

  bool hasWebDAV() {
    final profiles = _ref.read(profilesProvider);
    return profiles.isNotEmpty;
  }

  Future<void> clearWebDAV() async {
    // 1. 清空 WebDAV Provider 数据
    // _ref.read(appDAVSettingProvider.notifier).value = null; // 或者 {}
    //
    // // 2. 清空代理相关的 Provider 数据
    // _ref.read(profilesProvider.notifier).value = [];
    //
    // _ref.read(currentProfileIdProvider.notifier).value = '0';
    //
    // // 2. 删除 WebDAV 下载的文件
    // final homeDirPath = await appPath.homeDirPath;
    // final dir = Directory(homeDirPath);
    //
    // if (await dir.exists()) {
    //   final files = dir.listSync(); // 列出所有文件和文件夹
    //   for (var file in files) {
    //     if (file is File) {
    //       await file.delete(); // 删除文件
    //     }
    //   }
    // }
  }

  _recovery(Config config, RecoveryOption recoveryOption) {
    final profiles = config.profiles;
    for (final profile in profiles) {
      _ref.read(profilesProvider.notifier).setProfile(profile);
    }
    final onlyProfiles = recoveryOption == RecoveryOption.onlyProfiles;
    if (onlyProfiles) {
      final currentProfile = _ref.read(currentProfileProvider);
      if (currentProfile != null) {
        _ref.read(currentProfileIdProvider.notifier).value = profiles.first.id;
      }
      return;
    }
    _ref.read(patchClashConfigProvider.notifier).value =
        config.patchClashConfig;
    _ref.read(appSettingProvider.notifier).value = config.appSetting;
    _ref.read(currentProfileIdProvider.notifier).value =
        config.currentProfileId;
    _ref.read(appDAVSettingProvider.notifier).value = config.dav;
    _ref.read(themeSettingProvider.notifier).value = config.themeProps;
    _ref.read(windowSettingProvider.notifier).value = config.windowProps;
    _ref.read(vpnSettingProvider.notifier).value = config.vpnProps;
    _ref.read(proxiesStyleSettingProvider.notifier).value = config.proxiesStyle;
    _ref.read(overrideDnsProvider.notifier).value = config.overrideDns;
    _ref.read(networkSettingProvider.notifier).value = config.networkProps;
    _ref.read(hotKeyActionsProvider.notifier).value = config.hotKeyActions;
  }
}
