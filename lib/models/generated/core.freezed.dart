// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../core.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoreState {

@JsonKey(name: "vpn-props") VpnProps get vpnProps;@JsonKey(name: "only-statistics-proxy") bool get onlyStatisticsProxy;@JsonKey(name: "current-profile-name") String get currentProfileName;@JsonKey(name: "bypass-domain") List<String> get bypassDomain;
/// Create a copy of CoreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoreStateCopyWith<CoreState> get copyWith => _$CoreStateCopyWithImpl<CoreState>(this as CoreState, _$identity);

  /// Serializes this CoreState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoreState&&(identical(other.vpnProps, vpnProps) || other.vpnProps == vpnProps)&&(identical(other.onlyStatisticsProxy, onlyStatisticsProxy) || other.onlyStatisticsProxy == onlyStatisticsProxy)&&(identical(other.currentProfileName, currentProfileName) || other.currentProfileName == currentProfileName)&&const DeepCollectionEquality().equals(other.bypassDomain, bypassDomain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vpnProps,onlyStatisticsProxy,currentProfileName,const DeepCollectionEquality().hash(bypassDomain));

@override
String toString() {
  return 'CoreState(vpnProps: $vpnProps, onlyStatisticsProxy: $onlyStatisticsProxy, currentProfileName: $currentProfileName, bypassDomain: $bypassDomain)';
}


}

/// @nodoc
abstract mixin class $CoreStateCopyWith<$Res>  {
  factory $CoreStateCopyWith(CoreState value, $Res Function(CoreState) _then) = _$CoreStateCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "vpn-props") VpnProps vpnProps,@JsonKey(name: "only-statistics-proxy") bool onlyStatisticsProxy,@JsonKey(name: "current-profile-name") String currentProfileName,@JsonKey(name: "bypass-domain") List<String> bypassDomain
});


$VpnPropsCopyWith<$Res> get vpnProps;

}
/// @nodoc
class _$CoreStateCopyWithImpl<$Res>
    implements $CoreStateCopyWith<$Res> {
  _$CoreStateCopyWithImpl(this._self, this._then);

  final CoreState _self;
  final $Res Function(CoreState) _then;

/// Create a copy of CoreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vpnProps = null,Object? onlyStatisticsProxy = null,Object? currentProfileName = null,Object? bypassDomain = null,}) {
  return _then(_self.copyWith(
vpnProps: null == vpnProps ? _self.vpnProps : vpnProps // ignore: cast_nullable_to_non_nullable
as VpnProps,onlyStatisticsProxy: null == onlyStatisticsProxy ? _self.onlyStatisticsProxy : onlyStatisticsProxy // ignore: cast_nullable_to_non_nullable
as bool,currentProfileName: null == currentProfileName ? _self.currentProfileName : currentProfileName // ignore: cast_nullable_to_non_nullable
as String,bypassDomain: null == bypassDomain ? _self.bypassDomain : bypassDomain // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of CoreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VpnPropsCopyWith<$Res> get vpnProps {
  
  return $VpnPropsCopyWith<$Res>(_self.vpnProps, (value) {
    return _then(_self.copyWith(vpnProps: value));
  });
}
}


/// Adds pattern-matching-related methods to [CoreState].
extension CoreStatePatterns on CoreState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoreState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoreState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoreState value)  $default,){
final _that = this;
switch (_that) {
case _CoreState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoreState value)?  $default,){
final _that = this;
switch (_that) {
case _CoreState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "vpn-props")  VpnProps vpnProps, @JsonKey(name: "only-statistics-proxy")  bool onlyStatisticsProxy, @JsonKey(name: "current-profile-name")  String currentProfileName, @JsonKey(name: "bypass-domain")  List<String> bypassDomain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoreState() when $default != null:
return $default(_that.vpnProps,_that.onlyStatisticsProxy,_that.currentProfileName,_that.bypassDomain);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "vpn-props")  VpnProps vpnProps, @JsonKey(name: "only-statistics-proxy")  bool onlyStatisticsProxy, @JsonKey(name: "current-profile-name")  String currentProfileName, @JsonKey(name: "bypass-domain")  List<String> bypassDomain)  $default,) {final _that = this;
switch (_that) {
case _CoreState():
return $default(_that.vpnProps,_that.onlyStatisticsProxy,_that.currentProfileName,_that.bypassDomain);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "vpn-props")  VpnProps vpnProps, @JsonKey(name: "only-statistics-proxy")  bool onlyStatisticsProxy, @JsonKey(name: "current-profile-name")  String currentProfileName, @JsonKey(name: "bypass-domain")  List<String> bypassDomain)?  $default,) {final _that = this;
switch (_that) {
case _CoreState() when $default != null:
return $default(_that.vpnProps,_that.onlyStatisticsProxy,_that.currentProfileName,_that.bypassDomain);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoreState implements CoreState {
  const _CoreState({@JsonKey(name: "vpn-props") required this.vpnProps, @JsonKey(name: "only-statistics-proxy") required this.onlyStatisticsProxy, @JsonKey(name: "current-profile-name") required this.currentProfileName, @JsonKey(name: "bypass-domain") final  List<String> bypassDomain = const []}): _bypassDomain = bypassDomain;
  factory _CoreState.fromJson(Map<String, dynamic> json) => _$CoreStateFromJson(json);

@override@JsonKey(name: "vpn-props") final  VpnProps vpnProps;
@override@JsonKey(name: "only-statistics-proxy") final  bool onlyStatisticsProxy;
@override@JsonKey(name: "current-profile-name") final  String currentProfileName;
 final  List<String> _bypassDomain;
@override@JsonKey(name: "bypass-domain") List<String> get bypassDomain {
  if (_bypassDomain is EqualUnmodifiableListView) return _bypassDomain;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bypassDomain);
}


/// Create a copy of CoreState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoreStateCopyWith<_CoreState> get copyWith => __$CoreStateCopyWithImpl<_CoreState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoreStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoreState&&(identical(other.vpnProps, vpnProps) || other.vpnProps == vpnProps)&&(identical(other.onlyStatisticsProxy, onlyStatisticsProxy) || other.onlyStatisticsProxy == onlyStatisticsProxy)&&(identical(other.currentProfileName, currentProfileName) || other.currentProfileName == currentProfileName)&&const DeepCollectionEquality().equals(other._bypassDomain, _bypassDomain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vpnProps,onlyStatisticsProxy,currentProfileName,const DeepCollectionEquality().hash(_bypassDomain));

@override
String toString() {
  return 'CoreState(vpnProps: $vpnProps, onlyStatisticsProxy: $onlyStatisticsProxy, currentProfileName: $currentProfileName, bypassDomain: $bypassDomain)';
}


}

/// @nodoc
abstract mixin class _$CoreStateCopyWith<$Res> implements $CoreStateCopyWith<$Res> {
  factory _$CoreStateCopyWith(_CoreState value, $Res Function(_CoreState) _then) = __$CoreStateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "vpn-props") VpnProps vpnProps,@JsonKey(name: "only-statistics-proxy") bool onlyStatisticsProxy,@JsonKey(name: "current-profile-name") String currentProfileName,@JsonKey(name: "bypass-domain") List<String> bypassDomain
});


