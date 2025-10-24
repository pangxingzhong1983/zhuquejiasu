import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:zhuquejiasu/clash/geo_manager.dart';

import 'package:zhuquejiasu/clash/clash.dart';
import 'package:zhuquejiasu/clash/interface.dart';
import 'package:zhuquejiasu/common/common.dart';
import 'package:zhuquejiasu/enum/enum.dart';
import 'package:zhuquejiasu/models/models.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class ClashCore {
  static ClashCore? _instance;
  late ClashHandlerInterface clashInterface;
  Future<void>? _geoUpdateFuture;

  static const List<MapEntry<String, String>> _geoUpdateTargets = [
    MapEntry('GeoSite', geoSiteFileName),
    MapEntry('GeoIp', geoIpFileName),
    MapEntry('ASN', asnFileName),
    MapEntry('MMDB', mmdbFileName),
  ];

  ClashCore._internal() {
    if (system.isHarmony) {
      clashInterface = HarmonyClashStub();
      commonPrint.log(
        "ClashCore: HarmonyOS detected, using stubbed clash interface.",
      );
    } else if (Platform.isAndroid) {
      clashInterface = clashLib!;
    } else if (clashService != null) {
      clashInterface = clashService!;
    } else {
      clashInterface = HarmonyClashStub();
      commonPrint.log(
        "ClashCore: No compatible clash backend available, falling back to stub.",
      );
    }
  }

  factory ClashCore() {
    _instance ??= ClashCore._internal();
    return _instance!;
  }

  Future<bool> preload() {
    return clashInterface.preload();
  }

  static Future<bool> initGeo() async {
    final homePath = await appPath.homeDirPath;
    final homeDir = Directory(homePath);
    final isExists = await homeDir.exists();
    if (!isExists) {
      await homeDir.create(recursive: true);
    }
    const geoFileNameList = [
      mmdbFileName,
      geoIpFileName,
      geoSiteFileName,
      asnFileName,
    ];
    // Try to ensure each asset exists under the app home path. Prefer local
    // bundled assets; if missing try to download from trusted mirrors.
    final mirrors = ['https://dav.zhuquejiasu.uk/ZhuqueJiasu/assets/data/'];
    final dio = Dio(
      BaseOptions(
        responseType: ResponseType.bytes,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );

    bool anyFailed = false;
    for (final geoFileName in geoFileNameList) {
      final geoFile = File(join(homePath, geoFileName));
      try {
        if (await geoFile.exists()) continue;

        // Try bundled asset first
        try {
          final data = await rootBundle.load('assets/data/$geoFileName');
          final bytes = data.buffer.asUint8List();
          if (bytes.isNotEmpty) {
            await geoFile.writeAsBytes(bytes, flush: true);
            continue;
          }
        } catch (assetErr) {
          // asset not present or failed to load, fall through to download
        }

        // Attempt download from mirrors with a few retries
        bool downloaded = false;
        for (final base in mirrors) {
          final url = '$base$geoFileName';
          for (int attempt = 0; attempt < 3; attempt++) {
            try {
              final resp = await dio.get<List<int>>(url);
              final bytes = resp.data;
              if (bytes != null && bytes.isNotEmpty) {
                await geoFile.writeAsBytes(bytes, flush: true);
                downloaded = true;
                break;
              }
            } catch (e) {
              // retry
            }
          }
          if (downloaded) break;
        }

        if (!downloaded) {
          anyFailed = true;
          developer.log(
            'initGeo failed for asset: assets/data/$geoFileName',
            name: 'ClashCore',
          );
          developer.log(
            'error: asset missing and download attempts failed',
            name: 'ClashCore',
          );
        }
      } catch (e, st) {
        anyFailed = true;
        developer.log(
          'initGeo unexpected error for asset: assets/data/$geoFileName',
          name: 'ClashCore',
          error: e,
          stackTrace: st,
        );
      }
    }

    return !anyFailed;
  }

  Future<bool> init() async {
    // Ensure geo assets are available and valid. GeoManager encapsulates
    // bundled-asset loading, download fallback and optional checksum checks.
    final geoOk = await GeoManager.ensureGeoAssets();
    if (!geoOk) {
      developer.log(
        'init aborted: geo assets not available',
        name: 'ClashCore',
      );
      return false;
    }
    final homeDirPath = await appPath.homeDirPath;
    return await clashInterface.init(homeDirPath);
  }

  Future<bool> setState(CoreState state) async {
    return await clashInterface.setState(state);
  }

  shutdown() async {
    await clashInterface.shutdown();
  }

  FutureOr<bool> get isInit => clashInterface.isInit;

  FutureOr<String> validateConfig(String data) {
    return clashInterface.validateConfig(data);
  }

  Future<String> updateConfig(UpdateConfigParams updateConfigParams) async {
    return await clashInterface.updateConfig(updateConfigParams);
  }

  Future<String> setupConfig(SetupParams setupParams) async {
    developer.log(
      'setupConfig called with params: ${setupParams.toString()}',
      name: 'ClashCore',
    );
    try {
      final result = await clashInterface.setupConfig(setupParams);
      developer.log('setupConfig success: $result', name: 'ClashCore');
      return result;
    } catch (e) {
      developer.log(
        'setupConfig error',
        name: 'ClashCore',
        error: e,
        stackTrace: StackTrace.current,
      );
      rethrow;
    }
  }

  Future<List<Group>> getProxiesGroups() async {
    final proxiesRawString = await clashInterface.getProxies();
    return Isolate.run<List<Group>>(() {
      if (proxiesRawString.isEmpty) return [];
      final proxies = (json.decode(proxiesRawString) ?? {}) as Map;
      if (proxies.isEmpty) return [];
      final groupNames = [
        UsedProxy.GLOBAL.name,
        ...(proxies[UsedProxy.GLOBAL.name]["all"] as List).where((e) {
          final proxy = proxies[e] ?? {};
          return GroupTypeExtension.valueList.contains(proxy['type']);
        }),
      ];
      final groupsRaw = groupNames.map((groupName) {
        final group = proxies[groupName];
        group["all"] = ((group["all"] ?? []) as List)
            .map((name) => proxies[name])
            .where((proxy) => proxy != null)
            .toList();
        return group;
      }).toList();
      return groupsRaw.map((e) => Group.fromJson(e)).toList();
    });
  }

  FutureOr<String> changeProxy(ChangeProxyParams changeProxyParams) async {
    return await clashInterface.changeProxy(changeProxyParams);
  }

  Future<List<Connection>> getConnections() async {
    final res = await clashInterface.getConnections();
    final connectionsData = json.decode(res) as Map;
    final connectionsRaw = connectionsData['connections'] as List? ?? [];
    return connectionsRaw.map((e) => Connection.fromJson(e)).toList();
  }

  closeConnection(String id) {
    clashInterface.closeConnection(id);
  }

  closeConnections() {
    clashInterface.closeConnections();
  }

  Future<List<ExternalProvider>> getExternalProviders() async {
    final externalProvidersRawString = await clashInterface
        .getExternalProviders();
    if (externalProvidersRawString.isEmpty) {
      return [];
    }
    return Isolate.run<List<ExternalProvider>>(() {
      final externalProviders =
          (json.decode(externalProvidersRawString) as List<dynamic>)
              .map((item) => ExternalProvider.fromJson(item))
              .toList();
      return externalProviders;
    });
  }

  Future<ExternalProvider?> getExternalProvider(
    String externalProviderName,
  ) async {
    final externalProvidersRawString = await clashInterface.getExternalProvider(
      externalProviderName,
    );
    if (externalProvidersRawString.isEmpty) {
      return null;
    }
    if (externalProvidersRawString.isEmpty) {
      return null;
    }
    return ExternalProvider.fromJson(json.decode(externalProvidersRawString));
  }

  Future<String> updateGeoData(UpdateGeoDataParams params) {
    return clashInterface.updateGeoData(params);
  }

  Future<String> sideLoadExternalProvider({
    required String providerName,
    required String data,
  }) {
    return clashInterface.sideLoadExternalProvider(
      providerName: providerName,
      data: data,
    );
  }

  Future<String> updateExternalProvider({required String providerName}) async {
    return clashInterface.updateExternalProvider(providerName);
  }

  startListener() async {
    await clashInterface.startListener();
  }

  stopListener() async {
    await clashInterface.stopListener();
  }

  Future<Delay> getDelay(String url, String proxyName) async {
    final data = await clashInterface.asyncTestDelay(url, proxyName);
    return Delay.fromJson(json.decode(data));
  }

  Future<Traffic> getTraffic() async {
    final trafficString = await clashInterface.getTraffic();
    if (trafficString.isEmpty) {
      return Traffic();
    }
    return Traffic.fromMap(json.decode(trafficString));
  }

  Future<IpInfo?> getCountryCode(String ip) async {
    final countryCode = await clashInterface.getCountryCode(ip);
    if (countryCode.isEmpty) {
      return null;
    }
    return IpInfo(ip: ip, countryCode: countryCode);
  }

  Future<Traffic> getTotalTraffic() async {
    final totalTrafficString = await clashInterface.getTotalTraffic();
    if (totalTrafficString.isEmpty) {
      return Traffic();
    }
    return Traffic.fromMap(json.decode(totalTrafficString));
  }

  Future<int> getMemory() async {
    final value = await clashInterface.getMemory();
    if (value.isEmpty) {
      return 0;
    }
    return int.parse(value);
  }

  Future<ClashConfigSnippet?> getProfile(String id) async {
    final res = await clashInterface.getProfile(id);
    if (res.isEmpty) {
      return null;
    }
    return ClashConfigSnippet.fromJson(json.decode(res));
  }

  resetTraffic() {
    clashInterface.resetTraffic();
  }

  startLog() {
    clashInterface.startLog();
  }

  stopLog() {
    clashInterface.stopLog();
  }

  requestGc() {
    clashInterface.forceGc();
  }

  Future<void> maybeUpdateGeoAssets({
    Duration interval = const Duration(days: 7),
  }) {
    _geoUpdateFuture ??= _performGeoUpdate(interval);
    return _geoUpdateFuture!;
  }

  Future<void> _performGeoUpdate(Duration interval) async {
    try {
      if (interval.inSeconds <= 0) {
        interval = const Duration(days: 7);
      }
      final lastUpdated = await preferences.getGeoAssetsLastUpdate();
      final now = DateTime.now();
      if (lastUpdated != null && now.difference(lastUpdated) < interval) {
        return;
      }

      bool allSuccess = true;
      for (final target in _geoUpdateTargets) {
        try {
          final message = await updateGeoData(
            UpdateGeoDataParams(geoType: target.key, geoName: target.value),
          );
          if (message.isNotEmpty) {
            allSuccess = false;
            developer.log(
              'Geo asset update failed',
              name: 'ClashCore',
              error: message,
            );
          }
        } catch (error, stackTrace) {
          allSuccess = false;
          developer.log(
            'Geo asset update exception',
            name: 'ClashCore',
            error: error,
            stackTrace: stackTrace,
          );
        }
      }

      if (allSuccess) {
        await preferences.setGeoAssetsLastUpdate(now);
        commonPrint.log('Geo assets updated successfully.');
      }
    } finally {
      _geoUpdateFuture = null;
    }
  }

  destroy() async {
    await clashInterface.destroy();
  }
}

