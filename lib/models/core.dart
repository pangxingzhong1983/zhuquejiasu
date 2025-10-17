// ignore_for_file: invalid_annotation_target

import 'package:zhuquejiasu/enum/enum.dart';
import 'package:zhuquejiasu/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/core.freezed.dart';

part 'generated/core.g.dart';

abstract mixin class AppMessageListener {
  void onLog(Log log) {}

  void onDelay(Delay delay) {}

  void onRequest(Connection connection) {}

  void onLoaded(String providerName) {}
}

abstract mixin class ServiceMessageListener {
  onProtect(Fd fd) {}

  onProcess(ProcessData process) {}
}

@freezed
abstract class CoreState with _$CoreState {
  const factory CoreState({
    @JsonKey(name: "vpn-props") required VpnProps vpnProps,
    @JsonKey(name: "only-statistics-proxy") required bool onlyStatisticsProxy,
    @JsonKey(name: "current-profile-name") required String currentProfileName,
    @JsonKey(name: "bypass-domain") @Default([]) List<String> bypassDomain,
  }) = _CoreState;

  factory CoreState.fromJson(Map<String, Object?> json) =>
      _$CoreStateFromJson(json);
}

@freezed
abstract class AndroidVpnOptions with _$AndroidVpnOptions {
  const factory AndroidVpnOptions({
    required bool enable,
    required int port,
    required AccessControl? accessControl,
    required bool allowBypass,
    required bool systemProxy,
    required List<String> bypassDomain,
    required String ipv4Address,
    required String ipv6Address,
    @Default([]) List<String> routeAddress,
    required String dnsServerAddress,
  }) = _AndroidVpnOptions;

  factory AndroidVpnOptions.fromJson(Map<String, Object?> json) =>
      _$AndroidVpnOptionsFromJson(json);
}

@freezed
abstract class ConfigExtendedParams with _$ConfigExtendedParams {
  const factory ConfigExtendedParams({
    @JsonKey(name: "is-patch") required bool isPatch,
    @JsonKey(name: "selected-map") required SelectedMap selectedMap,
    @JsonKey(name: "override-dns") required bool overrideDns,
    @JsonKey(name: "test-url") required String testUrl,
  }) = _ConfigExtendedParams;

  factory ConfigExtendedParams.fromJson(Map<String, Object?> json) =>
      _$ConfigExtendedParamsFromJson(json);
}

class SetupParams {
  const SetupParams({
    required this.config,
    required this.selectedMap,
    required this.testUrl,
  });

  final Map<String, dynamic> config;
  final Map<String, String> selectedMap;
  final String testUrl;

  Map<String, dynamic> toJson() {
    return {
      'config': config,
      'selected-map': selectedMap,
      'test-url': testUrl,
    };
  }

  factory SetupParams.fromJson(Map<String, dynamic> json) {
    return SetupParams(
      config: json['config'] as Map<String, dynamic>,
      selectedMap: Map<String, String>.from(json['selected-map']),
      testUrl: json['test-url'] as String,
    );
  }

  @override
  String toString() {
    return 'SetupParams(config: ${config.keys.length} keys, selectedMap: $selectedMap, testUrl: $testUrl)';
  }
}

@freezed
abstract class UpdateConfigParams with _$UpdateConfigParams {
  const factory UpdateConfigParams({
    @JsonKey(name: "profile-id") required String profileId,
    required ClashConfig config,
    required ConfigExtendedParams params,
  }) = _UpdateConfigParams;

  factory UpdateConfigParams.fromJson(Map<String, Object?> json) =>
      _$UpdateConfigParamsFromJson(json);
}

@freezed
abstract class ChangeProxyParams with _$ChangeProxyParams {
  const factory ChangeProxyParams({
    @JsonKey(name: "group-name") required String groupName,
    @JsonKey(name: "proxy-name") required String proxyName,
  }) = _ChangeProxyParams;

  factory ChangeProxyParams.fromJson(Map<String, Object?> json) =>
      _$ChangeProxyParamsFromJson(json);
}

@freezed
abstract class UpdateGeoDataParams with _$UpdateGeoDataParams {
  const factory UpdateGeoDataParams({
    @JsonKey(name: "geo-type") required String geoType,
    @JsonKey(name: "geo-name") required String geoName,
  }) = _UpdateGeoDataParams;

  factory UpdateGeoDataParams.fromJson(Map<String, Object?> json) =>
      _$UpdateGeoDataParamsFromJson(json);
}