@override $VpnPropsCopyWith<$Res> get vpnProps;

}
/// @nodoc
class __$CoreStateCopyWithImpl<$Res>
    implements _$CoreStateCopyWith<$Res> {
  __$CoreStateCopyWithImpl(this._self, this._then);

  final _CoreState _self;
  final $Res Function(_CoreState) _then;

/// Create a copy of CoreState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vpnProps = null,Object? onlyStatisticsProxy = null,Object? currentProfileName = null,Object? bypassDomain = null,}) {
  return _then(_CoreState(
vpnProps: null == vpnProps ? _self.vpnProps : vpnProps // ignore: cast_nullable_to_non_nullable
as VpnProps,onlyStatisticsProxy: null == onlyStatisticsProxy ? _self.onlyStatisticsProxy : onlyStatisticsProxy // ignore: cast_nullable_to_non_nullable
as bool,currentProfileName: null == currentProfileName ? _self.currentProfileName : currentProfileName // ignore: cast_nullable_to_non_nullable
as String,bypassDomain: null == bypassDomain ? _self._bypassDomain : bypassDomain // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of CoreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VpnPropsCopyWith<$Res> get vpnProps {
  
  return $VpnPropsCopyWith<$Res>(_self.vpnProps, (value) {
    return _then(_self.copyWith(vpnProps: value));
  });
}
}


/// @nodoc
mixin _$AndroidVpnOptions {

 bool get enable; int get port; AccessControl? get accessControl; bool get allowBypass; bool get systemProxy; List<String> get bypassDomain; String get ipv4Address; String get ipv6Address; List<String> get routeAddress; String get dnsServerAddress;
/// Create a copy of AndroidVpnOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AndroidVpnOptionsCopyWith<AndroidVpnOptions> get copyWith => _$AndroidVpnOptionsCopyWithImpl<AndroidVpnOptions>(this as AndroidVpnOptions, _$identity);

  /// Serializes this AndroidVpnOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AndroidVpnOptions&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.port, port) || other.port == port)&&(identical(other.accessControl, accessControl) || other.accessControl == accessControl)&&(identical(other.allowBypass, allowBypass) || other.allowBypass == allowBypass)&&(identical(other.systemProxy, systemProxy) || other.systemProxy == systemProxy)&&const DeepCollectionEquality().equals(other.bypassDomain, bypassDomain)&&(identical(other.ipv4Address, ipv4Address) || other.ipv4Address == ipv4Address)&&(identical(other.ipv6Address, ipv6Address) || other.ipv6Address == ipv6Address)&&const DeepCollectionEquality().equals(other.routeAddress, routeAddress)&&(identical(other.dnsServerAddress, dnsServerAddress) || other.dnsServerAddress == dnsServerAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enable,port,accessControl,allowBypass,systemProxy,const DeepCollectionEquality().hash(bypassDomain),ipv4Address,ipv6Address,const DeepCollectionEquality().hash(routeAddress),dnsServerAddress);

@override
String toString() {
  return 'AndroidVpnOptions(enable: $enable, port: $port, accessControl: $accessControl, allowBypass: $allowBypass, systemProxy: $systemProxy, bypassDomain: $bypassDomain, ipv4Address: $ipv4Address, ipv6Address: $ipv6Address, routeAddress: $routeAddress, dnsServerAddress: $dnsServerAddress)';
}


}

/// @nodoc
abstract mixin class $AndroidVpnOptionsCopyWith<$Res>  {
  factory $AndroidVpnOptionsCopyWith(AndroidVpnOptions value, $Res Function(AndroidVpnOptions) _then) = _$AndroidVpnOptionsCopyWithImpl;
@useResult
$Res call({
 bool enable, int port, AccessControl? accessControl, bool allowBypass, bool systemProxy, List<String> bypassDomain, String ipv4Address, String ipv6Address, List<String> routeAddress, String dnsServerAddress
});


$AccessControlCopyWith<$Res>? get accessControl;

}
/// @nodoc
class _$AndroidVpnOptionsCopyWithImpl<$Res>
    implements $AndroidVpnOptionsCopyWith<$Res> {
  _$AndroidVpnOptionsCopyWithImpl(this._self, this._then);

  final AndroidVpnOptions _self;
  final $Res Function(AndroidVpnOptions) _then;

/// Create a copy of AndroidVpnOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enable = null,Object? port = null,Object? accessControl = freezed,Object? allowBypass = null,Object? systemProxy = null,Object? bypassDomain = null,Object? ipv4Address = null,Object? ipv6Address = null,Object? routeAddress = null,Object? dnsServerAddress = null,}) {
  return _then(_self.copyWith(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,accessControl: freezed == accessControl ? _self.accessControl : accessControl // ignore: cast_nullable_to_non_nullable
as AccessControl?,allowBypass: null == allowBypass ? _self.allowBypass : allowBypass // ignore: cast_nullable_to_non_nullable
as bool,systemProxy: null == systemProxy ? _self.systemProxy : systemProxy // ignore: cast_nullable_to_non_nullable
as bool,bypassDomain: null == bypassDomain ? _self.bypassDomain : bypassDomain // ignore: cast_nullable_to_non_nullable
as List<String>,ipv4Address: null == ipv4Address ? _self.ipv4Address : ipv4Address // ignore: cast_nullable_to_non_nullable
as String,ipv6Address: null == ipv6Address ? _self.ipv6Address : ipv6Address // ignore: cast_nullable_to_non_nullable
as String,routeAddress: null == routeAddress ? _self.routeAddress : routeAddress // ignore: cast_nullable_to_non_nullable
as List<String>,dnsServerAddress: null == dnsServerAddress ? _self.dnsServerAddress : dnsServerAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of AndroidVpnOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessControlCopyWith<$Res>? get accessControl {
    if (_self.accessControl == null) {
    return null;
  }

  return $AccessControlCopyWith<$Res>(_self.accessControl!, (value) {
    return _then(_self.copyWith(accessControl: value));
  });
}
}


/// Adds pattern-matching-related methods to [AndroidVpnOptions].
extension AndroidVpnOptionsPatterns on AndroidVpnOptions {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AndroidVpnOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AndroidVpnOptions() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AndroidVpnOptions value)  $default,){
final _that = this;
switch (_that) {
case _AndroidVpnOptions():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AndroidVpnOptions value)?  $default,){
final _that = this;
switch (_that) {
case _AndroidVpnOptions() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enable,  int port,  AccessControl? accessControl,  bool allowBypass,  bool systemProxy,  List<String> bypassDomain,  String ipv4Address,  String ipv6Address,  List<String> routeAddress,  String dnsServerAddress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AndroidVpnOptions() when $default != null:
return $default(_that.enable,_that.port,_that.accessControl,_that.allowBypass,_that.systemProxy,_that.bypassDomain,_that.ipv4Address,_that.ipv6Address,_that.routeAddress,_that.dnsServerAddress);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enable,  int port,  AccessControl? accessControl,  bool allowBypass,  bool systemProxy,  List<String> bypassDomain,  String ipv4Address,  String ipv6Address,  List<String> routeAddress,  String dnsServerAddress)  $default,) {final _that = this;
switch (_that) {
case _AndroidVpnOptions():
return $default(_that.enable,_that.port,_that.accessControl,_that.allowBypass,_that.systemProxy,_that.bypassDomain,_that.ipv4Address,_that.ipv6Address,_that.routeAddress,_that.dnsServerAddress);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enable,  int port,  AccessControl? accessControl,  bool allowBypass,  bool systemProxy,  List<String> bypassDomain,  String ipv4Address,  String ipv6Address,  List<String> routeAddress,  String dnsServerAddress)?  $default,) {final _that = this;
switch (_that) {
case _AndroidVpnOptions() when $default != null:
return $default(_that.enable,_that.port,_that.accessControl,_that.allowBypass,_that.systemProxy,_that.bypassDomain,_that.ipv4Address,_that.ipv6Address,_that.routeAddress,_that.dnsServerAddress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AndroidVpnOptions implements AndroidVpnOptions {
  const _AndroidVpnOptions({required this.enable, required this.port, required this.accessControl, required this.allowBypass, required this.systemProxy, required final  List<String> bypassDomain, required this.ipv4Address, required this.ipv6Address, final  List<String> routeAddress = const [], required this.dnsServerAddress}): _bypassDomain = bypassDomain,_routeAddress = routeAddress;
  factory _AndroidVpnOptions.fromJson(Map<String, dynamic> json) => _$AndroidVpnOptionsFromJson(json);

@override final  bool enable;
@override final  int port;
@override final  AccessControl? accessControl;
@override final  bool allowBypass;
@override final  bool systemProxy;
 final  List<String> _bypassDomain;
@override List<String> get bypassDomain {
  if (_bypassDomain is EqualUnmodifiableListView) return _bypassDomain;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bypassDomain);
}

@override final  String ipv4Address;
@override final  String ipv6Address;
 final  List<String> _routeAddress;
@override@JsonKey() List<String> get routeAddress {
  if (_routeAddress is EqualUnmodifiableListView) return _routeAddress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_routeAddress);
}

@override final  String dnsServerAddress;

/// Create a copy of AndroidVpnOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AndroidVpnOptionsCopyWith<_AndroidVpnOptions> get copyWith => __$AndroidVpnOptionsCopyWithImpl<_AndroidVpnOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AndroidVpnOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AndroidVpnOptions&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.port, port) || other.port == port)&&(identical(other.accessControl, accessControl) || other.accessControl == accessControl)&&(identical(other.allowBypass, allowBypass) || other.allowBypass == allowBypass)&&(identical(other.systemProxy, systemProxy) || other.systemProxy == systemProxy)&&const DeepCollectionEquality().equals(other._bypassDomain, _bypassDomain)&&(identical(other.ipv4Address, ipv4Address) || other.ipv4Address == ipv4Address)&&(identical(other.ipv6Address, ipv6Address) || other.ipv6Address == ipv6Address)&&const DeepCollectionEquality().equals(other._routeAddress, _routeAddress)&&(identical(other.dnsServerAddress, dnsServerAddress) || other.dnsServerAddress == dnsServerAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enable,port,accessControl,allowBypass,systemProxy,const DeepCollectionEquality().hash(_bypassDomain),ipv4Address,ipv6Address,const DeepCollectionEquality().hash(_routeAddress),dnsServerAddress);

@override
String toString() {
  return 'AndroidVpnOptions(enable: $enable, port: $port, accessControl: $accessControl, allowBypass: $allowBypass, systemProxy: $systemProxy, bypassDomain: $bypassDomain, ipv4Address: $ipv4Address, ipv6Address: $ipv6Address, routeAddress: $routeAddress, dnsServerAddress: $dnsServerAddress)';
}


}

/// @nodoc
abstract mixin class _$AndroidVpnOptionsCopyWith<$Res> implements $AndroidVpnOptionsCopyWith<$Res> {
  factory _$AndroidVpnOptionsCopyWith(_AndroidVpnOptions value, $Res Function(_AndroidVpnOptions) _then) = __$AndroidVpnOptionsCopyWithImpl;
@override @useResult
$Res call({
 bool enable, int port, AccessControl? accessControl, bool allowBypass, bool systemProxy, List<String> bypassDomain, String ipv4Address, String ipv6Address, List<String> routeAddress, String dnsServerAddress
});


@override $AccessControlCopyWith<$Res>? get accessControl;

}
/// @nodoc
class __$AndroidVpnOptionsCopyWithImpl<$Res>
    implements _$AndroidVpnOptionsCopyWith<$Res> {
  __$AndroidVpnOptionsCopyWithImpl(this._self, this._then);

  final _AndroidVpnOptions _self;
  final $Res Function(_AndroidVpnOptions) _then;

/// Create a copy of AndroidVpnOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enable = null,Object? port = null,Object? accessControl = freezed,Object? allowBypass = null,Object? systemProxy = null,Object? bypassDomain = null,Object? ipv4Address = null,Object? ipv6Address = null,Object? routeAddress = null,Object? dnsServerAddress = null,}) {
  return _then(_AndroidVpnOptions(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,accessControl: freezed == accessControl ? _self.accessControl : accessControl // ignore: cast_nullable_to_non_nullable
as AccessControl?,allowBypass: null == allowBypass ? _self.allowBypass : allowBypass // ignore: cast_nullable_to_non_nullable
as bool,systemProxy: null == systemProxy ? _self.systemProxy : systemProxy // ignore: cast_nullable_to_non_nullable
as bool,bypassDomain: null == bypassDomain ? _self._bypassDomain : bypassDomain // ignore: cast_nullable_to_non_nullable
as List<String>,ipv4Address: null == ipv4Address ? _self.ipv4Address : ipv4Address // ignore: cast_nullable_to_non_nullable
as String,ipv6Address: null == ipv6Address ? _self.ipv6Address : ipv6Address // ignore: cast_nullable_to_non_nullable
as String,routeAddress: null == routeAddress ? _self._routeAddress : routeAddress // ignore: cast_nullable_to_non_nullable
as List<String>,dnsServerAddress: null == dnsServerAddress ? _self.dnsServerAddress : dnsServerAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AndroidVpnOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessControlCopyWith<$Res>? get accessControl {
    if (_self.accessControl == null) {
    return null;
  }

  return $AccessControlCopyWith<$Res>(_self.accessControl!, (value) {
    return _then(_self.copyWith(accessControl: value));
  });
}
}


/// @nodoc
mixin _$ConfigExtendedParams {

@JsonKey(name: "is-patch") bool get isPatch;@JsonKey(name: "selected-map") SelectedMap get selectedMap;@JsonKey(name: "override-dns") bool get overrideDns;@JsonKey(name: "test-url") String get testUrl;
/// Create a copy of ConfigExtendedParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigExtendedParamsCopyWith<ConfigExtendedParams> get copyWith => _$ConfigExtendedParamsCopyWithImpl<ConfigExtendedParams>(this as ConfigExtendedParams, _$identity);

  /// Serializes this ConfigExtendedParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigExtendedParams&&(identical(other.isPatch, isPatch) || other.isPatch == isPatch)&&const DeepCollectionEquality().equals(other.selectedMap, selectedMap)&&(identical(other.overrideDns, overrideDns) || other.overrideDns == overrideDns)&&(identical(other.testUrl, testUrl) || other.testUrl == testUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPatch,const DeepCollectionEquality().hash(selectedMap),overrideDns,testUrl);

@override
String toString() {
  return 'ConfigExtendedParams(isPatch: $isPatch, selectedMap: $selectedMap, overrideDns: $overrideDns, testUrl: $testUrl)';
}


}

/// @nodoc
abstract mixin class $ConfigExtendedParamsCopyWith<$Res>  {
  factory $ConfigExtendedParamsCopyWith(ConfigExtendedParams value, $Res Function(ConfigExtendedParams) _then) = _$ConfigExtendedParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "is-patch") bool isPatch,@JsonKey(name: "selected-map") SelectedMap selectedMap,@JsonKey(name: "override-dns") bool overrideDns,@JsonKey(name: "test-url") String testUrl
});




}
/// @nodoc
class _$ConfigExtendedParamsCopyWithImpl<$Res>
    implements $ConfigExtendedParamsCopyWith<$Res> {
  _$ConfigExtendedParamsCopyWithImpl(this._self, this._then);

  final ConfigExtendedParams _self;
  final $Res Function(ConfigExtendedParams) _then;

/// Create a copy of ConfigExtendedParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPatch = null,Object? selectedMap = null,Object? overrideDns = null,Object? testUrl = null,}) {
  return _then(_self.copyWith(
isPatch: null == isPatch ? _self.isPatch : isPatch // ignore: cast_nullable_to_non_nullable
as bool,selectedMap: null == selectedMap ? _self.selectedMap : selectedMap // ignore: cast_nullable_to_non_nullable
as SelectedMap,overrideDns: null == overrideDns ? _self.overrideDns : overrideDns // ignore: cast_nullable_to_non_nullable
as bool,testUrl: null == testUrl ? _self.testUrl : testUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfigExtendedParams].
extension ConfigExtendedParamsPatterns on ConfigExtendedParams {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfigExtendedParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfigExtendedParams() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfigExtendedParams value)  $default,){
final _that = this;
switch (_that) {
case _ConfigExtendedParams():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfigExtendedParams value)?  $default,){
final _that = this;
switch (_that) {
case _ConfigExtendedParams() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "is-patch")  bool isPatch, @JsonKey(name: "selected-map")  SelectedMap selectedMap, @JsonKey(name: "override-dns")  bool overrideDns, @JsonKey(name: "test-url")  String testUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfigExtendedParams() when $default != null:
return $default(_that.isPatch,_that.selectedMap,_that.overrideDns,_that.testUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "is-patch")  bool isPatch, @JsonKey(name: "selected-map")  SelectedMap selectedMap, @JsonKey(name: "override-dns")  bool overrideDns, @JsonKey(name: "test-url")  String testUrl)  $default,) {final _that = this;
switch (_that) {
case _ConfigExtendedParams():
return $default(_that.isPatch,_that.selectedMap,_that.overrideDns,_that.testUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "is-patch")  bool isPatch, @JsonKey(name: "selected-map")  SelectedMap selectedMap, @JsonKey(name: "override-dns")  bool overrideDns, @JsonKey(name: "test-url")  String testUrl)?  $default,) {final _that = this;
switch (_that) {
case _ConfigExtendedParams() when $default != null:
return $default(_that.isPatch,_that.selectedMap,_that.overrideDns,_that.testUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfigExtendedParams implements ConfigExtendedParams {
  const _ConfigExtendedParams({@JsonKey(name: "is-patch") required this.isPatch, @JsonKey(name: "selected-map") required final  SelectedMap selectedMap, @JsonKey(name: "override-dns") required this.overrideDns, @JsonKey(name: "test-url") required this.testUrl}): _selectedMap = selectedMap;
  factory _ConfigExtendedParams.fromJson(Map<String, dynamic> json) => _$ConfigExtendedParamsFromJson(json);

@override@JsonKey(name: "is-patch") final  bool isPatch;
 final  SelectedMap _selectedMap;
@override@JsonKey(name: "selected-map") SelectedMap get selectedMap {
  if (_selectedMap is EqualUnmodifiableMapView) return _selectedMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_selectedMap);
}

@override@JsonKey(name: "override-dns") final  bool overrideDns;
@override@JsonKey(name: "test-url") final  String testUrl;

/// Create a copy of ConfigExtendedParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfigExtendedParamsCopyWith<_ConfigExtendedParams> get copyWith => __$ConfigExtendedParamsCopyWithImpl<_ConfigExtendedParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfigExtendedParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfigExtendedParams&&(identical(other.isPatch, isPatch) || other.isPatch == isPatch)&&const DeepCollectionEquality().equals(other._selectedMap, _selectedMap)&&(identical(other.overrideDns, overrideDns) || other.overrideDns == overrideDns)&&(identical(other.testUrl, testUrl) || other.testUrl == testUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPatch,const DeepCollectionEquality().hash(_selectedMap),overrideDns,testUrl);

@override
String toString() {
  return 'ConfigExtendedParams(isPatch: $isPatch, selectedMap: $selectedMap, overrideDns: $overrideDns, testUrl: $testUrl)';
}


}

/// @nodoc
abstract mixin class _$ConfigExtendedParamsCopyWith<$Res> implements $ConfigExtendedParamsCopyWith<$Res> {
  factory _$ConfigExtendedParamsCopyWith(_ConfigExtendedParams value, $Res Function(_ConfigExtendedParams) _then) = __$ConfigExtendedParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "is-patch") bool isPatch,@JsonKey(name: "selected-map") SelectedMap selectedMap,@JsonKey(name: "override-dns") bool overrideDns,@JsonKey(name: "test-url") String testUrl
});




}
/// @nodoc
class __$ConfigExtendedParamsCopyWithImpl<$Res>
    implements _$ConfigExtendedParamsCopyWith<$Res> {
  __$ConfigExtendedParamsCopyWithImpl(this._self, this._then);

  final _ConfigExtendedParams _self;
  final $Res Function(_ConfigExtendedParams) _then;

/// Create a copy of ConfigExtendedParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPatch = null,Object? selectedMap = null,Object? overrideDns = null,Object? testUrl = null,}) {
  return _then(_ConfigExtendedParams(
isPatch: null == isPatch ? _self.isPatch : isPatch // ignore: cast_nullable_to_non_nullable
as bool,selectedMap: null == selectedMap ? _self._selectedMap : selectedMap // ignore: cast_nullable_to_non_nullable
as SelectedMap,overrideDns: null == overrideDns ? _self.overrideDns : overrideDns // ignore: cast_nullable_to_non_nullable
as bool,testUrl: null == testUrl ? _self.testUrl : testUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UpdateConfigParams {

@JsonKey(name: "profile-id") String get profileId; ClashConfig get config; ConfigExtendedParams get params;
/// Create a copy of UpdateConfigParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateConfigParamsCopyWith<UpdateConfigParams> get copyWith => _$UpdateConfigParamsCopyWithImpl<UpdateConfigParams>(this as UpdateConfigParams, _$identity);

  /// Serializes this UpdateConfigParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateConfigParams&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.config, config) || other.config == config)&&(identical(other.params, params) || other.params == params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileId,config,params);

@override
String toString() {
  return 'UpdateConfigParams(profileId: $profileId, config: $config, params: $params)';
}


}

/// @nodoc
abstract mixin class $UpdateConfigParamsCopyWith<$Res>  {
  factory $UpdateConfigParamsCopyWith(UpdateConfigParams value, $Res Function(UpdateConfigParams) _then) = _$UpdateConfigParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "profile-id") String profileId, ClashConfig config, ConfigExtendedParams params
});


$ClashConfigCopyWith<$Res> get config;$ConfigExtendedParamsCopyWith<$Res> get params;

}
/// @nodoc
class _$UpdateConfigParamsCopyWithImpl<$Res>
    implements $UpdateConfigParamsCopyWith<$Res> {
  _$UpdateConfigParamsCopyWithImpl(this._self, this._then);

  final UpdateConfigParams _self;
  final $Res Function(UpdateConfigParams) _then;

/// Create a copy of UpdateConfigParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profileId = null,Object? config = null,Object? params = null,}) {
  return _then(_self.copyWith(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ClashConfig,params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as ConfigExtendedParams,
  ));
}
/// Create a copy of UpdateConfigParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClashConfigCopyWith<$Res> get config {
  
  return $ClashConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}/// Create a copy of UpdateConfigParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfigExtendedParamsCopyWith<$Res> get params {
  
  return $ConfigExtendedParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateConfigParams].
