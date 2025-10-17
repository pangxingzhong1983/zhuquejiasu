// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../core.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoreState _$CoreStateFromJson(Map<String, dynamic> json) => _CoreState(
  vpnProps: VpnProps.fromJson(json['vpn-props'] as Map<String, dynamic>?),
  onlyStatisticsProxy: json['only-statistics-proxy'] as bool,
  currentProfileName: json['current-profile-name'] as String,
  bypassDomain:
      (json['bypass-domain'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$CoreStateToJson(_CoreState instance) =>
    <String, dynamic>{
      'vpn-props': instance.vpnProps,
      'only-statistics-proxy': instance.onlyStatisticsProxy,
      'current-profile-name': instance.currentProfileName,
      'bypass-domain': instance.bypassDomain,
    };

_AndroidVpnOptions _$AndroidVpnOptionsFromJson(Map<String, dynamic> json) =>
    _AndroidVpnOptions(
      enable: json['enable'] as bool,
      port: (json['port'] as num).toInt(),
      accessControl: json['accessControl'] == null
          ? null
          : AccessControl.fromJson(
              json['accessControl'] as Map<String, dynamic>,
            ),
      allowBypass: json['allowBypass'] as bool,
      systemProxy: json['systemProxy'] as bool,
      bypassDomain: (json['bypassDomain'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      ipv4Address: json['ipv4Address'] as String,
      ipv6Address: json['ipv6Address'] as String,
      routeAddress:
          (json['routeAddress'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dnsServerAddress: json['dnsServerAddress'] as String,
    );

Map<String, dynamic> _$AndroidVpnOptionsToJson(_AndroidVpnOptions instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'port': instance.port,
      'accessControl': instance.accessControl,
      'allowBypass': instance.allowBypass,
      'systemProxy': instance.systemProxy,
      'bypassDomain': instance.bypassDomain,
      'ipv4Address': instance.ipv4Address,
      'ipv6Address': instance.ipv6Address,
      'routeAddress': instance.routeAddress,
      'dnsServerAddress': instance.dnsServerAddress,
    };

_ConfigExtendedParams _$ConfigExtendedParamsFromJson(
  Map<String, dynamic> json,
) => _ConfigExtendedParams(
  isPatch: json['is-patch'] as bool,
  selectedMap: Map<String, String>.from(json['selected-map'] as Map),
  overrideDns: json['override-dns'] as bool,
  testUrl: json['test-url'] as String,
);

Map<String, dynamic> _$ConfigExtendedParamsToJson(
  _ConfigExtendedParams instance,
) => <String, dynamic>{
  'is-patch': instance.isPatch,
  'selected-map': instance.selectedMap,
  'override-dns': instance.overrideDns,
  'test-url': instance.testUrl,
};

_UpdateConfigParams _$UpdateConfigParamsFromJson(Map<String, dynamic> json) =>
    _UpdateConfigParams(
      profileId: json['profile-id'] as String,
      config: ClashConfig.fromJson(json['config'] as Map<String, dynamic>),
      params: ConfigExtendedParams.fromJson(
        json['params'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$UpdateConfigParamsToJson(_UpdateConfigParams instance) =>
    <String, dynamic>{
      'profile-id': instance.profileId,
      'config': instance.config,
      'params': instance.params,
    };

_ChangeProxyParams _$ChangeProxyParamsFromJson(Map<String, dynamic> json) =>
    _ChangeProxyParams(
      groupName: json['group-name'] as String,
      proxyName: json['proxy-name'] as String,
    );

Map<String, dynamic> _$ChangeProxyParamsToJson(_ChangeProxyParams instance) =>
    <String, dynamic>{
      'group-name': instance.groupName,
      'proxy-name': instance.proxyName,
    };

_UpdateGeoDataParams _$UpdateGeoDataParamsFromJson(Map<String, dynamic> json) =>
    _UpdateGeoDataParams(
      geoType: json['geo-type'] as String,
      geoName: json['geo-name'] as String,
    );

Map<String, dynamic> _$UpdateGeoDataParamsToJson(
  _UpdateGeoDataParams instance,
) => <String, dynamic>{
  'geo-type': instance.geoType,
  'geo-name': instance.geoName,
};

_AppMessage _$AppMessageFromJson(Map<String, dynamic> json) => _AppMessage(
  type: $enumDecode(_$AppMessageTypeEnumMap, json['type']),
  data: json['data'],
);

Map<String, dynamic> _$AppMessageToJson(_AppMessage instance) =>
    <String, dynamic>{
      'type': _$AppMessageTypeEnumMap[instance.type]!,
      'data': instance.data,
    };

const _$AppMessageTypeEnumMap = {
  AppMessageType.log: 'log',
  AppMessageType.delay: 'delay',
  AppMessageType.request: 'request',
  AppMessageType.loaded: 'loaded',
};

_InvokeMessage _$InvokeMessageFromJson(Map<String, dynamic> json) =>
    _InvokeMessage(
      type: $enumDecode(_$InvokeMessageTypeEnumMap, json['type']),
      data: json['data'],
    );

Map<String, dynamic> _$InvokeMessageToJson(_InvokeMessage instance) =>
    <String, dynamic>{
      'type': _$InvokeMessageTypeEnumMap[instance.type]!,
      'data': instance.data,
    };

const _$InvokeMessageTypeEnumMap = {
  InvokeMessageType.protect: 'protect',
  InvokeMessageType.process: 'process',
};

_Delay _$DelayFromJson(Map<String, dynamic> json) => _Delay(
  name: json['name'] as String,
  url: json['url'] as String,
  value: (json['value'] as num?)?.toInt(),
);

Map<String, dynamic> _$DelayToJson(_Delay instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
  'value': instance.value,
};

_Now _$NowFromJson(Map<String, dynamic> json) =>
    _Now(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$NowToJson(_Now instance) => <String, dynamic>{
  'name': instance.name,
  'value': instance.value,
};

_ProcessData _$ProcessDataFromJson(Map<String, dynamic> json) => _ProcessData(
  id: json['id'] as String,
  metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProcessDataToJson(_ProcessData instance) =>
    <String, dynamic>{'id': instance.id, 'metadata': instance.metadata};

_Fd _$FdFromJson(Map<String, dynamic> json) =>
    _Fd(id: json['id'] as String, value: (json['value'] as num).toInt());

Map<String, dynamic> _$FdToJson(_Fd instance) => <String, dynamic>{
  'id': instance.id,
  'value': instance.value,
};

_ProcessMapItem _$ProcessMapItemFromJson(Map<String, dynamic> json) =>
    _ProcessMapItem(id: json['id'] as String, value: json['value'] as String);

Map<String, dynamic> _$ProcessMapItemToJson(_ProcessMapItem instance) =>
    <String, dynamic>{'id': instance.id, 'value': instance.value};

_ProviderSubscriptionInfo _$ProviderSubscriptionInfoFromJson(
  Map<String, dynamic> json,
) => _ProviderSubscriptionInfo(
  upload: (json['UPLOAD'] as num?)?.toInt() ?? 0,
  download: (json['DOWNLOAD'] as num?)?.toInt() ?? 0,
  total: (json['TOTAL'] as num?)?.toInt() ?? 0,
  expire: (json['EXPIRE'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProviderSubscriptionInfoToJson(
  _ProviderSubscriptionInfo instance,
) => <String, dynamic>{
  'UPLOAD': instance.upload,
  'DOWNLOAD': instance.download,
  'TOTAL': instance.total,
  'EXPIRE': instance.expire,
};

_ExternalProvider _$ExternalProviderFromJson(Map<String, dynamic> json) =>
    _ExternalProvider(
      name: json['name'] as String,
      type: json['type'] as String,
      path: json['path'] as String?,
      count: (json['count'] as num).toInt(),
      subscriptionInfo: subscriptionInfoFormCore(
        json['subscription-info'] as Map<String, Object?>?,
      ),
      isUpdating: json['isUpdating'] as bool? ?? false,
      vehicleType: json['vehicle-type'] as String,
      updateAt: DateTime.parse(json['update-at'] as String),
    );

Map<String, dynamic> _$ExternalProviderToJson(_ExternalProvider instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'path': instance.path,
      'count': instance.count,
      'subscription-info': instance.subscriptionInfo,
      'isUpdating': instance.isUpdating,
      'vehicle-type': instance.vehicleType,
      'update-at': instance.updateAt.toIso8601String(),
    };

_TunProps _$TunPropsFromJson(Map<String, dynamic> json) => _TunProps(
  fd: (json['fd'] as num).toInt(),
  gateway: json['gateway'] as String,
  gateway6: json['gateway6'] as String,
  portal: json['portal'] as String,
  portal6: json['portal6'] as String,
  dns: json['dns'] as String,
  dns6: json['dns6'] as String,
);

Map<String, dynamic> _$TunPropsToJson(_TunProps instance) => <String, dynamic>{
  'fd': instance.fd,
  'gateway': instance.gateway,
  'gateway6': instance.gateway6,
  'portal': instance.portal,
  'portal6': instance.portal6,
  'dns': instance.dns,
  'dns6': instance.dns6,
};

_Action _$ActionFromJson(Map<String, dynamic> json) => _Action(
  method: $enumDecode(_$ActionMethodEnumMap, json['method']),
  data: json['data'],
  defaultValue: json['default-value'],
  id: json['id'] as String,
);

Map<String, dynamic> _$ActionToJson(_Action instance) => <String, dynamic>{
  'method': _$ActionMethodEnumMap[instance.method]!,
  'data': instance.data,
  'default-value': instance.defaultValue,
  'id': instance.id,
};

const _$ActionMethodEnumMap = {
  ActionMethod.message: 'message',
  ActionMethod.initClash: 'initClash',
  ActionMethod.getIsInit: 'getIsInit',
  ActionMethod.forceGc: 'forceGc',
  ActionMethod.shutdown: 'shutdown',
  ActionMethod.validateConfig: 'validateConfig',
  ActionMethod.updateConfig: 'updateConfig',
  ActionMethod.setupConfig: 'setupConfig',
  ActionMethod.getProxies: 'getProxies',
  ActionMethod.changeProxy: 'changeProxy',
  ActionMethod.getTraffic: 'getTraffic',
  ActionMethod.getTotalTraffic: 'getTotalTraffic',
  ActionMethod.resetTraffic: 'resetTraffic',
  ActionMethod.asyncTestDelay: 'asyncTestDelay',
  ActionMethod.getConnections: 'getConnections',
  ActionMethod.closeConnections: 'closeConnections',
  ActionMethod.closeConnection: 'closeConnection',
  ActionMethod.getExternalProviders: 'getExternalProviders',
  ActionMethod.getExternalProvider: 'getExternalProvider',
  ActionMethod.updateGeoData: 'updateGeoData',
  ActionMethod.updateExternalProvider: 'updateExternalProvider',
  ActionMethod.sideLoadExternalProvider: 'sideLoadExternalProvider',
  ActionMethod.startLog: 'startLog',
  ActionMethod.stopLog: 'stopLog',
  ActionMethod.startListener: 'startListener',
  ActionMethod.stopListener: 'stopListener',
  ActionMethod.getCountryCode: 'getCountryCode',
  ActionMethod.getMemory: 'getMemory',
  ActionMethod.getProfile: 'getProfile',
  ActionMethod.setFdMap: 'setFdMap',
  ActionMethod.setProcessMap: 'setProcessMap',
  ActionMethod.setState: 'setState',
  ActionMethod.startTun: 'startTun',
  ActionMethod.stopTun: 'stopTun',
  ActionMethod.getRunTime: 'getRunTime',
  ActionMethod.updateDns: 'updateDns',
  ActionMethod.getAndroidVpnOptions: 'getAndroidVpnOptions',
  ActionMethod.getCurrentProfileName: 'getCurrentProfileName',
};

_ActionResult _$ActionResultFromJson(Map<String, dynamic> json) =>
    _ActionResult(
      method: $enumDecode(_$ActionMethodEnumMap, json['method']),
      data: json['data'],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ActionResultToJson(_ActionResult instance) =>
    <String, dynamic>{
      'method': _$ActionMethodEnumMap[instance.method]!,
      'data': instance.data,
      'id': instance.id,
    };
