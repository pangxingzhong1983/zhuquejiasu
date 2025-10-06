import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:fl_clash/clash/geo_manager.dart';

import 'package:fl_clash/clash/clash.dart';
import 'package:fl_clash/clash/interface.dart';
import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/models/models.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class ClashCore {
  static ClashCore? _instance;
  late ClashHandlerInterface clashInterface;

  ClashCore._internal() {
    if (Platform.isAndroid) {
      clashInterface = clashLib!;
    } else {
      clashInterface = clashService!;
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
    final mirrors = [
      'https://dav.zhuquejiasu.uk/FlClash/assets/data/',
    ];
    final dio = Dio(BaseOptions(responseType: ResponseType.bytes, connectTimeout: const Duration(seconds: 10), receiveTimeout: const Duration(seconds: 20)));

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
          print('[ClashCore] initGeo failed for asset: assets/data/$geoFileName');
          print('[ClashCore] error: asset missing and download attempts failed');
        }
      } catch (e, st) {
        anyFailed = true;
        print('[ClashCore] initGeo unexpected error for asset: assets/data/$geoFileName');
        print('[ClashCore] error: $e');
        print('[ClashCore] stack: $st');
      }
    }

    return !anyFailed;
  }

  Future<bool> init() async {
    // Ensure geo assets are available and valid. GeoManager encapsulates
    // bundled-asset loading, download fallback and optional checksum checks.
    final geoOk = await GeoManager.ensureGeoAssets();
    if (!geoOk) {
      print('[ClashCore] init aborted: geo assets not available');
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
    print('[DEBUG] setupConfig called with params: ${setupParams.toString()}');
    try {
      final result = await clashInterface.setupConfig(setupParams);
      print('[DEBUG] setupConfig success: $result');
      return result;
    } catch (e) {
      print('[DEBUG] setupConfig error: $e');
      print('[DEBUG] setupConfig error type: ${e.runtimeType}');
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
        })
      ];
      final groupsRaw = groupNames.map((groupName) {
        final group = proxies[groupName];
        group["all"] = ((group["all"] ?? []) as List)
            .map(
              (name) => proxies[name],
            )
            .where((proxy) => proxy != null)
            .toList();
        return group;
      }).toList();
      return groupsRaw
          .map(
            (e) => Group.fromJson(e),
          )
          .toList();
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
    final externalProvidersRawString =
        await clashInterface.getExternalProviders();
    if (externalProvidersRawString.isEmpty) {
      return [];
    }
    return Isolate.run<List<ExternalProvider>>(
      () {
        final externalProviders =
            (json.decode(externalProvidersRawString) as List<dynamic>)
                .map(
                  (item) => ExternalProvider.fromJson(item),
                )
                .toList();
        return externalProviders;
      },
    );
  }

  Future<ExternalProvider?> getExternalProvider(
      String externalProviderName) async {
    final externalProvidersRawString =
        await clashInterface.getExternalProvider(externalProviderName);
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
        providerName: providerName, data: data);
  }

  Future<String> updateExternalProvider({
    required String providerName,
  }) async {
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
    return IpInfo(
      ip: ip,
      countryCode: countryCode,
    );
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

  destroy() async {
    await clashInterface.destroy();
  }
}

final clashCore = ClashCore();