class HarmonyClashStub extends ClashHandlerInterface
    with AndroidClashInterface {
  HarmonyClashStub._internal() {
    commonPrint.log(
      "[HarmonyClashStub] Clash core operations are disabled on HarmonyOS; the app will run in read-only mode.",
    );
  }

  static final HarmonyClashStub _instance = HarmonyClashStub._internal();

  factory HarmonyClashStub() => _instance;

  final Set<String> _warnedMethods = {};

  T _log<T>(String method, T value) {
    if (_warnedMethods.add(method)) {
      commonPrint.log("[HarmonyClashStub] fallback invoked: $method");
    }
    return value;
  }

  Future<T> _future<T>(String method, T value) async => _log(method, value);

  @override
  Future<bool> init(String homeDir) => _future('init', true);

  @override
  Future<bool> preload() => _future('preload', true);

  @override
  Future<bool> shutdown() => _future('shutdown', true);

  @override
  Future<bool> get isInit => _future('isInit', true);

  @override
  Future<bool> forceGc() => _future('forceGc', true);

  @override
  Future<String> validateConfig(String data) => _future('validateConfig', '{}');

  @override
  Future<String> asyncTestDelay(String url, String proxyName) =>
      _future('asyncTestDelay', '{}');

  @override
  Future<String> updateConfig(UpdateConfigParams updateConfigParams) =>
      _future('updateConfig', '{}');

  @override
  Future<String> setupConfig(SetupParams setupParams) =>
      _future('setupConfig', '{}');

  @override
  Future<String> getProxies() => _future('getProxies', '{}');

  @override
  Future<String> changeProxy(ChangeProxyParams changeProxyParams) =>
      _future('changeProxy', '{}');

  @override
  Future<bool> startListener() => _future('startListener', true);

  @override
  Future<bool> stopListener() => _future('stopListener', true);

  @override
  Future<String> getExternalProviders() =>
      _future('getExternalProviders', '{}');

  @override
  Future<String> getExternalProvider(String externalProviderName) =>
      _future('getExternalProvider', '{}');

  @override
  Future<String> updateGeoData(UpdateGeoDataParams params) =>
      _future('updateGeoData', '{}');

  @override
  Future<String> sideLoadExternalProvider({
    required String providerName,
    required String data,
  }) => _future('sideLoadExternalProvider', '{}');

  @override
  Future<String> updateExternalProvider(String providerName) =>
      _future('updateExternalProvider', '{}');

  @override
  Future<String> getTraffic() => _future('getTraffic', '{}');

  @override
  Future<String> getTotalTraffic() => _future('getTotalTraffic', '{}');

  @override
  Future<String> getCountryCode(String ip) => _future('getCountryCode', '{}');

  @override
  Future<String> getMemory() => _future('getMemory', '{}');

  @override
  resetTraffic() {
    _log('resetTraffic', true);
  }

  @override
  startLog() => _log('startLog', true);

  @override
  stopLog() => _log('stopLog', true);

  @override
  Future<String> getConnections() => _future('getConnections', '[]');

  @override
  Future<bool> closeConnection(String id) => _future('closeConnection', true);

  @override
  Future<bool> closeConnections() => _future('closeConnections', true);

  @override
  Future<String> getProfile(String id) => _future('getProfile', '{}');

  @override
  Future<bool> setState(CoreState state) => _future('setState', true);

  @override
  sendMessage(String message) {
    _log('sendMessage', false);
  }

  @override
  reStart() {
    _log('reStart', false);
  }

  @override
  Future<bool> destroy() => _future('destroy', true);

  @override
  Future<bool> setFdMap(int fd) => _future('setFdMap', true);

  @override
  Future<bool> setProcessMap(ProcessMapItem item) =>
      _future('setProcessMap', true);

  @override
  Future<bool> stopTun() => _future('stopTun', true);

  @override
  Future<bool> updateDns(String value) => _future('updateDns', true);

  @override
  Future<DateTime?> startTun(int fd) => _future<DateTime?>('startTun', null);

  @override
  Future<AndroidVpnOptions?> getAndroidVpnOptions() =>
      _future<AndroidVpnOptions?>('getAndroidVpnOptions', null);

  @override
  Future<String> getCurrentProfileName() =>
      _future('getCurrentProfileName', 'Harmony');

  @override
  Future<DateTime?> getRunTime() => _future<DateTime?>('getRunTime', null);
}

final clashCore = ClashCore();