extension UpdateConfigParamsPatterns on UpdateConfigParams {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateConfigParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateConfigParams() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateConfigParams value)  $default,){
final _that = this;
switch (_that) {
case _UpdateConfigParams():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateConfigParams value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateConfigParams() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "profile-id")  String profileId,  ClashConfig config,  ConfigExtendedParams params)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateConfigParams() when $default != null:
return $default(_that.profileId,_that.config,_that.params);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "profile-id")  String profileId,  ClashConfig config,  ConfigExtendedParams params)  $default,) {final _that = this;
switch (_that) {
case _UpdateConfigParams():
return $default(_that.profileId,_that.config,_that.params);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "profile-id")  String profileId,  ClashConfig config,  ConfigExtendedParams params)?  $default,) {final _that = this;
switch (_that) {
case _UpdateConfigParams() when $default != null:
return $default(_that.profileId,_that.config,_that.params);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateConfigParams implements UpdateConfigParams {
  const _UpdateConfigParams({@JsonKey(name: "profile-id") required this.profileId, required this.config, required this.params});
  factory _UpdateConfigParams.fromJson(Map<String, dynamic> json) => _$UpdateConfigParamsFromJson(json);

@override@JsonKey(name: "profile-id") final  String profileId;
@override final  ClashConfig config;
@override final  ConfigExtendedParams params;

/// Create a copy of UpdateConfigParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateConfigParamsCopyWith<_UpdateConfigParams> get copyWith => __$UpdateConfigParamsCopyWithImpl<_UpdateConfigParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateConfigParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateConfigParams&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.config, config) || other.config == config)&&(identical(other.params, params) || other.params == params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profileId,config,params);

@override
String toString() {
  return 'UpdateConfigParams(profileId: $profileId, config: $config, params: $params)';
}


}

/// @nodoc
abstract mixin class _$UpdateConfigParamsCopyWith<$Res> implements $UpdateConfigParamsCopyWith<$Res> {
  factory _$UpdateConfigParamsCopyWith(_UpdateConfigParams value, $Res Function(_UpdateConfigParams) _then) = __$UpdateConfigParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "profile-id") String profileId, ClashConfig config, ConfigExtendedParams params
});


@override $ClashConfigCopyWith<$Res> get config;@override $ConfigExtendedParamsCopyWith<$Res> get params;

}
/// @nodoc
class __$UpdateConfigParamsCopyWithImpl<$Res>
    implements _$UpdateConfigParamsCopyWith<$Res> {
  __$UpdateConfigParamsCopyWithImpl(this._self, this._then);

  final _UpdateConfigParams _self;
  final $Res Function(_UpdateConfigParams) _then;

/// Create a copy of UpdateConfigParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profileId = null,Object? config = null,Object? params = null,}) {
  return _then(_UpdateConfigParams(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ClashConfig,params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as ConfigExtendedParams,
  ));
}

/// Create a copy of UpdateConfigParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClashConfigCopyWith<$Res> get config {
  
  return $ClashConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}/// Create a copy of UpdateConfigParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfigExtendedParamsCopyWith<$Res> get params {
  
  return $ConfigExtendedParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}


/// @nodoc
mixin _$ChangeProxyParams {

@JsonKey(name: "group-name") String get groupName;@JsonKey(name: "proxy-name") String get proxyName;
/// Create a copy of ChangeProxyParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeProxyParamsCopyWith<ChangeProxyParams> get copyWith => _$ChangeProxyParamsCopyWithImpl<ChangeProxyParams>(this as ChangeProxyParams, _$identity);

  /// Serializes this ChangeProxyParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeProxyParams&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.proxyName, proxyName) || other.proxyName == proxyName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupName,proxyName);

@override
String toString() {
  return 'ChangeProxyParams(groupName: $groupName, proxyName: $proxyName)';
}


}