@freezed
abstract class AppMessage with _$AppMessage {
  const factory AppMessage({
    required AppMessageType type,
    dynamic data,
  }) = _AppMessage;

  factory AppMessage.fromJson(Map<String, Object?> json) =>
      _$AppMessageFromJson(json);
}

@freezed
abstract class InvokeMessage with _$InvokeMessage {
  const factory InvokeMessage({
    required InvokeMessageType type,
    dynamic data,
  }) = _InvokeMessage;

  factory InvokeMessage.fromJson(Map<String, Object?> json) =>
      _$InvokeMessageFromJson(json);
}

@freezed
abstract class Delay with _$Delay {
  const factory Delay({
    required String name,
    required String url,
    int? value,
  }) = _Delay;

  factory Delay.fromJson(Map<String, Object?> json) => _$DelayFromJson(json);
}

@freezed
abstract class Now with _$Now {
  const factory Now({
    required String name,
    required String value,
  }) = _Now;

  factory Now.fromJson(Map<String, Object?> json) => _$NowFromJson(json);
}

@freezed
abstract class ProcessData with _$ProcessData {
  const factory ProcessData({
    required String id,
    required Metadata metadata,
  }) = _ProcessData;

  factory ProcessData.fromJson(Map<String, Object?> json) =>
      _$ProcessDataFromJson(json);
}

@freezed
abstract class Fd with _$Fd {
  const factory Fd({
    required String id,
    required int value,
  }) = _Fd;

  factory Fd.fromJson(Map<String, Object?> json) => _$FdFromJson(json);
}

@freezed
abstract class ProcessMapItem with _$ProcessMapItem {
  const factory ProcessMapItem({
    required String id,
    required String value,
  }) = _ProcessMapItem;

  factory ProcessMapItem.fromJson(Map<String, Object?> json) =>
      _$ProcessMapItemFromJson(json);
}

@freezed
abstract class ProviderSubscriptionInfo with _$ProviderSubscriptionInfo {
  const factory ProviderSubscriptionInfo({
    @JsonKey(name: "UPLOAD") @Default(0) int upload,
    @JsonKey(name: "DOWNLOAD") @Default(0) int download,
    @JsonKey(name: "TOTAL") @Default(0) int total,
    @JsonKey(name: "EXPIRE") @Default(0) int expire,
  }) = _ProviderSubscriptionInfo;

  factory ProviderSubscriptionInfo.fromJson(Map<String, Object?> json) =>
      _$ProviderSubscriptionInfoFromJson(json);
}

SubscriptionInfo? subscriptionInfoFormCore(Map<String, Object?>? json) {
  if (json == null) return null;
  return SubscriptionInfo(
    upload: (json['Upload'] as num?)?.toInt() ?? 0,
    download: (json['Download'] as num?)?.toInt() ?? 0,
    total: (json['Total'] as num?)?.toInt() ?? 0,
    expire: (json['Expire'] as num?)?.toInt() ?? 0,
  );
}

@freezed
abstract class ExternalProvider with _$ExternalProvider {
  const factory ExternalProvider({
    required String name,
    required String type,
    String? path,
    required int count,
    @JsonKey(name: "subscription-info", fromJson: subscriptionInfoFormCore)
    SubscriptionInfo? subscriptionInfo,
    @Default(false) bool isUpdating,
    @JsonKey(name: "vehicle-type") required String vehicleType,
    @JsonKey(name: "update-at") required DateTime updateAt,
  }) = _ExternalProvider;

  factory ExternalProvider.fromJson(Map<String, Object?> json) =>
      _$ExternalProviderFromJson(json);
}

@freezed
abstract class TunProps with _$TunProps {
  const factory TunProps({
    required int fd,
    required String gateway,
    required String gateway6,
    required String portal,
    required String portal6,
    required String dns,
    required String dns6,
  }) = _TunProps;

  factory TunProps.fromJson(Map<String, Object?> json) =>
      _$TunPropsFromJson(json);
}

@freezed
abstract class Action with _$Action {
  const factory Action({
    required ActionMethod method,
    required dynamic data,
    @JsonKey(name: "default-value") required dynamic defaultValue,
    required String id,
  }) = _Action;

  factory Action.fromJson(Map<String, Object?> json) => _$ActionFromJson(json);
}

@freezed
abstract class ActionResult with _$ActionResult {
  const factory ActionResult({
    required ActionMethod method,
    required dynamic data,
    String? id,
  }) = _ActionResult;

  factory ActionResult.fromJson(Map<String, Object?> json) =>
      _$ActionResultFromJson(json);
}