/// @nodoc
abstract mixin class $ChangeProxyParamsCopyWith<$Res>  {
  factory $ChangeProxyParamsCopyWith(ChangeProxyParams value, $Res Function(ChangeProxyParams) _then) = _$ChangeProxyParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "group-name") String groupName,@JsonKey(name: "proxy-name") String proxyName
});




}
/// @nodoc
class _$ChangeProxyParamsCopyWithImpl<$Res>
    implements $ChangeProxyParamsCopyWith<$Res> {
  _$ChangeProxyParamsCopyWithImpl(this._self, this._then);

  final ChangeProxyParams _self;
  final $Res Function(ChangeProxyParams) _then;

/// Create a copy of ChangeProxyParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupName = null,Object? proxyName = null,}) {
  return _then(_self.copyWith(
groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,proxyName: null == proxyName ? _self.proxyName : proxyName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangeProxyParams].
extension ChangeProxyParamsPatterns on ChangeProxyParams {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangeProxyParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeProxyParams() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangeProxyParams value)  $default,){
final _that = this;
switch (_that) {
case _ChangeProxyParams():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangeProxyParams value)?  $default,){
final _that = this;
switch (_that) {
case _ChangeProxyParams() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "group-name")  String groupName, @JsonKey(name: "proxy-name")  String proxyName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeProxyParams() when $default != null:
return $default(_that.groupName,_that.proxyName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "group-name")  String groupName, @JsonKey(name: "proxy-name")  String proxyName)  $default,) {final _that = this;
switch (_that) {
case _ChangeProxyParams():
return $default(_that.groupName,_that.proxyName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "group-name")  String groupName, @JsonKey(name: "proxy-name")  String proxyName)?  $default,) {final _that = this;
switch (_that) {
case _ChangeProxyParams() when $default != null:
return $default(_that.groupName,_that.proxyName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangeProxyParams implements ChangeProxyParams {
  const _ChangeProxyParams({@JsonKey(name: "group-name") required this.groupName, @JsonKey(name: "proxy-name") required this.proxyName});
  factory _ChangeProxyParams.fromJson(Map<String, dynamic> json) => _$ChangeProxyParamsFromJson(json);

@override@JsonKey(name: "group-name") final  String groupName;
@override@JsonKey(name: "proxy-name") final  String proxyName;

/// Create a copy of ChangeProxyParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeProxyParamsCopyWith<_ChangeProxyParams> get copyWith => __$ChangeProxyParamsCopyWithImpl<_ChangeProxyParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangeProxyParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeProxyParams&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.proxyName, proxyName) || other.proxyName == proxyName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupName,proxyName);

@override
String toString() {
  return 'ChangeProxyParams(groupName: $groupName, proxyName: $proxyName)';
}


}

/// @nodoc
abstract mixin class _$ChangeProxyParamsCopyWith<$Res> implements $ChangeProxyParamsCopyWith<$Res> {
  factory _$ChangeProxyParamsCopyWith(_ChangeProxyParams value, $Res Function(_ChangeProxyParams) _then) = __$ChangeProxyParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "group-name") String groupName,@JsonKey(name: "proxy-name") String proxyName
});




}
/// @nodoc
class __$ChangeProxyParamsCopyWithImpl<$Res>
    implements _$ChangeProxyParamsCopyWith<$Res> {
  __$ChangeProxyParamsCopyWithImpl(this._self, this._then);

  final _ChangeProxyParams _self;
  final $Res Function(_ChangeProxyParams) _then;

/// Create a copy of ChangeProxyParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupName = null,Object? proxyName = null,}) {
  return _then(_ChangeProxyParams(
groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,proxyName: null == proxyName ? _self.proxyName : proxyName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UpdateGeoDataParams {

@JsonKey(name: "geo-type") String get geoType;@JsonKey(name: "geo-name") String get geoName;
/// Create a copy of UpdateGeoDataParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateGeoDataParamsCopyWith<UpdateGeoDataParams> get copyWith => _$UpdateGeoDataParamsCopyWithImpl<UpdateGeoDataParams>(this as UpdateGeoDataParams, _$identity);

  /// Serializes this UpdateGeoDataParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateGeoDataParams&&(identical(other.geoType, geoType) || other.geoType == geoType)&&(identical(other.geoName, geoName) || other.geoName == geoName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,geoType,geoName);

@override
String toString() {
  return 'UpdateGeoDataParams(geoType: $geoType, geoName: $geoName)';
}


}

/// @nodoc
abstract mixin class $UpdateGeoDataParamsCopyWith<$Res>  {
  factory $UpdateGeoDataParamsCopyWith(UpdateGeoDataParams value, $Res Function(UpdateGeoDataParams) _then) = _$UpdateGeoDataParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "geo-type") String geoType,@JsonKey(name: "geo-name") String geoName
});




}
/// @nodoc
class _$UpdateGeoDataParamsCopyWithImpl<$Res>
    implements $UpdateGeoDataParamsCopyWith<$Res> {
  _$UpdateGeoDataParamsCopyWithImpl(this._self, this._then);

  final UpdateGeoDataParams _self;
  final $Res Function(UpdateGeoDataParams) _then;

/// Create a copy of UpdateGeoDataParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? geoType = null,Object? geoName = null,}) {
  return _then(_self.copyWith(
geoType: null == geoType ? _self.geoType : geoType // ignore: cast_nullable_to_non_nullable
as String,geoName: null == geoName ? _self.geoName : geoName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateGeoDataParams].
extension UpdateGeoDataParamsPatterns on UpdateGeoDataParams {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateGeoDataParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateGeoDataParams() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateGeoDataParams value)  $default,){
final _that = this;
switch (_that) {
case _UpdateGeoDataParams():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateGeoDataParams value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateGeoDataParams() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "geo-type")  String geoType, @JsonKey(name: "geo-name")  String geoName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateGeoDataParams() when $default != null:
return $default(_that.geoType,_that.geoName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "geo-type")  String geoType, @JsonKey(name: "geo-name")  String geoName)  $default,) {final _that = this;
switch (_that) {
case _UpdateGeoDataParams():
return $default(_that.geoType,_that.geoName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "geo-type")  String geoType, @JsonKey(name: "geo-name")  String geoName)?  $default,) {final _that = this;
switch (_that) {
case _UpdateGeoDataParams() when $default != null:
return $default(_that.geoType,_that.geoName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateGeoDataParams implements UpdateGeoDataParams {
  const _UpdateGeoDataParams({@JsonKey(name: "geo-type") required this.geoType, @JsonKey(name: "geo-name") required this.geoName});
  factory _UpdateGeoDataParams.fromJson(Map<String, dynamic> json) => _$UpdateGeoDataParamsFromJson(json);

@override@JsonKey(name: "geo-type") final  String geoType;
@override@JsonKey(name: "geo-name") final  String geoName;

/// Create a copy of UpdateGeoDataParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateGeoDataParamsCopyWith<_UpdateGeoDataParams> get copyWith => __$UpdateGeoDataParamsCopyWithImpl<_UpdateGeoDataParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateGeoDataParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateGeoDataParams&&(identical(other.geoType, geoType) || other.geoType == geoType)&&(identical(other.geoName, geoName) || other.geoName == geoName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,geoType,geoName);

@override
String toString() {
  return 'UpdateGeoDataParams(geoType: $geoType, geoName: $geoName)';
}


}

/// @nodoc
abstract mixin class _$UpdateGeoDataParamsCopyWith<$Res> implements $UpdateGeoDataParamsCopyWith<$Res> {
  factory _$UpdateGeoDataParamsCopyWith(_UpdateGeoDataParams value, $Res Function(_UpdateGeoDataParams) _then) = __$UpdateGeoDataParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "geo-type") String geoType,@JsonKey(name: "geo-name") String geoName
});




}
/// @nodoc
class __$UpdateGeoDataParamsCopyWithImpl<$Res>
    implements _$UpdateGeoDataParamsCopyWith<$Res> {
  __$UpdateGeoDataParamsCopyWithImpl(this._self, this._then);

  final _UpdateGeoDataParams _self;
  final $Res Function(_UpdateGeoDataParams) _then;

/// Create a copy of UpdateGeoDataParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? geoType = null,Object? geoName = null,}) {
  return _then(_UpdateGeoDataParams(
geoType: null == geoType ? _self.geoType : geoType // ignore: cast_nullable_to_non_nullable
as String,geoName: null == geoName ? _self.geoName : geoName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AppMessage {

 AppMessageType get type; dynamic get data;
/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppMessageCopyWith<AppMessage> get copyWith => _$AppMessageCopyWithImpl<AppMessage>(this as AppMessage, _$identity);

  /// Serializes this AppMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppMessage&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AppMessage(type: $type, data: $data)';
}


}

/// @nodoc
abstract mixin class $AppMessageCopyWith<$Res>  {
  factory $AppMessageCopyWith(AppMessage value, $Res Function(AppMessage) _then) = _$AppMessageCopyWithImpl;
@useResult
$Res call({
 AppMessageType type, dynamic data
});




}
/// @nodoc
class _$AppMessageCopyWithImpl<$Res>
    implements $AppMessageCopyWith<$Res> {
  _$AppMessageCopyWithImpl(this._self, this._then);

  final AppMessage _self;
  final $Res Function(AppMessage) _then;

/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AppMessageType,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [AppMessage].
extension AppMessagePatterns on AppMessage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppMessage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppMessage value)  $default,){
final _that = this;
switch (_that) {
case _AppMessage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppMessage value)?  $default,){
final _that = this;
switch (_that) {
case _AppMessage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppMessageType type,  dynamic data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppMessage() when $default != null:
return $default(_that.type,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppMessageType type,  dynamic data)  $default,) {final _that = this;
switch (_that) {
case _AppMessage():
return $default(_that.type,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppMessageType type,  dynamic data)?  $default,) {final _that = this;
switch (_that) {
case _AppMessage() when $default != null:
return $default(_that.type,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppMessage implements AppMessage {
  const _AppMessage({required this.type, this.data});
  factory _AppMessage.fromJson(Map<String, dynamic> json) => _$AppMessageFromJson(json);

@override final  AppMessageType type;
@override final  dynamic data;

/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppMessageCopyWith<_AppMessage> get copyWith => __$AppMessageCopyWithImpl<_AppMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppMessage&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AppMessage(type: $type, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AppMessageCopyWith<$Res> implements $AppMessageCopyWith<$Res> {
  factory _$AppMessageCopyWith(_AppMessage value, $Res Function(_AppMessage) _then) = __$AppMessageCopyWithImpl;
@override @useResult
$Res call({
 AppMessageType type, dynamic data
});




}
/// @nodoc
class __$AppMessageCopyWithImpl<$Res>
    implements _$AppMessageCopyWith<$Res> {
  __$AppMessageCopyWithImpl(this._self, this._then);

  final _AppMessage _self;
  final $Res Function(_AppMessage) _then;

/// Create a copy of AppMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? data = freezed,}) {
  return _then(_AppMessage(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AppMessageType,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}


/// @nodoc
mixin _$InvokeMessage {

 InvokeMessageType get type; dynamic get data;
/// Create a copy of InvokeMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvokeMessageCopyWith<InvokeMessage> get copyWith => _$InvokeMessageCopyWithImpl<InvokeMessage>(this as InvokeMessage, _$identity);

  /// Serializes this InvokeMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvokeMessage&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'InvokeMessage(type: $type, data: $data)';
}


}

/// @nodoc
abstract mixin class $InvokeMessageCopyWith<$Res>  {
  factory $InvokeMessageCopyWith(InvokeMessage value, $Res Function(InvokeMessage) _then) = _$InvokeMessageCopyWithImpl;
@useResult
$Res call({
 InvokeMessageType type, dynamic data
});




}
/// @nodoc
class _$InvokeMessageCopyWithImpl<$Res>
    implements $InvokeMessageCopyWith<$Res> {
  _$InvokeMessageCopyWithImpl(this._self, this._then);

  final InvokeMessage _self;
  final $Res Function(InvokeMessage) _then;

/// Create a copy of InvokeMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as InvokeMessageType,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [InvokeMessage].
extension InvokeMessagePatterns on InvokeMessage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvokeMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvokeMessage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvokeMessage value)  $default,){
final _that = this;
switch (_that) {
case _InvokeMessage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvokeMessage value)?  $default,){
final _that = this;
switch (_that) {
case _InvokeMessage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InvokeMessageType type,  dynamic data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvokeMessage() when $default != null:
return $default(_that.type,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InvokeMessageType type,  dynamic data)  $default,) {final _that = this;
switch (_that) {
case _InvokeMessage():
return $default(_that.type,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InvokeMessageType type,  dynamic data)?  $default,) {final _that = this;
switch (_that) {
case _InvokeMessage() when $default != null:
return $default(_that.type,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvokeMessage implements InvokeMessage {
  const _InvokeMessage({required this.type, this.data});
  factory _InvokeMessage.fromJson(Map<String, dynamic> json) => _$InvokeMessageFromJson(json);

@override final  InvokeMessageType type;
@override final  dynamic data;

/// Create a copy of InvokeMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvokeMessageCopyWith<_InvokeMessage> get copyWith => __$InvokeMessageCopyWithImpl<_InvokeMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvokeMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvokeMessage&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'InvokeMessage(type: $type, data: $data)';
}


}

/// @nodoc
abstract mixin class _$InvokeMessageCopyWith<$Res> implements $InvokeMessageCopyWith<$Res> {
  factory _$InvokeMessageCopyWith(_InvokeMessage value, $Res Function(_InvokeMessage) _then) = __$InvokeMessageCopyWithImpl;
@override @useResult
$Res call({
 InvokeMessageType type, dynamic data
});




}
/// @nodoc
class __$InvokeMessageCopyWithImpl<$Res>
    implements _$InvokeMessageCopyWith<$Res> {
  __$InvokeMessageCopyWithImpl(this._self, this._then);

  final _InvokeMessage _self;
  final $Res Function(_InvokeMessage) _then;

/// Create a copy of InvokeMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? data = freezed,}) {
  return _then(_InvokeMessage(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as InvokeMessageType,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}


/// @nodoc
mixin _$Delay {

 String get name; String get url; int? get value;
/// Create a copy of Delay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DelayCopyWith<Delay> get copyWith => _$DelayCopyWithImpl<Delay>(this as Delay, _$identity);

  /// Serializes this Delay to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Delay&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url,value);

@override
String toString() {
  return 'Delay(name: $name, url: $url, value: $value)';
}


}

/// @nodoc
abstract mixin class $DelayCopyWith<$Res>  {
  factory $DelayCopyWith(Delay value, $Res Function(Delay) _then) = _$DelayCopyWithImpl;
@useResult
$Res call({
 String name, String url, int? value
});




}
/// @nodoc
class _$DelayCopyWithImpl<$Res>
    implements $DelayCopyWith<$Res> {
  _$DelayCopyWithImpl(this._self, this._then);

  final Delay _self;
  final $Res Function(Delay) _then;

/// Create a copy of Delay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,Object? value = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Delay].
extension DelayPatterns on Delay {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Delay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Delay() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Delay value)  $default,){
final _that = this;
switch (_that) {
case _Delay():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Delay value)?  $default,){
final _that = this;
switch (_that) {
case _Delay() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String url,  int? value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Delay() when $default != null:
return $default(_that.name,_that.url,_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String url,  int? value)  $default,) {final _that = this;
switch (_that) {
case _Delay():
return $default(_that.name,_that.url,_that.value);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String url,  int? value)?  $default,) {final _that = this;
switch (_that) {
case _Delay() when $default != null:
return $default(_that.name,_that.url,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Delay implements Delay {
  const _Delay({required this.name, required this.url, this.value});
  factory _Delay.fromJson(Map<String, dynamic> json) => _$DelayFromJson(json);

@override final  String name;
@override final  String url;
@override final  int? value;

/// Create a copy of Delay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DelayCopyWith<_Delay> get copyWith => __$DelayCopyWithImpl<_Delay>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DelayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delay&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url,value);

@override
String toString() {
  return 'Delay(name: $name, url: $url, value: $value)';
}


}

/// @nodoc
abstract mixin class _$DelayCopyWith<$Res> implements $DelayCopyWith<$Res> {
  factory _$DelayCopyWith(_Delay value, $Res Function(_Delay) _then) = __$DelayCopyWithImpl;
@override @useResult
$Res call({
 String name, String url, int? value
});




}
/// @nodoc
class __$DelayCopyWithImpl<$Res>
    implements _$DelayCopyWith<$Res> {
  __$DelayCopyWithImpl(this._self, this._then);

  final _Delay _self;
  final $Res Function(_Delay) _then;

/// Create a copy of Delay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,Object? value = freezed,}) {
  return _then(_Delay(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Now {

 String get name; String get value;
/// Create a copy of Now
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NowCopyWith<Now> get copyWith => _$NowCopyWithImpl<Now>(this as Now, _$identity);

  /// Serializes this Now to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Now&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,value);

@override
String toString() {
  return 'Now(name: $name, value: $value)';
}


}

/// @nodoc
abstract mixin class $NowCopyWith<$Res>  {
  factory $NowCopyWith(Now value, $Res Function(Now) _then) = _$NowCopyWithImpl;
@useResult
$Res call({
 String name, String value
});




}
/// @nodoc
class _$NowCopyWithImpl<$Res>
    implements $NowCopyWith<$Res> {
  _$NowCopyWithImpl(this._self, this._then);

  final Now _self;
  final $Res Function(Now) _then;

/// Create a copy of Now
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? value = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Now].
extension NowPatterns on Now {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Now value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Now() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Now value)  $default,){
final _that = this;
switch (_that) {
case _Now():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Now value)?  $default,){
final _that = this;
switch (_that) {
case _Now() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Now() when $default != null:
return $default(_that.name,_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String value)  $default,) {final _that = this;
switch (_that) {
case _Now():
return $default(_that.name,_that.value);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String value)?  $default,) {final _that = this;
switch (_that) {
case _Now() when $default != null:
return $default(_that.name,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Now implements Now {
  const _Now({required this.name, required this.value});
  factory _Now.fromJson(Map<String, dynamic> json) => _$NowFromJson(json);

@override final  String name;
@override final  String value;

/// Create a copy of Now
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NowCopyWith<_Now> get copyWith => __$NowCopyWithImpl<_Now>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Now&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,value);

@override
String toString() {
  return 'Now(name: $name, value: $value)';
}


}

/// @nodoc
abstract mixin class _$NowCopyWith<$Res> implements $NowCopyWith<$Res> {
  factory _$NowCopyWith(_Now value, $Res Function(_Now) _then) = __$NowCopyWithImpl;
@override @useResult
$Res call({
 String name, String value
});




}
/// @nodoc
class __$NowCopyWithImpl<$Res>
    implements _$NowCopyWith<$Res> {
  __$NowCopyWithImpl(this._self, this._then);

  final _Now _self;
  final $Res Function(_Now) _then;

/// Create a copy of Now
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? value = null,}) {
  return _then(_Now(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProcessData {

 String get id; Metadata get metadata;
/// Create a copy of ProcessData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessDataCopyWith<ProcessData> get copyWith => _$ProcessDataCopyWithImpl<ProcessData>(this as ProcessData, _$identity);

  /// Serializes this ProcessData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessData&&(identical(other.id, id) || other.id == id)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,metadata);

@override
String toString() {
  return 'ProcessData(id: $id, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ProcessDataCopyWith<$Res>  {
  factory $ProcessDataCopyWith(ProcessData value, $Res Function(ProcessData) _then) = _$ProcessDataCopyWithImpl;
@useResult
$Res call({
 String id, Metadata metadata
});


$MetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$ProcessDataCopyWithImpl<$Res>
    implements $ProcessDataCopyWith<$Res> {
  _$ProcessDataCopyWithImpl(this._self, this._then);

  final ProcessData _self;
  final $Res Function(ProcessData) _then;

/// Create a copy of ProcessData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Metadata,
  ));
}
/// Create a copy of ProcessData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataCopyWith<$Res> get metadata {
  
  return $MetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProcessData].
extension ProcessDataPatterns on ProcessData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessData value)  $default,){
final _that = this;
switch (_that) {
case _ProcessData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessData value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Metadata metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessData() when $default != null:
return $default(_that.id,_that.metadata);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Metadata metadata)  $default,) {final _that = this;
switch (_that) {
case _ProcessData():
return $default(_that.id,_that.metadata);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Metadata metadata)?  $default,) {final _that = this;
switch (_that) {
case _ProcessData() when $default != null:
return $default(_that.id,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessData implements ProcessData {
  const _ProcessData({required this.id, required this.metadata});
  factory _ProcessData.fromJson(Map<String, dynamic> json) => _$ProcessDataFromJson(json);

@override final  String id;
@override final  Metadata metadata;

/// Create a copy of ProcessData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessDataCopyWith<_ProcessData> get copyWith => __$ProcessDataCopyWithImpl<_ProcessData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessData&&(identical(other.id, id) || other.id == id)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,metadata);

@override
String toString() {
  return 'ProcessData(id: $id, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ProcessDataCopyWith<$Res> implements $ProcessDataCopyWith<$Res> {
  factory _$ProcessDataCopyWith(_ProcessData value, $Res Function(_ProcessData) _then) = __$ProcessDataCopyWithImpl;
@override @useResult
$Res call({
 String id, Metadata metadata
});


@override $MetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$ProcessDataCopyWithImpl<$Res>
    implements _$ProcessDataCopyWith<$Res> {
  __$ProcessDataCopyWithImpl(this._self, this._then);

  final _ProcessData _self;
  final $Res Function(_ProcessData) _then;

/// Create a copy of ProcessData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? metadata = null,}) {
  return _then(_ProcessData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Metadata,
  ));
}

/// Create a copy of ProcessData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataCopyWith<$Res> get metadata {
  
  return $MetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// @nodoc
mixin _$Fd {

 String get id; int get value;
/// Create a copy of Fd
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FdCopyWith<Fd> get copyWith => _$FdCopyWithImpl<Fd>(this as Fd, _$identity);

  /// Serializes this Fd to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Fd&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,value);

@override
String toString() {
  return 'Fd(id: $id, value: $value)';
}


}

/// @nodoc
abstract mixin class $FdCopyWith<$Res>  {
  factory $FdCopyWith(Fd value, $Res Function(Fd) _then) = _$FdCopyWithImpl;
@useResult
$Res call({
 String id, int value
});




}
/// @nodoc
class _$FdCopyWithImpl<$Res>
    implements $FdCopyWith<$Res> {
  _$FdCopyWithImpl(this._self, this._then);

  final Fd _self;
  final $Res Function(Fd) _then;

/// Create a copy of Fd
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? value = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Fd].
extension FdPatterns on Fd {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Fd value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fd() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Fd value)  $default,){
final _that = this;
switch (_that) {
case _Fd():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Fd value)?  $default,){
final _that = this;
switch (_that) {
case _Fd() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fd() when $default != null:
return $default(_that.id,_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int value)  $default,) {final _that = this;
switch (_that) {
case _Fd():
return $default(_that.id,_that.value);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int value)?  $default,) {final _that = this;
switch (_that) {
case _Fd() when $default != null:
return $default(_that.id,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Fd implements Fd {
  const _Fd({required this.id, required this.value});
  factory _Fd.fromJson(Map<String, dynamic> json) => _$FdFromJson(json);

@override final  String id;
@override final  int value;

/// Create a copy of Fd
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FdCopyWith<_Fd> get copyWith => __$FdCopyWithImpl<_Fd>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FdToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fd&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,value);

@override
String toString() {
  return 'Fd(id: $id, value: $value)';
}


}

/// @nodoc
abstract mixin class _$FdCopyWith<$Res> implements $FdCopyWith<$Res> {
  factory _$FdCopyWith(_Fd value, $Res Function(_Fd) _then) = __$FdCopyWithImpl;
@override @useResult
$Res call({
 String id, int value
});




}
/// @nodoc
class __$FdCopyWithImpl<$Res>
    implements _$FdCopyWith<$Res> {
  __$FdCopyWithImpl(this._self, this._then);

  final _Fd _self;
  final $Res Function(_Fd) _then;

/// Create a copy of Fd
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? value = null,}) {
  return _then(_Fd(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ProcessMapItem {

 String get id; String get value;
/// Create a copy of ProcessMapItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessMapItemCopyWith<ProcessMapItem> get copyWith => _$ProcessMapItemCopyWithImpl<ProcessMapItem>(this as ProcessMapItem, _$identity);

  /// Serializes this ProcessMapItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessMapItem&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,value);

@override
String toString() {
  return 'ProcessMapItem(id: $id, value: $value)';
}


}

/// @nodoc
abstract mixin class $ProcessMapItemCopyWith<$Res>  {
  factory $ProcessMapItemCopyWith(ProcessMapItem value, $Res Function(ProcessMapItem) _then) = _$ProcessMapItemCopyWithImpl;
@useResult
$Res call({
 String id, String value
});




}
/// @nodoc
class _$ProcessMapItemCopyWithImpl<$Res>
    implements $ProcessMapItemCopyWith<$Res> {
  _$ProcessMapItemCopyWithImpl(this._self, this._then);

  final ProcessMapItem _self;
  final $Res Function(ProcessMapItem) _then;

/// Create a copy of ProcessMapItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? value = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcessMapItem].
extension ProcessMapItemPatterns on ProcessMapItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessMapItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessMapItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessMapItem value)  $default,){
final _that = this;
switch (_that) {
case _ProcessMapItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessMapItem value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessMapItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessMapItem() when $default != null:
return $default(_that.id,_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String value)  $default,) {final _that = this;
switch (_that) {
case _ProcessMapItem():
return $default(_that.id,_that.value);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String value)?  $default,) {final _that = this;
switch (_that) {
case _ProcessMapItem() when $default != null:
return $default(_that.id,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessMapItem implements ProcessMapItem {
  const _ProcessMapItem({required this.id, required this.value});
  factory _ProcessMapItem.fromJson(Map<String, dynamic> json) => _$ProcessMapItemFromJson(json);

@override final  String id;
@override final  String value;

/// Create a copy of ProcessMapItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessMapItemCopyWith<_ProcessMapItem> get copyWith => __$ProcessMapItemCopyWithImpl<_ProcessMapItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessMapItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessMapItem&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,value);

@override
String toString() {
  return 'ProcessMapItem(id: $id, value: $value)';
}


}

/// @nodoc
abstract mixin class _$ProcessMapItemCopyWith<$Res> implements $ProcessMapItemCopyWith<$Res> {
  factory _$ProcessMapItemCopyWith(_ProcessMapItem value, $Res Function(_ProcessMapItem) _then) = __$ProcessMapItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String value
});




}
/// @nodoc
class __$ProcessMapItemCopyWithImpl<$Res>
    implements _$ProcessMapItemCopyWith<$Res> {
  __$ProcessMapItemCopyWithImpl(this._self, this._then);

  final _ProcessMapItem _self;
  final $Res Function(_ProcessMapItem) _then;

/// Create a copy of ProcessMapItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? value = null,}) {
  return _then(_ProcessMapItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProviderSubscriptionInfo {

@JsonKey(name: "UPLOAD") int get upload;@JsonKey(name: "DOWNLOAD") int get download;@JsonKey(name: "TOTAL") int get total;@JsonKey(name: "EXPIRE") int get expire;
/// Create a copy of ProviderSubscriptionInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderSubscriptionInfoCopyWith<ProviderSubscriptionInfo> get copyWith => _$ProviderSubscriptionInfoCopyWithImpl<ProviderSubscriptionInfo>(this as ProviderSubscriptionInfo, _$identity);

  /// Serializes this ProviderSubscriptionInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderSubscriptionInfo&&(identical(other.upload, upload) || other.upload == upload)&&(identical(other.download, download) || other.download == download)&&(identical(other.total, total) || other.total == total)&&(identical(other.expire, expire) || other.expire == expire));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,upload,download,total,expire);

@override
String toString() {
  return 'ProviderSubscriptionInfo(upload: $upload, download: $download, total: $total, expire: $expire)';
}


}

/// @nodoc
abstract mixin class $ProviderSubscriptionInfoCopyWith<$Res>  {
  factory $ProviderSubscriptionInfoCopyWith(ProviderSubscriptionInfo value, $Res Function(ProviderSubscriptionInfo) _then) = _$ProviderSubscriptionInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "UPLOAD") int upload,@JsonKey(name: "DOWNLOAD") int download,@JsonKey(name: "TOTAL") int total,@JsonKey(name: "EXPIRE") int expire
});




}
/// @nodoc
class _$ProviderSubscriptionInfoCopyWithImpl<$Res>
    implements $ProviderSubscriptionInfoCopyWith<$Res> {
  _$ProviderSubscriptionInfoCopyWithImpl(this._self, this._then);

  final ProviderSubscriptionInfo _self;
  final $Res Function(ProviderSubscriptionInfo) _then;

/// Create a copy of ProviderSubscriptionInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? upload = null,Object? download = null,Object? total = null,Object? expire = null,}) {
  return _then(_self.copyWith(
upload: null == upload ? _self.upload : upload // ignore: cast_nullable_to_non_nullable
as int,download: null == download ? _self.download : download // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,expire: null == expire ? _self.expire : expire // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProviderSubscriptionInfo].
extension ProviderSubscriptionInfoPatterns on ProviderSubscriptionInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProviderSubscriptionInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProviderSubscriptionInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProviderSubscriptionInfo value)  $default,){
final _that = this;
switch (_that) {
case _ProviderSubscriptionInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProviderSubscriptionInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ProviderSubscriptionInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "UPLOAD")  int upload, @JsonKey(name: "DOWNLOAD")  int download, @JsonKey(name: "TOTAL")  int total, @JsonKey(name: "EXPIRE")  int expire)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProviderSubscriptionInfo() when $default != null:
return $default(_that.upload,_that.download,_that.total,_that.expire);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "UPLOAD")  int upload, @JsonKey(name: "DOWNLOAD")  int download, @JsonKey(name: "TOTAL")  int total, @JsonKey(name: "EXPIRE")  int expire)  $default,) {final _that = this;
switch (_that) {
case _ProviderSubscriptionInfo():
return $default(_that.upload,_that.download,_that.total,_that.expire);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "UPLOAD")  int upload, @JsonKey(name: "DOWNLOAD")  int download, @JsonKey(name: "TOTAL")  int total, @JsonKey(name: "EXPIRE")  int expire)?  $default,) {final _that = this;
switch (_that) {
case _ProviderSubscriptionInfo() when $default != null:
return $default(_that.upload,_that.download,_that.total,_that.expire);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProviderSubscriptionInfo implements ProviderSubscriptionInfo {
  const _ProviderSubscriptionInfo({@JsonKey(name: "UPLOAD") this.upload = 0, @JsonKey(name: "DOWNLOAD") this.download = 0, @JsonKey(name: "TOTAL") this.total = 0, @JsonKey(name: "EXPIRE") this.expire = 0});
  factory _ProviderSubscriptionInfo.fromJson(Map<String, dynamic> json) => _$ProviderSubscriptionInfoFromJson(json);

@override@JsonKey(name: "UPLOAD") final  int upload;
@override@JsonKey(name: "DOWNLOAD") final  int download;
@override@JsonKey(name: "TOTAL") final  int total;
@override@JsonKey(name: "EXPIRE") final  int expire;

/// Create a copy of ProviderSubscriptionInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProviderSubscriptionInfoCopyWith<_ProviderSubscriptionInfo> get copyWith => __$ProviderSubscriptionInfoCopyWithImpl<_ProviderSubscriptionInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProviderSubscriptionInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProviderSubscriptionInfo&&(identical(other.upload, upload) || other.upload == upload)&&(identical(other.download, download) || other.download == download)&&(identical(other.total, total) || other.total == total)&&(identical(other.expire, expire) || other.expire == expire));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,upload,download,total,expire);

@override
String toString() {
  return 'ProviderSubscriptionInfo(upload: $upload, download: $download, total: $total, expire: $expire)';
}


}

/// @nodoc
abstract mixin class _$ProviderSubscriptionInfoCopyWith<$Res> implements $ProviderSubscriptionInfoCopyWith<$Res> {
  factory _$ProviderSubscriptionInfoCopyWith(_ProviderSubscriptionInfo value, $Res Function(_ProviderSubscriptionInfo) _then) = __$ProviderSubscriptionInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "UPLOAD") int upload,@JsonKey(name: "DOWNLOAD") int download,@JsonKey(name: "TOTAL") int total,@JsonKey(name: "EXPIRE") int expire
});




}
/// @nodoc
class __$ProviderSubscriptionInfoCopyWithImpl<$Res>
    implements _$ProviderSubscriptionInfoCopyWith<$Res> {
  __$ProviderSubscriptionInfoCopyWithImpl(this._self, this._then);

  final _ProviderSubscriptionInfo _self;
  final $Res Function(_ProviderSubscriptionInfo) _then;

/// Create a copy of ProviderSubscriptionInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? upload = null,Object? download = null,Object? total = null,Object? expire = null,}) {
  return _then(_ProviderSubscriptionInfo(
upload: null == upload ? _self.upload : upload // ignore: cast_nullable_to_non_nullable
as int,download: null == download ? _self.download : download // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,expire: null == expire ? _self.expire : expire // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ExternalProvider {

 String get name; String get type; String? get path; int get count;@JsonKey(name: "subscription-info", fromJson: subscriptionInfoFormCore) SubscriptionInfo? get subscriptionInfo; bool get isUpdating;@JsonKey(name: "vehicle-type") String get vehicleType;@JsonKey(name: "update-at") DateTime get updateAt;
/// Create a copy of ExternalProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExternalProviderCopyWith<ExternalProvider> get copyWith => _$ExternalProviderCopyWithImpl<ExternalProvider>(this as ExternalProvider, _$identity);

  /// Serializes this ExternalProvider to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExternalProvider&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.path, path) || other.path == path)&&(identical(other.count, count) || other.count == count)&&(identical(other.subscriptionInfo, subscriptionInfo) || other.subscriptionInfo == subscriptionInfo)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.updateAt, updateAt) || other.updateAt == updateAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,path,count,subscriptionInfo,isUpdating,vehicleType,updateAt);

@override
String toString() {
  return 'ExternalProvider(name: $name, type: $type, path: $path, count: $count, subscriptionInfo: $subscriptionInfo, isUpdating: $isUpdating, vehicleType: $vehicleType, updateAt: $updateAt)';
}


}

/// @nodoc
abstract mixin class $ExternalProviderCopyWith<$Res>  {
  factory $ExternalProviderCopyWith(ExternalProvider value, $Res Function(ExternalProvider) _then) = _$ExternalProviderCopyWithImpl;
@useResult
$Res call({
 String name, String type, String? path, int count,@JsonKey(name: "subscription-info", fromJson: subscriptionInfoFormCore) SubscriptionInfo? subscriptionInfo, bool isUpdating,@JsonKey(name: "vehicle-type") String vehicleType,@JsonKey(name: "update-at") DateTime updateAt
});


$SubscriptionInfoCopyWith<$Res>? get subscriptionInfo;

}
/// @nodoc
class _$ExternalProviderCopyWithImpl<$Res>
    implements $ExternalProviderCopyWith<$Res> {
  _$ExternalProviderCopyWithImpl(this._self, this._then);

  final ExternalProvider _self;
  final $Res Function(ExternalProvider) _then;

/// Create a copy of ExternalProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? path = freezed,Object? count = null,Object? subscriptionInfo = freezed,Object? isUpdating = null,Object? vehicleType = null,Object? updateAt = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,subscriptionInfo: freezed == subscriptionInfo ? _self.subscriptionInfo : subscriptionInfo // ignore: cast_nullable_to_non_nullable
as SubscriptionInfo?,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,updateAt: null == updateAt ? _self.updateAt : updateAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of ExternalProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriptionInfoCopyWith<$Res>? get subscriptionInfo {
    if (_self.subscriptionInfo == null) {
    return null;
  }

  return $SubscriptionInfoCopyWith<$Res>(_self.subscriptionInfo!, (value) {
    return _then(_self.copyWith(subscriptionInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExternalProvider].
extension ExternalProviderPatterns on ExternalProvider {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExternalProvider value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExternalProvider() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExternalProvider value)  $default,){
final _that = this;
switch (_that) {
case _ExternalProvider():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExternalProvider value)?  $default,){
final _that = this;
switch (_that) {
case _ExternalProvider() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String type,  String? path,  int count, @JsonKey(name: "subscription-info", fromJson: subscriptionInfoFormCore)  SubscriptionInfo? subscriptionInfo,  bool isUpdating, @JsonKey(name: "vehicle-type")  String vehicleType, @JsonKey(name: "update-at")  DateTime updateAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExternalProvider() when $default != null:
return $default(_that.name,_that.type,_that.path,_that.count,_that.subscriptionInfo,_that.isUpdating,_that.vehicleType,_that.updateAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String type,  String? path,  int count, @JsonKey(name: "subscription-info", fromJson: subscriptionInfoFormCore)  SubscriptionInfo? subscriptionInfo,  bool isUpdating, @JsonKey(name: "vehicle-type")  String vehicleType, @JsonKey(name: "update-at")  DateTime updateAt)  $default,) {final _that = this;
switch (_that) {
case _ExternalProvider():
return $default(_that.name,_that.type,_that.path,_that.count,_that.subscriptionInfo,_that.isUpdating,_that.vehicleType,_that.updateAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String type,  String? path,  int count, @JsonKey(name: "subscription-info", fromJson: subscriptionInfoFormCore)  SubscriptionInfo? subscriptionInfo,  bool isUpdating, @JsonKey(name: "vehicle-type")  String vehicleType, @JsonKey(name: "update-at")  DateTime updateAt)?  $default,) {final _that = this;
switch (_that) {
case _ExternalProvider() when $default != null:
return $default(_that.name,_that.type,_that.path,_that.count,_that.subscriptionInfo,_that.isUpdating,_that.vehicleType,_that.updateAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExternalProvider implements ExternalProvider {
  const _ExternalProvider({required this.name, required this.type, this.path, required this.count, @JsonKey(name: "subscription-info", fromJson: subscriptionInfoFormCore) this.subscriptionInfo, this.isUpdating = false, @JsonKey(name: "vehicle-type") required this.vehicleType, @JsonKey(name: "update-at") required this.updateAt});
  factory _ExternalProvider.fromJson(Map<String, dynamic> json) => _$ExternalProviderFromJson(json);

@override final  String name;
@override final  String type;
@override final  String? path;
@override final  int count;
@override@JsonKey(name: "subscription-info", fromJson: subscriptionInfoFormCore) final  SubscriptionInfo? subscriptionInfo;
@override@JsonKey() final  bool isUpdating;
@override@JsonKey(name: "vehicle-type") final  String vehicleType;
@override@JsonKey(name: "update-at") final  DateTime updateAt;

/// Create a copy of ExternalProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExternalProviderCopyWith<_ExternalProvider> get copyWith => __$ExternalProviderCopyWithImpl<_ExternalProvider>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExternalProviderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExternalProvider&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.path, path) || other.path == path)&&(identical(other.count, count) || other.count == count)&&(identical(other.subscriptionInfo, subscriptionInfo) || other.subscriptionInfo == subscriptionInfo)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.updateAt, updateAt) || other.updateAt == updateAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,path,count,subscriptionInfo,isUpdating,vehicleType,updateAt);

@override
String toString() {
  return 'ExternalProvider(name: $name, type: $type, path: $path, count: $count, subscriptionInfo: $subscriptionInfo, isUpdating: $isUpdating, vehicleType: $vehicleType, updateAt: $updateAt)';
}


}

/// @nodoc
abstract mixin class _$ExternalProviderCopyWith<$Res> implements $ExternalProviderCopyWith<$Res> {
  factory _$ExternalProviderCopyWith(_ExternalProvider value, $Res Function(_ExternalProvider) _then) = __$ExternalProviderCopyWithImpl;
@override @useResult
$Res call({
 String name, String type, String? path, int count,@JsonKey(name: "subscription-info", fromJson: subscriptionInfoFormCore) SubscriptionInfo? subscriptionInfo, bool isUpdating,@JsonKey(name: "vehicle-type") String vehicleType,@JsonKey(name: "update-at") DateTime updateAt
});


@override $SubscriptionInfoCopyWith<$Res>? get subscriptionInfo;

}
/// @nodoc
class __$ExternalProviderCopyWithImpl<$Res>
    implements _$ExternalProviderCopyWith<$Res> {
  __$ExternalProviderCopyWithImpl(this._self, this._then);

  final _ExternalProvider _self;
  final $Res Function(_ExternalProvider) _then;

/// Create a copy of ExternalProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? path = freezed,Object? count = null,Object? subscriptionInfo = freezed,Object? isUpdating = null,Object? vehicleType = null,Object? updateAt = null,}) {
  return _then(_ExternalProvider(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,subscriptionInfo: freezed == subscriptionInfo ? _self.subscriptionInfo : subscriptionInfo // ignore: cast_nullable_to_non_nullable
as SubscriptionInfo?,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,updateAt: null == updateAt ? _self.updateAt : updateAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of ExternalProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriptionInfoCopyWith<$Res>? get subscriptionInfo {
    if (_self.subscriptionInfo == null) {
    return null;
  }

  return $SubscriptionInfoCopyWith<$Res>(_self.subscriptionInfo!, (value) {
    return _then(_self.copyWith(subscriptionInfo: value));
  });
}
}


/// @nodoc
mixin _$TunProps {

 int get fd; String get gateway; String get gateway6; String get portal; String get portal6; String get dns; String get dns6;
/// Create a copy of TunProps
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TunPropsCopyWith<TunProps> get copyWith => _$TunPropsCopyWithImpl<TunProps>(this as TunProps, _$identity);

  /// Serializes this TunProps to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TunProps&&(identical(other.fd, fd) || other.fd == fd)&&(identical(other.gateway, gateway) || other.gateway == gateway)&&(identical(other.gateway6, gateway6) || other.gateway6 == gateway6)&&(identical(other.portal, portal) || other.portal == portal)&&(identical(other.portal6, portal6) || other.portal6 == portal6)&&(identical(other.dns, dns) || other.dns == dns)&&(identical(other.dns6, dns6) || other.dns6 == dns6));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fd,gateway,gateway6,portal,portal6,dns,dns6);

@override
String toString() {
  return 'TunProps(fd: $fd, gateway: $gateway, gateway6: $gateway6, portal: $portal, portal6: $portal6, dns: $dns, dns6: $dns6)';
}


}

/// @nodoc
abstract mixin class $TunPropsCopyWith<$Res>  {
  factory $TunPropsCopyWith(TunProps value, $Res Function(TunProps) _then) = _$TunPropsCopyWithImpl;
@useResult
$Res call({
 int fd, String gateway, String gateway6, String portal, String portal6, String dns, String dns6
});




}
/// @nodoc
class _$TunPropsCopyWithImpl<$Res>
    implements $TunPropsCopyWith<$Res> {
  _$TunPropsCopyWithImpl(this._self, this._then);

  final TunProps _self;
  final $Res Function(TunProps) _then;

/// Create a copy of TunProps
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fd = null,Object? gateway = null,Object? gateway6 = null,Object? portal = null,Object? portal6 = null,Object? dns = null,Object? dns6 = null,}) {
  return _then(_self.copyWith(
fd: null == fd ? _self.fd : fd // ignore: cast_nullable_to_non_nullable
as int,gateway: null == gateway ? _self.gateway : gateway // ignore: cast_nullable_to_non_nullable
as String,gateway6: null == gateway6 ? _self.gateway6 : gateway6 // ignore: cast_nullable_to_non_nullable
as String,portal: null == portal ? _self.portal : portal // ignore: cast_nullable_to_non_nullable
as String,portal6: null == portal6 ? _self.portal6 : portal6 // ignore: cast_nullable_to_non_nullable
as String,dns: null == dns ? _self.dns : dns // ignore: cast_nullable_to_non_nullable
as String,dns6: null == dns6 ? _self.dns6 : dns6 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TunProps].
extension TunPropsPatterns on TunProps {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TunProps value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TunProps() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TunProps value)  $default,){
final _that = this;
switch (_that) {
case _TunProps():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TunProps value)?  $default,){
final _that = this;
switch (_that) {
case _TunProps() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int fd,  String gateway,  String gateway6,  String portal,  String portal6,  String dns,  String dns6)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TunProps() when $default != null:
return $default(_that.fd,_that.gateway,_that.gateway6,_that.portal,_that.portal6,_that.dns,_that.dns6);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int fd,  String gateway,  String gateway6,  String portal,  String portal6,  String dns,  String dns6)  $default,) {final _that = this;
switch (_that) {
case _TunProps():
return $default(_that.fd,_that.gateway,_that.gateway6,_that.portal,_that.portal6,_that.dns,_that.dns6);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int fd,  String gateway,  String gateway6,  String portal,  String portal6,  String dns,  String dns6)?  $default,) {final _that = this;
switch (_that) {
case _TunProps() when $default != null:
return $default(_that.fd,_that.gateway,_that.gateway6,_that.portal,_that.portal6,_that.dns,_that.dns6);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TunProps implements TunProps {
  const _TunProps({required this.fd, required this.gateway, required this.gateway6, required this.portal, required this.portal6, required this.dns, required this.dns6});
  factory _TunProps.fromJson(Map<String, dynamic> json) => _$TunPropsFromJson(json);

@override final  int fd;
@override final  String gateway;
@override final  String gateway6;
@override final  String portal;
@override final  String portal6;
@override final  String dns;
@override final  String dns6;

/// Create a copy of TunProps
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TunPropsCopyWith<_TunProps> get copyWith => __$TunPropsCopyWithImpl<_TunProps>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TunPropsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TunProps&&(identical(other.fd, fd) || other.fd == fd)&&(identical(other.gateway, gateway) || other.gateway == gateway)&&(identical(other.gateway6, gateway6) || other.gateway6 == gateway6)&&(identical(other.portal, portal) || other.portal == portal)&&(identical(other.portal6, portal6) || other.portal6 == portal6)&&(identical(other.dns, dns) || other.dns == dns)&&(identical(other.dns6, dns6) || other.dns6 == dns6));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fd,gateway,gateway6,portal,portal6,dns,dns6);

@override
String toString() {
  return 'TunProps(fd: $fd, gateway: $gateway, gateway6: $gateway6, portal: $portal, portal6: $portal6, dns: $dns, dns6: $dns6)';
}


}

/// @nodoc
abstract mixin class _$TunPropsCopyWith<$Res> implements $TunPropsCopyWith<$Res> {
  factory _$TunPropsCopyWith(_TunProps value, $Res Function(_TunProps) _then) = __$TunPropsCopyWithImpl;
@override @useResult
$Res call({
 int fd, String gateway, String gateway6, String portal, String portal6, String dns, String dns6
});




}
/// @nodoc
class __$TunPropsCopyWithImpl<$Res>
    implements _$TunPropsCopyWith<$Res> {
  __$TunPropsCopyWithImpl(this._self, this._then);

  final _TunProps _self;
  final $Res Function(_TunProps) _then;

/// Create a copy of TunProps
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fd = null,Object? gateway = null,Object? gateway6 = null,Object? portal = null,Object? portal6 = null,Object? dns = null,Object? dns6 = null,}) {
  return _then(_TunProps(
fd: null == fd ? _self.fd : fd // ignore: cast_nullable_to_non_nullable
as int,gateway: null == gateway ? _self.gateway : gateway // ignore: cast_nullable_to_non_nullable
as String,gateway6: null == gateway6 ? _self.gateway6 : gateway6 // ignore: cast_nullable_to_non_nullable
as String,portal: null == portal ? _self.portal : portal // ignore: cast_nullable_to_non_nullable
as String,portal6: null == portal6 ? _self.portal6 : portal6 // ignore: cast_nullable_to_non_nullable
as String,dns: null == dns ? _self.dns : dns // ignore: cast_nullable_to_non_nullable
as String,dns6: null == dns6 ? _self.dns6 : dns6 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Action {

 ActionMethod get method; dynamic get data;@JsonKey(name: "default-value") dynamic get defaultValue; String get id;
/// Create a copy of Action
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionCopyWith<Action> get copyWith => _$ActionCopyWithImpl<Action>(this as Action, _$identity);

  /// Serializes this Action to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Action&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.defaultValue, defaultValue)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(defaultValue),id);

@override
String toString() {
  return 'Action(method: $method, data: $data, defaultValue: $defaultValue, id: $id)';
}


}

/// @nodoc
abstract mixin class $ActionCopyWith<$Res>  {
  factory $ActionCopyWith(Action value, $Res Function(Action) _then) = _$ActionCopyWithImpl;
@useResult
$Res call({
 ActionMethod method, dynamic data,@JsonKey(name: "default-value") dynamic defaultValue, String id
});




}
/// @nodoc
class _$ActionCopyWithImpl<$Res>
    implements $ActionCopyWith<$Res> {
  _$ActionCopyWithImpl(this._self, this._then);

  final Action _self;
  final $Res Function(Action) _then;

/// Create a copy of Action
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? data = freezed,Object? defaultValue = freezed,Object? id = null,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as ActionMethod,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as dynamic,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Action].
extension ActionPatterns on Action {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Action value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Action() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Action value)  $default,){
final _that = this;
switch (_that) {
case _Action():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Action value)?  $default,){
final _that = this;
switch (_that) {
case _Action() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ActionMethod method,  dynamic data, @JsonKey(name: "default-value")  dynamic defaultValue,  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Action() when $default != null:
return $default(_that.method,_that.data,_that.defaultValue,_that.id);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ActionMethod method,  dynamic data, @JsonKey(name: "default-value")  dynamic defaultValue,  String id)  $default,) {final _that = this;
switch (_that) {
case _Action():
return $default(_that.method,_that.data,_that.defaultValue,_that.id);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ActionMethod method,  dynamic data, @JsonKey(name: "default-value")  dynamic defaultValue,  String id)?  $default,) {final _that = this;
switch (_that) {
case _Action() when $default != null:
return $default(_that.method,_that.data,_that.defaultValue,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Action implements Action {
  const _Action({required this.method, required this.data, @JsonKey(name: "default-value") required this.defaultValue, required this.id});
  factory _Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

@override final  ActionMethod method;
@override final  dynamic data;
@override@JsonKey(name: "default-value") final  dynamic defaultValue;
@override final  String id;

/// Create a copy of Action
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionCopyWith<_Action> get copyWith => __$ActionCopyWithImpl<_Action>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Action&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.defaultValue, defaultValue)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(defaultValue),id);

@override
String toString() {
  return 'Action(method: $method, data: $data, defaultValue: $defaultValue, id: $id)';
}


}

/// @nodoc
abstract mixin class _$ActionCopyWith<$Res> implements $ActionCopyWith<$Res> {
  factory _$ActionCopyWith(_Action value, $Res Function(_Action) _then) = __$ActionCopyWithImpl;
@override @useResult
$Res call({
 ActionMethod method, dynamic data,@JsonKey(name: "default-value") dynamic defaultValue, String id
});




}
/// @nodoc
class __$ActionCopyWithImpl<$Res>
    implements _$ActionCopyWith<$Res> {
  __$ActionCopyWithImpl(this._self, this._then);

  final _Action _self;
  final $Res Function(_Action) _then;

/// Create a copy of Action
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? data = freezed,Object? defaultValue = freezed,Object? id = null,}) {
  return _then(_Action(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as ActionMethod,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as dynamic,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ActionResult {

 ActionMethod get method; dynamic get data; String? get id;
/// Create a copy of ActionResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionResultCopyWith<ActionResult> get copyWith => _$ActionResultCopyWithImpl<ActionResult>(this as ActionResult, _$identity);

  /// Serializes this ActionResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionResult&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,const DeepCollectionEquality().hash(data),id);

@override
String toString() {
  return 'ActionResult(method: $method, data: $data, id: $id)';
}


}

/// @nodoc
abstract mixin class $ActionResultCopyWith<$Res>  {
  factory $ActionResultCopyWith(ActionResult value, $Res Function(ActionResult) _then) = _$ActionResultCopyWithImpl;
@useResult
$Res call({
 ActionMethod method, dynamic data, String? id
});




}
/// @nodoc
class _$ActionResultCopyWithImpl<$Res>
    implements $ActionResultCopyWith<$Res> {
  _$ActionResultCopyWithImpl(this._self, this._then);

  final ActionResult _self;
  final $Res Function(ActionResult) _then;

/// Create a copy of ActionResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? data = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as ActionMethod,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActionResult].
extension ActionResultPatterns on ActionResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActionResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActionResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActionResult value)  $default,){
final _that = this;
switch (_that) {
case _ActionResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActionResult value)?  $default,){
final _that = this;
switch (_that) {
case _ActionResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ActionMethod method,  dynamic data,  String? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActionResult() when $default != null:
return $default(_that.method,_that.data,_that.id);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ActionMethod method,  dynamic data,  String? id)  $default,) {final _that = this;
switch (_that) {
case _ActionResult():
return $default(_that.method,_that.data,_that.id);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ActionMethod method,  dynamic data,  String? id)?  $default,) {final _that = this;
switch (_that) {
case _ActionResult() when $default != null:
return $default(_that.method,_that.data,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActionResult implements ActionResult {
  const _ActionResult({required this.method, required this.data, this.id});
  factory _ActionResult.fromJson(Map<String, dynamic> json) => _$ActionResultFromJson(json);

@override final  ActionMethod method;
@override final  dynamic data;
@override final  String? id;

/// Create a copy of ActionResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionResultCopyWith<_ActionResult> get copyWith => __$ActionResultCopyWithImpl<_ActionResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActionResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionResult&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,const DeepCollectionEquality().hash(data),id);

@override
String toString() {
  return 'ActionResult(method: $method, data: $data, id: $id)';
}


}

/// @nodoc
abstract mixin class _$ActionResultCopyWith<$Res> implements $ActionResultCopyWith<$Res> {
  factory _$ActionResultCopyWith(_ActionResult value, $Res Function(_ActionResult) _then) = __$ActionResultCopyWithImpl;
@override @useResult
$Res call({
 ActionMethod method, dynamic data, String? id
});




}
/// @nodoc
class __$ActionResultCopyWithImpl<$Res>
    implements _$ActionResultCopyWith<$Res> {
  __$ActionResultCopyWithImpl(this._self, this._then);

  final _ActionResult _self;
  final $Res Function(_ActionResult) _then;

/// Create a copy of ActionResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? data = freezed,Object? id = freezed,}) {
  return _then(_ActionResult(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as ActionMethod,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
