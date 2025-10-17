// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../common.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NavigationItem {

 Icon get icon; PageLabel get label; String? get description; Widget get fragment; bool get keep; String? get path; List<NavigationItemMode> get modes;
/// Create a copy of NavigationItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationItemCopyWith<NavigationItem> get copyWith => _$NavigationItemCopyWithImpl<NavigationItem>(this as NavigationItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationItem&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.fragment, fragment) || other.fragment == fragment)&&(identical(other.keep, keep) || other.keep == keep)&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other.modes, modes));
}


@override
int get hashCode => Object.hash(runtimeType,icon,label,description,fragment,keep,path,const DeepCollectionEquality().hash(modes));

@override
String toString() {
  return 'NavigationItem(icon: $icon, label: $label, description: $description, fragment: $fragment, keep: $keep, path: $path, modes: $modes)';
}


}

/// @nodoc
abstract mixin class $NavigationItemCopyWith<$Res>  {
  factory $NavigationItemCopyWith(NavigationItem value, $Res Function(NavigationItem) _then) = _$NavigationItemCopyWithImpl;
@useResult
$Res call({
 Icon icon, PageLabel label, String? description, Widget fragment, bool keep, String? path, List<NavigationItemMode> modes
});




}
/// @nodoc
class _$NavigationItemCopyWithImpl<$Res>
    implements $NavigationItemCopyWith<$Res> {
  _$NavigationItemCopyWithImpl(this._self, this._then);

  final NavigationItem _self;
  final $Res Function(NavigationItem) _then;

/// Create a copy of NavigationItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icon = null,Object? label = null,Object? description = freezed,Object? fragment = null,Object? keep = null,Object? path = freezed,Object? modes = null,}) {
  return _then(_self.copyWith(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as PageLabel,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,fragment: null == fragment ? _self.fragment : fragment // ignore: cast_nullable_to_non_nullable
as Widget,keep: null == keep ? _self.keep : keep // ignore: cast_nullable_to_non_nullable
as bool,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,modes: null == modes ? _self.modes : modes // ignore: cast_nullable_to_non_nullable
as List<NavigationItemMode>,
  ));
}

}


/// Adds pattern-matching-related methods to [NavigationItem].
extension NavigationItemPatterns on NavigationItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationItem value)  $default,){
final _that = this;
switch (_that) {
case _NavigationItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationItem value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Icon icon,  PageLabel label,  String? description,  Widget fragment,  bool keep,  String? path,  List<NavigationItemMode> modes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigationItem() when $default != null:
return $default(_that.icon,_that.label,_that.description,_that.fragment,_that.keep,_that.path,_that.modes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Icon icon,  PageLabel label,  String? description,  Widget fragment,  bool keep,  String? path,  List<NavigationItemMode> modes)  $default,) {final _that = this;
switch (_that) {
case _NavigationItem():
return $default(_that.icon,_that.label,_that.description,_that.fragment,_that.keep,_that.path,_that.modes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Icon icon,  PageLabel label,  String? description,  Widget fragment,  bool keep,  String? path,  List<NavigationItemMode> modes)?  $default,) {final _that = this;
switch (_that) {
case _NavigationItem() when $default != null:
return $default(_that.icon,_that.label,_that.description,_that.fragment,_that.keep,_that.path,_that.modes);case _:
  return null;

}
}

}

/// @nodoc


class _NavigationItem implements NavigationItem {
  const _NavigationItem({required this.icon, required this.label, this.description, required this.fragment, this.keep = true, this.path, final  List<NavigationItemMode> modes = const [NavigationItemMode.mobile, NavigationItemMode.desktop]}): _modes = modes;
  

@override final  Icon icon;
@override final  PageLabel label;
@override final  String? description;
@override final  Widget fragment;
@override@JsonKey() final  bool keep;
@override final  String? path;
 final  List<NavigationItemMode> _modes;
@override@JsonKey() List<NavigationItemMode> get modes {
  if (_modes is EqualUnmodifiableListView) return _modes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modes);
}


/// Create a copy of NavigationItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationItemCopyWith<_NavigationItem> get copyWith => __$NavigationItemCopyWithImpl<_NavigationItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationItem&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.fragment, fragment) || other.fragment == fragment)&&(identical(other.keep, keep) || other.keep == keep)&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other._modes, _modes));
}


@override
int get hashCode => Object.hash(runtimeType,icon,label,description,fragment,keep,path,const DeepCollectionEquality().hash(_modes));

@override
String toString() {
  return 'NavigationItem(icon: $icon, label: $label, description: $description, fragment: $fragment, keep: $keep, path: $path, modes: $modes)';
}


}

/// @nodoc
abstract mixin class _$NavigationItemCopyWith<$Res> implements $NavigationItemCopyWith<$Res> {
  factory _$NavigationItemCopyWith(_NavigationItem value, $Res Function(_NavigationItem) _then) = __$NavigationItemCopyWithImpl;
@override @useResult
$Res call({
 Icon icon, PageLabel label, String? description, Widget fragment, bool keep, String? path, List<NavigationItemMode> modes
});




}
/// @nodoc
class __$NavigationItemCopyWithImpl<$Res>
    implements _$NavigationItemCopyWith<$Res> {
  __$NavigationItemCopyWithImpl(this._self, this._then);

  final _NavigationItem _self;
  final $Res Function(_NavigationItem) _then;

/// Create a copy of NavigationItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icon = null,Object? label = null,Object? description = freezed,Object? fragment = null,Object? keep = null,Object? path = freezed,Object? modes = null,}) {
  return _then(_NavigationItem(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Icon,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as PageLabel,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,fragment: null == fragment ? _self.fragment : fragment // ignore: cast_nullable_to_non_nullable
as Widget,keep: null == keep ? _self.keep : keep // ignore: cast_nullable_to_non_nullable
as bool,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,modes: null == modes ? _self._modes : modes // ignore: cast_nullable_to_non_nullable
as List<NavigationItemMode>,
  ));
}


}


/// @nodoc
mixin _$Package {

 String get packageName; String get label; bool get isSystem; int get lastUpdateTime;
/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageCopyWith<Package> get copyWith => _$PackageCopyWithImpl<Package>(this as Package, _$identity);

  /// Serializes this Package to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Package&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.label, label) || other.label == label)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.lastUpdateTime, lastUpdateTime) || other.lastUpdateTime == lastUpdateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,label,isSystem,lastUpdateTime);

@override
String toString() {
  return 'Package(packageName: $packageName, label: $label, isSystem: $isSystem, lastUpdateTime: $lastUpdateTime)';
}


}

/// @nodoc
abstract mixin class $PackageCopyWith<$Res>  {
  factory $PackageCopyWith(Package value, $Res Function(Package) _then) = _$PackageCopyWithImpl;
@useResult
$Res call({
 String packageName, String label, bool isSystem, int lastUpdateTime
});




}
/// @nodoc
class _$PackageCopyWithImpl<$Res>
    implements $PackageCopyWith<$Res> {
  _$PackageCopyWithImpl(this._self, this._then);

  final Package _self;
  final $Res Function(Package) _then;

/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? label = null,Object? isSystem = null,Object? lastUpdateTime = null,}) {
  return _then(_self.copyWith(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,lastUpdateTime: null == lastUpdateTime ? _self.lastUpdateTime : lastUpdateTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Package].
extension PackagePatterns on Package {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Package value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Package() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Package value)  $default,){
final _that = this;
switch (_that) {
case _Package():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Package value)?  $default,){
final _that = this;
switch (_that) {
case _Package() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String packageName,  String label,  bool isSystem,  int lastUpdateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Package() when $default != null:
return $default(_that.packageName,_that.label,_that.isSystem,_that.lastUpdateTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String packageName,  String label,  bool isSystem,  int lastUpdateTime)  $default,) {final _that = this;
switch (_that) {
case _Package():
return $default(_that.packageName,_that.label,_that.isSystem,_that.lastUpdateTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String packageName,  String label,  bool isSystem,  int lastUpdateTime)?  $default,) {final _that = this;
switch (_that) {
case _Package() when $default != null:
return $default(_that.packageName,_that.label,_that.isSystem,_that.lastUpdateTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Package implements Package {
  const _Package({required this.packageName, required this.label, required this.isSystem, required this.lastUpdateTime});
  factory _Package.fromJson(Map<String, dynamic> json) => _$PackageFromJson(json);

@override final  String packageName;
@override final  String label;
@override final  bool isSystem;
@override final  int lastUpdateTime;

/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageCopyWith<_Package> get copyWith => __$PackageCopyWithImpl<_Package>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Package&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.label, label) || other.label == label)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.lastUpdateTime, lastUpdateTime) || other.lastUpdateTime == lastUpdateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,packageName,label,isSystem,lastUpdateTime);

@override
String toString() {
  return 'Package(packageName: $packageName, label: $label, isSystem: $isSystem, lastUpdateTime: $lastUpdateTime)';
}


}

/// @nodoc
abstract mixin class _$PackageCopyWith<$Res> implements $PackageCopyWith<$Res> {
  factory _$PackageCopyWith(_Package value, $Res Function(_Package) _then) = __$PackageCopyWithImpl;
@override @useResult
$Res call({
 String packageName, String label, bool isSystem, int lastUpdateTime
});




}
/// @nodoc
class __$PackageCopyWithImpl<$Res>
    implements _$PackageCopyWith<$Res> {
  __$PackageCopyWithImpl(this._self, this._then);

  final _Package _self;
  final $Res Function(_Package) _then;

/// Create a copy of Package
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? label = null,Object? isSystem = null,Object? lastUpdateTime = null,}) {
  return _then(_Package(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,lastUpdateTime: null == lastUpdateTime ? _self.lastUpdateTime : lastUpdateTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Metadata {

 int get uid; String get network; String get sourceIP; String get sourcePort; String get destinationIP; String get destinationPort; String get host; String get process; String get remoteDestination;
/// Create a copy of Metadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataCopyWith<Metadata> get copyWith => _$MetadataCopyWithImpl<Metadata>(this as Metadata, _$identity);

  /// Serializes this Metadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Metadata&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.network, network) || other.network == network)&&(identical(other.sourceIP, sourceIP) || other.sourceIP == sourceIP)&&(identical(other.sourcePort, sourcePort) || other.sourcePort == sourcePort)&&(identical(other.destinationIP, destinationIP) || other.destinationIP == destinationIP)&&(identical(other.destinationPort, destinationPort) || other.destinationPort == destinationPort)&&(identical(other.host, host) || other.host == host)&&(identical(other.process, process) || other.process == process)&&(identical(other.remoteDestination, remoteDestination) || other.remoteDestination == remoteDestination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,network,sourceIP,sourcePort,destinationIP,destinationPort,host,process,remoteDestination);

@override
String toString() {
  return 'Metadata(uid: $uid, network: $network, sourceIP: $sourceIP, sourcePort: $sourcePort, destinationIP: $destinationIP, destinationPort: $destinationPort, host: $host, process: $process, remoteDestination: $remoteDestination)';
}


}

/// @nodoc
abstract mixin class $MetadataCopyWith<$Res>  {
  factory $MetadataCopyWith(Metadata value, $Res Function(Metadata) _then) = _$MetadataCopyWithImpl;
@useResult
$Res call({
 int uid, String network, String sourceIP, String sourcePort, String destinationIP, String destinationPort, String host, String process, String remoteDestination
});




}
/// @nodoc
class _$MetadataCopyWithImpl<$Res>
    implements $MetadataCopyWith<$Res> {
  _$MetadataCopyWithImpl(this._self, this._then);

  final Metadata _self;
  final $Res Function(Metadata) _then;

/// Create a copy of Metadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? network = null,Object? sourceIP = null,Object? sourcePort = null,Object? destinationIP = null,Object? destinationPort = null,Object? host = null,Object? process = null,Object? remoteDestination = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String,sourceIP: null == sourceIP ? _self.sourceIP : sourceIP // ignore: cast_nullable_to_non_nullable
as String,sourcePort: null == sourcePort ? _self.sourcePort : sourcePort // ignore: cast_nullable_to_non_nullable
as String,destinationIP: null == destinationIP ? _self.destinationIP : destinationIP // ignore: cast_nullable_to_non_nullable
as String,destinationPort: null == destinationPort ? _self.destinationPort : destinationPort // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,process: null == process ? _self.process : process // ignore: cast_nullable_to_non_nullable
as String,remoteDestination: null == remoteDestination ? _self.remoteDestination : remoteDestination // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Metadata].
extension MetadataPatterns on Metadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Metadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Metadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Metadata value)  $default,){
final _that = this;
switch (_that) {
case _Metadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Metadata value)?  $default,){
final _that = this;
switch (_that) {
case _Metadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int uid,  String network,  String sourceIP,  String sourcePort,  String destinationIP,  String destinationPort,  String host,  String process,  String remoteDestination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Metadata() when $default != null:
return $default(_that.uid,_that.network,_that.sourceIP,_that.sourcePort,_that.destinationIP,_that.destinationPort,_that.host,_that.process,_that.remoteDestination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int uid,  String network,  String sourceIP,  String sourcePort,  String destinationIP,  String destinationPort,  String host,  String process,  String remoteDestination)  $default,) {final _that = this;
switch (_that) {
case _Metadata():
return $default(_that.uid,_that.network,_that.sourceIP,_that.sourcePort,_that.destinationIP,_that.destinationPort,_that.host,_that.process,_that.remoteDestination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int uid,  String network,  String sourceIP,  String sourcePort,  String destinationIP,  String destinationPort,  String host,  String process,  String remoteDestination)?  $default,) {final _that = this;
switch (_that) {
case _Metadata() when $default != null:
return $default(_that.uid,_that.network,_that.sourceIP,_that.sourcePort,_that.destinationIP,_that.destinationPort,_that.host,_that.process,_that.remoteDestination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Metadata implements Metadata {
  const _Metadata({required this.uid, required this.network, required this.sourceIP, required this.sourcePort, required this.destinationIP, required this.destinationPort, required this.host, required this.process, required this.remoteDestination});
  factory _Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);

@override final  int uid;
@override final  String network;
@override final  String sourceIP;
@override final  String sourcePort;
@override final  String destinationIP;
@override final  String destinationPort;
@override final  String host;
@override final  String process;
@override final  String remoteDestination;

/// Create a copy of Metadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetadataCopyWith<_Metadata> get copyWith => __$MetadataCopyWithImpl<_Metadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Metadata&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.network, network) || other.network == network)&&(identical(other.sourceIP, sourceIP) || other.sourceIP == sourceIP)&&(identical(other.sourcePort, sourcePort) || other.sourcePort == sourcePort)&&(identical(other.destinationIP, destinationIP) || other.destinationIP == destinationIP)&&(identical(other.destinationPort, destinationPort) || other.destinationPort == destinationPort)&&(identical(other.host, host) || other.host == host)&&(identical(other.process, process) || other.process == process)&&(identical(other.remoteDestination, remoteDestination) || other.remoteDestination == remoteDestination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,network,sourceIP,sourcePort,destinationIP,destinationPort,host,process,remoteDestination);

@override
String toString() {
  return 'Metadata(uid: $uid, network: $network, sourceIP: $sourceIP, sourcePort: $sourcePort, destinationIP: $destinationIP, destinationPort: $destinationPort, host: $host, process: $process, remoteDestination: $remoteDestination)';
}


}

/// @nodoc
abstract mixin class _$MetadataCopyWith<$Res> implements $MetadataCopyWith<$Res> {
  factory _$MetadataCopyWith(_Metadata value, $Res Function(_Metadata) _then) = __$MetadataCopyWithImpl;
@override @useResult
$Res call({
 int uid, String network, String sourceIP, String sourcePort, String destinationIP, String destinationPort, String host, String process, String remoteDestination
});




}
/// @nodoc
class __$MetadataCopyWithImpl<$Res>
    implements _$MetadataCopyWith<$Res> {
  __$MetadataCopyWithImpl(this._self, this._then);

  final _Metadata _self;
  final $Res Function(_Metadata) _then;

/// Create a copy of Metadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? network = null,Object? sourceIP = null,Object? sourcePort = null,Object? destinationIP = null,Object? destinationPort = null,Object? host = null,Object? process = null,Object? remoteDestination = null,}) {
  return _then(_Metadata(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String,sourceIP: null == sourceIP ? _self.sourceIP : sourceIP // ignore: cast_nullable_to_non_nullable
as String,sourcePort: null == sourcePort ? _self.sourcePort : sourcePort // ignore: cast_nullable_to_non_nullable
as String,destinationIP: null == destinationIP ? _self.destinationIP : destinationIP // ignore: cast_nullable_to_non_nullable
as String,destinationPort: null == destinationPort ? _self.destinationPort : destinationPort // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,process: null == process ? _self.process : process // ignore: cast_nullable_to_non_nullable
as String,remoteDestination: null == remoteDestination ? _self.remoteDestination : remoteDestination // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Connection {

 String get id; num? get upload; num? get download; DateTime get start; Metadata get metadata; List<String> get chains;
/// Create a copy of Connection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionCopyWith<Connection> get copyWith => _$ConnectionCopyWithImpl<Connection>(this as Connection, _$identity);

  /// Serializes this Connection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Connection&&(identical(other.id, id) || other.id == id)&&(identical(other.upload, upload) || other.upload == upload)&&(identical(other.download, download) || other.download == download)&&(identical(other.start, start) || other.start == start)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.chains, chains));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,upload,download,start,metadata,const DeepCollectionEquality().hash(chains));

@override
String toString() {
  return 'Connection(id: $id, upload: $upload, download: $download, start: $start, metadata: $metadata, chains: $chains)';
}


}

/// @nodoc
abstract mixin class $ConnectionCopyWith<$Res>  {
  factory $ConnectionCopyWith(Connection value, $Res Function(Connection) _then) = _$ConnectionCopyWithImpl;
@useResult
$Res call({
 String id, num? upload, num? download, DateTime start, Metadata metadata, List<String> chains
});


$MetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$ConnectionCopyWithImpl<$Res>
    implements $ConnectionCopyWith<$Res> {
  _$ConnectionCopyWithImpl(this._self, this._then);

  final Connection _self;
  final $Res Function(Connection) _then;

/// Create a copy of Connection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? upload = freezed,Object? download = freezed,Object? start = null,Object? metadata = null,Object? chains = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,upload: freezed == upload ? _self.upload : upload // ignore: cast_nullable_to_non_nullable
as num?,download: freezed == download ? _self.download : download // ignore: cast_nullable_to_non_nullable
as num?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Metadata,chains: null == chains ? _self.chains : chains // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of Connection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataCopyWith<$Res> get metadata {
  
  return $MetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [Connection].
extension ConnectionPatterns on Connection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Connection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Connection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Connection value)  $default,){
final _that = this;
switch (_that) {
case _Connection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Connection value)?  $default,){
final _that = this;
switch (_that) {
case _Connection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  num? upload,  num? download,  DateTime start,  Metadata metadata,  List<String> chains)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Connection() when $default != null:
return $default(_that.id,_that.upload,_that.download,_that.start,_that.metadata,_that.chains);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  num? upload,  num? download,  DateTime start,  Metadata metadata,  List<String> chains)  $default,) {final _that = this;
switch (_that) {
case _Connection():
return $default(_that.id,_that.upload,_that.download,_that.start,_that.metadata,_that.chains);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  num? upload,  num? download,  DateTime start,  Metadata metadata,  List<String> chains)?  $default,) {final _that = this;
switch (_that) {
case _Connection() when $default != null:
return $default(_that.id,_that.upload,_that.download,_that.start,_that.metadata,_that.chains);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Connection implements Connection {
  const _Connection({required this.id, this.upload, this.download, required this.start, required this.metadata, required final  List<String> chains}): _chains = chains;
  factory _Connection.fromJson(Map<String, dynamic> json) => _$ConnectionFromJson(json);

@override final  String id;
@override final  num? upload;
@override final  num? download;
@override final  DateTime start;
@override final  Metadata metadata;
 final  List<String> _chains;
@override List<String> get chains {
  if (_chains is EqualUnmodifiableListView) return _chains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chains);
}


/// Create a copy of Connection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionCopyWith<_Connection> get copyWith => __$ConnectionCopyWithImpl<_Connection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connection&&(identical(other.id, id) || other.id == id)&&(identical(other.upload, upload) || other.upload == upload)&&(identical(other.download, download) || other.download == download)&&(identical(other.start, start) || other.start == start)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._chains, _chains));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,upload,download,start,metadata,const DeepCollectionEquality().hash(_chains));

@override
String toString() {
  return 'Connection(id: $id, upload: $upload, download: $download, start: $start, metadata: $metadata, chains: $chains)';
}


}

/// @nodoc
abstract mixin class _$ConnectionCopyWith<$Res> implements $ConnectionCopyWith<$Res> {
  factory _$ConnectionCopyWith(_Connection value, $Res Function(_Connection) _then) = __$ConnectionCopyWithImpl;
@override @useResult
$Res call({
 String id, num? upload, num? download, DateTime start, Metadata metadata, List<String> chains
});


@override $MetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$ConnectionCopyWithImpl<$Res>
    implements _$ConnectionCopyWith<$Res> {
  __$ConnectionCopyWithImpl(this._self, this._then);

  final _Connection _self;
  final $Res Function(_Connection) _then;

/// Create a copy of Connection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? upload = freezed,Object? download = freezed,Object? start = null,Object? metadata = null,Object? chains = null,}) {
  return _then(_Connection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,upload: freezed == upload ? _self.upload : upload // ignore: cast_nullable_to_non_nullable
as num?,download: freezed == download ? _self.download : download // ignore: cast_nullable_to_non_nullable
as num?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Metadata,chains: null == chains ? _self._chains : chains // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of Connection
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
mixin _$LogsState {

 List<Log> get logs; List<String> get keywords; String get query;
/// Create a copy of LogsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogsStateCopyWith<LogsState> get copyWith => _$LogsStateCopyWithImpl<LogsState>(this as LogsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogsState&&const DeepCollectionEquality().equals(other.logs, logs)&&const DeepCollectionEquality().equals(other.keywords, keywords)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(logs),const DeepCollectionEquality().hash(keywords),query);

@override
String toString() {
  return 'LogsState(logs: $logs, keywords: $keywords, query: $query)';
}


}

/// @nodoc
abstract mixin class $LogsStateCopyWith<$Res>  {
  factory $LogsStateCopyWith(LogsState value, $Res Function(LogsState) _then) = _$LogsStateCopyWithImpl;
@useResult
$Res call({
 List<Log> logs, List<String> keywords, String query
});




}
/// @nodoc
class _$LogsStateCopyWithImpl<$Res>
    implements $LogsStateCopyWith<$Res> {
  _$LogsStateCopyWithImpl(this._self, this._then);

  final LogsState _self;
  final $Res Function(LogsState) _then;

/// Create a copy of LogsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logs = null,Object? keywords = null,Object? query = null,}) {
  return _then(_self.copyWith(
logs: null == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as List<Log>,keywords: null == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LogsState].
extension LogsStatePatterns on LogsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogsState value)  $default,){
final _that = this;
switch (_that) {
case _LogsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogsState value)?  $default,){
final _that = this;
switch (_that) {
case _LogsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Log> logs,  List<String> keywords,  String query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogsState() when $default != null:
return $default(_that.logs,_that.keywords,_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Log> logs,  List<String> keywords,  String query)  $default,) {final _that = this;
switch (_that) {
case _LogsState():
return $default(_that.logs,_that.keywords,_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Log> logs,  List<String> keywords,  String query)?  $default,) {final _that = this;
switch (_that) {
case _LogsState() when $default != null:
return $default(_that.logs,_that.keywords,_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _LogsState implements LogsState {
  const _LogsState({final  List<Log> logs = const [], final  List<String> keywords = const [], this.query = ""}): _logs = logs,_keywords = keywords;
  

 final  List<Log> _logs;
@override@JsonKey() List<Log> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}

 final  List<String> _keywords;
@override@JsonKey() List<String> get keywords {
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keywords);
}

@override@JsonKey() final  String query;

/// Create a copy of LogsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogsStateCopyWith<_LogsState> get copyWith => __$LogsStateCopyWithImpl<_LogsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogsState&&const DeepCollectionEquality().equals(other._logs, _logs)&&const DeepCollectionEquality().equals(other._keywords, _keywords)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_logs),const DeepCollectionEquality().hash(_keywords),query);

@override
String toString() {
  return 'LogsState(logs: $logs, keywords: $keywords, query: $query)';
}


}

/// @nodoc
abstract mixin class _$LogsStateCopyWith<$Res> implements $LogsStateCopyWith<$Res> {
  factory _$LogsStateCopyWith(_LogsState value, $Res Function(_LogsState) _then) = __$LogsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Log> logs, List<String> keywords, String query
});




}
/// @nodoc
class __$LogsStateCopyWithImpl<$Res>
    implements _$LogsStateCopyWith<$Res> {
  __$LogsStateCopyWithImpl(this._self, this._then);

  final _LogsState _self;
  final $Res Function(_LogsState) _then;

/// Create a copy of LogsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logs = null,Object? keywords = null,Object? query = null,}) {
  return _then(_LogsState(
logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<Log>,keywords: null == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ConnectionsState {

 List<Connection> get connections; List<String> get keywords; String get query;
/// Create a copy of ConnectionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionsStateCopyWith<ConnectionsState> get copyWith => _$ConnectionsStateCopyWithImpl<ConnectionsState>(this as ConnectionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionsState&&const DeepCollectionEquality().equals(other.connections, connections)&&const DeepCollectionEquality().equals(other.keywords, keywords)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(connections),const DeepCollectionEquality().hash(keywords),query);

@override
String toString() {
  return 'ConnectionsState(connections: $connections, keywords: $keywords, query: $query)';
}


}

/// @nodoc
abstract mixin class $ConnectionsStateCopyWith<$Res>  {
  factory $ConnectionsStateCopyWith(ConnectionsState value, $Res Function(ConnectionsState) _then) = _$ConnectionsStateCopyWithImpl;
@useResult
$Res call({
 List<Connection> connections, List<String> keywords, String query
});




}
/// @nodoc
class _$ConnectionsStateCopyWithImpl<$Res>
    implements $ConnectionsStateCopyWith<$Res> {
  _$ConnectionsStateCopyWithImpl(this._self, this._then);

  final ConnectionsState _self;
  final $Res Function(ConnectionsState) _then;

/// Create a copy of ConnectionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connections = null,Object? keywords = null,Object? query = null,}) {
  return _then(_self.copyWith(
connections: null == connections ? _self.connections : connections // ignore: cast_nullable_to_non_nullable
as List<Connection>,keywords: null == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConnectionsState].
extension ConnectionsStatePatterns on ConnectionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionsState value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionsState value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Connection> connections,  List<String> keywords,  String query)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionsState() when $default != null:
return $default(_that.connections,_that.keywords,_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Connection> connections,  List<String> keywords,  String query)  $default,) {final _that = this;
switch (_that) {
case _ConnectionsState():
return $default(_that.connections,_that.keywords,_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Connection> connections,  List<String> keywords,  String query)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionsState() when $default != null:
return $default(_that.connections,_that.keywords,_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _ConnectionsState implements ConnectionsState {
  const _ConnectionsState({final  List<Connection> connections = const [], final  List<String> keywords = const [], this.query = ""}): _connections = connections,_keywords = keywords;
  

 final  List<Connection> _connections;
@override@JsonKey() List<Connection> get connections {
  if (_connections is EqualUnmodifiableListView) return _connections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connections);
}

 final  List<String> _keywords;
@override@JsonKey() List<String> get keywords {
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keywords);
}

@override@JsonKey() final  String query;

/// Create a copy of ConnectionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionsStateCopyWith<_ConnectionsState> get copyWith => __$ConnectionsStateCopyWithImpl<_ConnectionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionsState&&const DeepCollectionEquality().equals(other._connections, _connections)&&const DeepCollectionEquality().equals(other._keywords, _keywords)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_connections),const DeepCollectionEquality().hash(_keywords),query);

@override
String toString() {
  return 'ConnectionsState(connections: $connections, keywords: $keywords, query: $query)';
}


}

/// @nodoc
abstract mixin class _$ConnectionsStateCopyWith<$Res> implements $ConnectionsStateCopyWith<$Res> {
  factory _$ConnectionsStateCopyWith(_ConnectionsState value, $Res Function(_ConnectionsState) _then) = __$ConnectionsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Connection> connections, List<String> keywords, String query
});




}
/// @nodoc
class __$ConnectionsStateCopyWithImpl<$Res>
    implements _$ConnectionsStateCopyWith<$Res> {
  __$ConnectionsStateCopyWithImpl(this._self, this._then);

  final _ConnectionsState _self;
  final $Res Function(_ConnectionsState) _then;

/// Create a copy of ConnectionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connections = null,Object? keywords = null,Object? query = null,}) {
  return _then(_ConnectionsState(
connections: null == connections ? _self._connections : connections // ignore: cast_nullable_to_non_nullable
as List<Connection>,keywords: null == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DAV {

 String get uri; String get user; String get password; String get fileName;
/// Create a copy of DAV
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DAVCopyWith<DAV> get copyWith => _$DAVCopyWithImpl<DAV>(this as DAV, _$identity);

  /// Serializes this DAV to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DAV&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.user, user) || other.user == user)&&(identical(other.password, password) || other.password == password)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uri,user,password,fileName);

@override
String toString() {
  return 'DAV(uri: $uri, user: $user, password: $password, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class $DAVCopyWith<$Res>  {
  factory $DAVCopyWith(DAV value, $Res Function(DAV) _then) = _$DAVCopyWithImpl;
@useResult
$Res call({
 String uri, String user, String password, String fileName
});




}
/// @nodoc
class _$DAVCopyWithImpl<$Res>
    implements $DAVCopyWith<$Res> {
  _$DAVCopyWithImpl(this._self, this._then);

  final DAV _self;
  final $Res Function(DAV) _then;

/// Create a copy of DAV
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uri = null,Object? user = null,Object? password = null,Object? fileName = null,}) {
  return _then(_self.copyWith(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DAV].
extension DAVPatterns on DAV {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DAV value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DAV() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DAV value)  $default,){
final _that = this;
switch (_that) {
case _DAV():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DAV value)?  $default,){
final _that = this;
switch (_that) {
case _DAV() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uri,  String user,  String password,  String fileName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DAV() when $default != null:
return $default(_that.uri,_that.user,_that.password,_that.fileName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uri,  String user,  String password,  String fileName)  $default,) {final _that = this;
switch (_that) {
case _DAV():
return $default(_that.uri,_that.user,_that.password,_that.fileName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uri,  String user,  String password,  String fileName)?  $default,) {final _that = this;
switch (_that) {
case _DAV() when $default != null:
return $default(_that.uri,_that.user,_that.password,_that.fileName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DAV implements DAV {
  const _DAV({required this.uri, required this.user, required this.password, this.fileName = defaultDavFileName});
  factory _DAV.fromJson(Map<String, dynamic> json) => _$DAVFromJson(json);

@override final  String uri;
@override final  String user;
@override final  String password;
@override@JsonKey() final  String fileName;

/// Create a copy of DAV
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DAVCopyWith<_DAV> get copyWith => __$DAVCopyWithImpl<_DAV>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DAVToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DAV&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.user, user) || other.user == user)&&(identical(other.password, password) || other.password == password)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uri,user,password,fileName);

@override
String toString() {
  return 'DAV(uri: $uri, user: $user, password: $password, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class _$DAVCopyWith<$Res> implements $DAVCopyWith<$Res> {
  factory _$DAVCopyWith(_DAV value, $Res Function(_DAV) _then) = __$DAVCopyWithImpl;
@override @useResult
$Res call({
 String uri, String user, String password, String fileName
});




}
/// @nodoc
class __$DAVCopyWithImpl<$Res>
    implements _$DAVCopyWith<$Res> {
  __$DAVCopyWithImpl(this._self, this._then);

  final _DAV _self;
  final $Res Function(_DAV) _then;

/// Create a copy of DAV
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uri = null,Object? user = null,Object? password = null,Object? fileName = null,}) {
  return _then(_DAV(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$FileInfo {

 int get size; DateTime get lastModified;
/// Create a copy of FileInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileInfoCopyWith<FileInfo> get copyWith => _$FileInfoCopyWithImpl<FileInfo>(this as FileInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileInfo&&(identical(other.size, size) || other.size == size)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified));
}


@override
int get hashCode => Object.hash(runtimeType,size,lastModified);

@override
String toString() {
  return 'FileInfo(size: $size, lastModified: $lastModified)';
}


}

/// @nodoc
abstract mixin class $FileInfoCopyWith<$Res>  {
  factory $FileInfoCopyWith(FileInfo value, $Res Function(FileInfo) _then) = _$FileInfoCopyWithImpl;
@useResult
$Res call({
 int size, DateTime lastModified
});




}
/// @nodoc
class _$FileInfoCopyWithImpl<$Res>
    implements $FileInfoCopyWith<$Res> {
  _$FileInfoCopyWithImpl(this._self, this._then);

  final FileInfo _self;
  final $Res Function(FileInfo) _then;

/// Create a copy of FileInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? size = null,Object? lastModified = null,}) {
  return _then(_self.copyWith(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FileInfo].
extension FileInfoPatterns on FileInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileInfo value)  $default,){
final _that = this;
switch (_that) {
case _FileInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileInfo value)?  $default,){
final _that = this;
switch (_that) {
case _FileInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int size,  DateTime lastModified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileInfo() when $default != null:
return $default(_that.size,_that.lastModified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int size,  DateTime lastModified)  $default,) {final _that = this;
switch (_that) {
case _FileInfo():
return $default(_that.size,_that.lastModified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int size,  DateTime lastModified)?  $default,) {final _that = this;
switch (_that) {
case _FileInfo() when $default != null:
return $default(_that.size,_that.lastModified);case _:
  return null;

}
}

}

/// @nodoc


class _FileInfo implements FileInfo {
  const _FileInfo({required this.size, required this.lastModified});
  

@override final  int size;
@override final  DateTime lastModified;

/// Create a copy of FileInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileInfoCopyWith<_FileInfo> get copyWith => __$FileInfoCopyWithImpl<_FileInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileInfo&&(identical(other.size, size) || other.size == size)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified));
}


@override
int get hashCode => Object.hash(runtimeType,size,lastModified);

@override
String toString() {
  return 'FileInfo(size: $size, lastModified: $lastModified)';
}


}

/// @nodoc
abstract mixin class _$FileInfoCopyWith<$Res> implements $FileInfoCopyWith<$Res> {
  factory _$FileInfoCopyWith(_FileInfo value, $Res Function(_FileInfo) _then) = __$FileInfoCopyWithImpl;
@override @useResult
$Res call({
 int size, DateTime lastModified
});




}
/// @nodoc
class __$FileInfoCopyWithImpl<$Res>
    implements _$FileInfoCopyWith<$Res> {
  __$FileInfoCopyWithImpl(this._self, this._then);

  final _FileInfo _self;
  final $Res Function(_FileInfo) _then;

/// Create a copy of FileInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? size = null,Object? lastModified = null,}) {
  return _then(_FileInfo(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$VersionInfo {

 String get clashName; String get version;
/// Create a copy of VersionInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionInfoCopyWith<VersionInfo> get copyWith => _$VersionInfoCopyWithImpl<VersionInfo>(this as VersionInfo, _$identity);

  /// Serializes this VersionInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionInfo&&(identical(other.clashName, clashName) || other.clashName == clashName)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clashName,version);

@override
String toString() {
  return 'VersionInfo(clashName: $clashName, version: $version)';
}


}

/// @nodoc
abstract mixin class $VersionInfoCopyWith<$Res>  {
  factory $VersionInfoCopyWith(VersionInfo value, $Res Function(VersionInfo) _then) = _$VersionInfoCopyWithImpl;
@useResult
$Res call({
 String clashName, String version
});




}
/// @nodoc
class _$VersionInfoCopyWithImpl<$Res>
    implements $VersionInfoCopyWith<$Res> {
  _$VersionInfoCopyWithImpl(this._self, this._then);

  final VersionInfo _self;
  final $Res Function(VersionInfo) _then;

/// Create a copy of VersionInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clashName = null,Object? version = null,}) {
  return _then(_self.copyWith(
clashName: null == clashName ? _self.clashName : clashName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VersionInfo].
extension VersionInfoPatterns on VersionInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VersionInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VersionInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VersionInfo value)  $default,){
final _that = this;
switch (_that) {
case _VersionInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VersionInfo value)?  $default,){
final _that = this;
switch (_that) {
case _VersionInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clashName,  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VersionInfo() when $default != null:
return $default(_that.clashName,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clashName,  String version)  $default,) {final _that = this;
switch (_that) {
case _VersionInfo():
return $default(_that.clashName,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clashName,  String version)?  $default,) {final _that = this;
switch (_that) {
case _VersionInfo() when $default != null:
return $default(_that.clashName,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VersionInfo implements VersionInfo {
  const _VersionInfo({this.clashName = "", this.version = ""});
  factory _VersionInfo.fromJson(Map<String, dynamic> json) => _$VersionInfoFromJson(json);

@override@JsonKey() final  String clashName;
@override@JsonKey() final  String version;

/// Create a copy of VersionInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VersionInfoCopyWith<_VersionInfo> get copyWith => __$VersionInfoCopyWithImpl<_VersionInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VersionInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VersionInfo&&(identical(other.clashName, clashName) || other.clashName == clashName)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clashName,version);

@override
String toString() {
  return 'VersionInfo(clashName: $clashName, version: $version)';
}


}

/// @nodoc
abstract mixin class _$VersionInfoCopyWith<$Res> implements $VersionInfoCopyWith<$Res> {
  factory _$VersionInfoCopyWith(_VersionInfo value, $Res Function(_VersionInfo) _then) = __$VersionInfoCopyWithImpl;
@override @useResult
$Res call({
 String clashName, String version
});




}
/// @nodoc
class __$VersionInfoCopyWithImpl<$Res>
    implements _$VersionInfoCopyWith<$Res> {
  __$VersionInfoCopyWithImpl(this._self, this._then);

  final _VersionInfo _self;
  final $Res Function(_VersionInfo) _then;

/// Create a copy of VersionInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clashName = null,Object? version = null,}) {
  return _then(_VersionInfo(
clashName: null == clashName ? _self.clashName : clashName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Proxy {

 String get name; String get type; String? get now;
/// Create a copy of Proxy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProxyCopyWith<Proxy> get copyWith => _$ProxyCopyWithImpl<Proxy>(this as Proxy, _$identity);

  /// Serializes this Proxy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Proxy&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.now, now) || other.now == now));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,now);

@override
String toString() {
  return 'Proxy(name: $name, type: $type, now: $now)';
}


}

/// @nodoc
abstract mixin class $ProxyCopyWith<$Res>  {
  factory $ProxyCopyWith(Proxy value, $Res Function(Proxy) _then) = _$ProxyCopyWithImpl;
@useResult
$Res call({
 String name, String type, String? now
});




}
/// @nodoc
class _$ProxyCopyWithImpl<$Res>
    implements $ProxyCopyWith<$Res> {
  _$ProxyCopyWithImpl(this._self, this._then);

  final Proxy _self;
  final $Res Function(Proxy) _then;

/// Create a copy of Proxy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? now = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,now: freezed == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Proxy].
extension ProxyPatterns on Proxy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Proxy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Proxy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Proxy value)  $default,){
final _that = this;
switch (_that) {
case _Proxy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Proxy value)?  $default,){
final _that = this;
switch (_that) {
case _Proxy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String type,  String? now)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Proxy() when $default != null:
return $default(_that.name,_that.type,_that.now);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String type,  String? now)  $default,) {final _that = this;
switch (_that) {
case _Proxy():
return $default(_that.name,_that.type,_that.now);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String type,  String? now)?  $default,) {final _that = this;
switch (_that) {
case _Proxy() when $default != null:
return $default(_that.name,_that.type,_that.now);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Proxy implements Proxy {
  const _Proxy({required this.name, required this.type, this.now});
  factory _Proxy.fromJson(Map<String, dynamic> json) => _$ProxyFromJson(json);

@override final  String name;
@override final  String type;
@override final  String? now;

/// Create a copy of Proxy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProxyCopyWith<_Proxy> get copyWith => __$ProxyCopyWithImpl<_Proxy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProxyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Proxy&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.now, now) || other.now == now));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,now);

@override
String toString() {
  return 'Proxy(name: $name, type: $type, now: $now)';
}


}

/// @nodoc
abstract mixin class _$ProxyCopyWith<$Res> implements $ProxyCopyWith<$Res> {
  factory _$ProxyCopyWith(_Proxy value, $Res Function(_Proxy) _then) = __$ProxyCopyWithImpl;
@override @useResult
$Res call({
 String name, String type, String? now
});




}
/// @nodoc
class __$ProxyCopyWithImpl<$Res>
    implements _$ProxyCopyWith<$Res> {
  __$ProxyCopyWithImpl(this._self, this._then);

  final _Proxy _self;
  final $Res Function(_Proxy) _then;

/// Create a copy of Proxy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? now = freezed,}) {
  return _then(_Proxy(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,now: freezed == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Group {

 GroupType get type; List<Proxy> get all; String? get now; bool? get hidden; String? get testUrl; String get icon; String get name;
/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupCopyWith<Group> get copyWith => _$GroupCopyWithImpl<Group>(this as Group, _$identity);

  /// Serializes this Group to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Group&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.all, all)&&(identical(other.now, now) || other.now == now)&&(identical(other.hidden, hidden) || other.hidden == hidden)&&(identical(other.testUrl, testUrl) || other.testUrl == testUrl)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(all),now,hidden,testUrl,icon,name);

@override
String toString() {
  return 'Group(type: $type, all: $all, now: $now, hidden: $hidden, testUrl: $testUrl, icon: $icon, name: $name)';
}


}

/// @nodoc
abstract mixin class $GroupCopyWith<$Res>  {
  factory $GroupCopyWith(Group value, $Res Function(Group) _then) = _$GroupCopyWithImpl;
@useResult
$Res call({
 GroupType type, List<Proxy> all, String? now, bool? hidden, String? testUrl, String icon, String name
});




}
/// @nodoc
class _$GroupCopyWithImpl<$Res>
    implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._self, this._then);

  final Group _self;
  final $Res Function(Group) _then;

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? all = null,Object? now = freezed,Object? hidden = freezed,Object? testUrl = freezed,Object? icon = null,Object? name = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GroupType,all: null == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as List<Proxy>,now: freezed == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as String?,hidden: freezed == hidden ? _self.hidden : hidden // ignore: cast_nullable_to_non_nullable
as bool?,testUrl: freezed == testUrl ? _self.testUrl : testUrl // ignore: cast_nullable_to_non_nullable
as String?,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Group].
extension GroupPatterns on Group {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Group value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Group() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Group value)  $default,){
final _that = this;
switch (_that) {
case _Group():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Group value)?  $default,){
final _that = this;
switch (_that) {
case _Group() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GroupType type,  List<Proxy> all,  String? now,  bool? hidden,  String? testUrl,  String icon,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Group() when $default != null:
return $default(_that.type,_that.all,_that.now,_that.hidden,_that.testUrl,_that.icon,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GroupType type,  List<Proxy> all,  String? now,  bool? hidden,  String? testUrl,  String icon,  String name)  $default,) {final _that = this;
switch (_that) {
case _Group():
return $default(_that.type,_that.all,_that.now,_that.hidden,_that.testUrl,_that.icon,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GroupType type,  List<Proxy> all,  String? now,  bool? hidden,  String? testUrl,  String icon,  String name)?  $default,) {final _that = this;
switch (_that) {
case _Group() when $default != null:
return $default(_that.type,_that.all,_that.now,_that.hidden,_that.testUrl,_that.icon,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Group implements Group {
  const _Group({required this.type, final  List<Proxy> all = const [], this.now, this.hidden, this.testUrl, this.icon = "", required this.name}): _all = all;
  factory _Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

@override final  GroupType type;
 final  List<Proxy> _all;
@override@JsonKey() List<Proxy> get all {
  if (_all is EqualUnmodifiableListView) return _all;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_all);
}

@override final  String? now;
@override final  bool? hidden;
@override final  String? testUrl;
@override@JsonKey() final  String icon;
@override final  String name;

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupCopyWith<_Group> get copyWith => __$GroupCopyWithImpl<_Group>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Group&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._all, _all)&&(identical(other.now, now) || other.now == now)&&(identical(other.hidden, hidden) || other.hidden == hidden)&&(identical(other.testUrl, testUrl) || other.testUrl == testUrl)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(_all),now,hidden,testUrl,icon,name);

@override
String toString() {
  return 'Group(type: $type, all: $all, now: $now, hidden: $hidden, testUrl: $testUrl, icon: $icon, name: $name)';
}


}

/// @nodoc
abstract mixin class _$GroupCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$GroupCopyWith(_Group value, $Res Function(_Group) _then) = __$GroupCopyWithImpl;
@override @useResult
$Res call({
 GroupType type, List<Proxy> all, String? now, bool? hidden, String? testUrl, String icon, String name
});




}
/// @nodoc
class __$GroupCopyWithImpl<$Res>
    implements _$GroupCopyWith<$Res> {
  __$GroupCopyWithImpl(this._self, this._then);

  final _Group _self;
  final $Res Function(_Group) _then;

/// Create a copy of Group
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? all = null,Object? now = freezed,Object? hidden = freezed,Object? testUrl = freezed,Object? icon = null,Object? name = null,}) {
  return _then(_Group(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GroupType,all: null == all ? _self._all : all // ignore: cast_nullable_to_non_nullable
as List<Proxy>,now: freezed == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as String?,hidden: freezed == hidden ? _self.hidden : hidden // ignore: cast_nullable_to_non_nullable
as bool?,testUrl: freezed == testUrl ? _self.testUrl : testUrl // ignore: cast_nullable_to_non_nullable
as String?,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ColorSchemes {

 ColorScheme? get lightColorScheme; ColorScheme? get darkColorScheme;
/// Create a copy of ColorSchemes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorSchemesCopyWith<ColorSchemes> get copyWith => _$ColorSchemesCopyWithImpl<ColorSchemes>(this as ColorSchemes, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorSchemes&&(identical(other.lightColorScheme, lightColorScheme) || other.lightColorScheme == lightColorScheme)&&(identical(other.darkColorScheme, darkColorScheme) || other.darkColorScheme == darkColorScheme));
}


@override
int get hashCode => Object.hash(runtimeType,lightColorScheme,darkColorScheme);

@override
String toString() {
  return 'ColorSchemes(lightColorScheme: $lightColorScheme, darkColorScheme: $darkColorScheme)';
}


}

/// @nodoc
abstract mixin class $ColorSchemesCopyWith<$Res>  {
  factory $ColorSchemesCopyWith(ColorSchemes value, $Res Function(ColorSchemes) _then) = _$ColorSchemesCopyWithImpl;
@useResult
$Res call({
 ColorScheme? lightColorScheme, ColorScheme? darkColorScheme
});




}
/// @nodoc
class _$ColorSchemesCopyWithImpl<$Res>
    implements $ColorSchemesCopyWith<$Res> {
  _$ColorSchemesCopyWithImpl(this._self, this._then);

  final ColorSchemes _self;
  final $Res Function(ColorSchemes) _then;

/// Create a copy of ColorSchemes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lightColorScheme = freezed,Object? darkColorScheme = freezed,}) {
  return _then(_self.copyWith(
lightColorScheme: freezed == lightColorScheme ? _self.lightColorScheme : lightColorScheme // ignore: cast_nullable_to_non_nullable
as ColorScheme?,darkColorScheme: freezed == darkColorScheme ? _self.darkColorScheme : darkColorScheme // ignore: cast_nullable_to_non_nullable
as ColorScheme?,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorSchemes].
extension ColorSchemesPatterns on ColorSchemes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColorSchemes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColorSchemes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColorSchemes value)  $default,){
final _that = this;
switch (_that) {
case _ColorSchemes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColorSchemes value)?  $default,){
final _that = this;
switch (_that) {
case _ColorSchemes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ColorScheme? lightColorScheme,  ColorScheme? darkColorScheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorSchemes() when $default != null:
return $default(_that.lightColorScheme,_that.darkColorScheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ColorScheme? lightColorScheme,  ColorScheme? darkColorScheme)  $default,) {final _that = this;
switch (_that) {
case _ColorSchemes():
return $default(_that.lightColorScheme,_that.darkColorScheme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ColorScheme? lightColorScheme,  ColorScheme? darkColorScheme)?  $default,) {final _that = this;
switch (_that) {
case _ColorSchemes() when $default != null:
return $default(_that.lightColorScheme,_that.darkColorScheme);case _:
  return null;

}
}

}

/// @nodoc


class _ColorSchemes implements ColorSchemes {
  const _ColorSchemes({this.lightColorScheme, this.darkColorScheme});
  

@override final  ColorScheme? lightColorScheme;
@override final  ColorScheme? darkColorScheme;

/// Create a copy of ColorSchemes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorSchemesCopyWith<_ColorSchemes> get copyWith => __$ColorSchemesCopyWithImpl<_ColorSchemes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorSchemes&&(identical(other.lightColorScheme, lightColorScheme) || other.lightColorScheme == lightColorScheme)&&(identical(other.darkColorScheme, darkColorScheme) || other.darkColorScheme == darkColorScheme));
}


@override
int get hashCode => Object.hash(runtimeType,lightColorScheme,darkColorScheme);

@override
String toString() {
  return 'ColorSchemes(lightColorScheme: $lightColorScheme, darkColorScheme: $darkColorScheme)';
}


}

/// @nodoc
abstract mixin class _$ColorSchemesCopyWith<$Res> implements $ColorSchemesCopyWith<$Res> {
  factory _$ColorSchemesCopyWith(_ColorSchemes value, $Res Function(_ColorSchemes) _then) = __$ColorSchemesCopyWithImpl;
@override @useResult
$Res call({
 ColorScheme? lightColorScheme, ColorScheme? darkColorScheme
});




}
/// @nodoc
class __$ColorSchemesCopyWithImpl<$Res>
    implements _$ColorSchemesCopyWith<$Res> {
  __$ColorSchemesCopyWithImpl(this._self, this._then);

  final _ColorSchemes _self;
  final $Res Function(_ColorSchemes) _then;

/// Create a copy of ColorSchemes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lightColorScheme = freezed,Object? darkColorScheme = freezed,}) {
  return _then(_ColorSchemes(
lightColorScheme: freezed == lightColorScheme ? _self.lightColorScheme : lightColorScheme // ignore: cast_nullable_to_non_nullable
as ColorScheme?,darkColorScheme: freezed == darkColorScheme ? _self.darkColorScheme : darkColorScheme // ignore: cast_nullable_to_non_nullable
as ColorScheme?,
  ));
}


}


/// @nodoc
mixin _$HotKeyAction {

 HotAction get action; int? get key; Set<KeyboardModifier> get modifiers;
/// Create a copy of HotKeyAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotKeyActionCopyWith<HotKeyAction> get copyWith => _$HotKeyActionCopyWithImpl<HotKeyAction>(this as HotKeyAction, _$identity);

  /// Serializes this HotKeyAction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotKeyAction&&(identical(other.action, action) || other.action == action)&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.modifiers, modifiers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,key,const DeepCollectionEquality().hash(modifiers));

@override
String toString() {
  return 'HotKeyAction(action: $action, key: $key, modifiers: $modifiers)';
}


}

/// @nodoc
abstract mixin class $HotKeyActionCopyWith<$Res>  {
  factory $HotKeyActionCopyWith(HotKeyAction value, $Res Function(HotKeyAction) _then) = _$HotKeyActionCopyWithImpl;
@useResult
$Res call({
 HotAction action, int? key, Set<KeyboardModifier> modifiers
});




}
/// @nodoc
class _$HotKeyActionCopyWithImpl<$Res>
    implements $HotKeyActionCopyWith<$Res> {
  _$HotKeyActionCopyWithImpl(this._self, this._then);

  final HotKeyAction _self;
  final $Res Function(HotKeyAction) _then;

/// Create a copy of HotKeyAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? action = null,Object? key = freezed,Object? modifiers = null,}) {
  return _then(_self.copyWith(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as HotAction,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as int?,modifiers: null == modifiers ? _self.modifiers : modifiers // ignore: cast_nullable_to_non_nullable
as Set<KeyboardModifier>,
  ));
}

}


/// Adds pattern-matching-related methods to [HotKeyAction].
extension HotKeyActionPatterns on HotKeyAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotKeyAction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotKeyAction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotKeyAction value)  $default,){
final _that = this;
switch (_that) {
case _HotKeyAction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotKeyAction value)?  $default,){
final _that = this;
switch (_that) {
case _HotKeyAction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HotAction action,  int? key,  Set<KeyboardModifier> modifiers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotKeyAction() when $default != null:
return $default(_that.action,_that.key,_that.modifiers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HotAction action,  int? key,  Set<KeyboardModifier> modifiers)  $default,) {final _that = this;
switch (_that) {
case _HotKeyAction():
return $default(_that.action,_that.key,_that.modifiers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HotAction action,  int? key,  Set<KeyboardModifier> modifiers)?  $default,) {final _that = this;
switch (_that) {
case _HotKeyAction() when $default != null:
return $default(_that.action,_that.key,_that.modifiers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotKeyAction implements HotKeyAction {
  const _HotKeyAction({required this.action, this.key, final  Set<KeyboardModifier> modifiers = const {}}): _modifiers = modifiers;
  factory _HotKeyAction.fromJson(Map<String, dynamic> json) => _$HotKeyActionFromJson(json);

@override final  HotAction action;
@override final  int? key;
 final  Set<KeyboardModifier> _modifiers;
@override@JsonKey() Set<KeyboardModifier> get modifiers {
  if (_modifiers is EqualUnmodifiableSetView) return _modifiers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_modifiers);
}


/// Create a copy of HotKeyAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotKeyActionCopyWith<_HotKeyAction> get copyWith => __$HotKeyActionCopyWithImpl<_HotKeyAction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotKeyActionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotKeyAction&&(identical(other.action, action) || other.action == action)&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other._modifiers, _modifiers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,key,const DeepCollectionEquality().hash(_modifiers));

@override
String toString() {
  return 'HotKeyAction(action: $action, key: $key, modifiers: $modifiers)';
}


}

/// @nodoc
abstract mixin class _$HotKeyActionCopyWith<$Res> implements $HotKeyActionCopyWith<$Res> {
  factory _$HotKeyActionCopyWith(_HotKeyAction value, $Res Function(_HotKeyAction) _then) = __$HotKeyActionCopyWithImpl;
@override @useResult
$Res call({
 HotAction action, int? key, Set<KeyboardModifier> modifiers
});




}
/// @nodoc
class __$HotKeyActionCopyWithImpl<$Res>
    implements _$HotKeyActionCopyWith<$Res> {
  __$HotKeyActionCopyWithImpl(this._self, this._then);

  final _HotKeyAction _self;
  final $Res Function(_HotKeyAction) _then;

/// Create a copy of HotKeyAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? action = null,Object? key = freezed,Object? modifiers = null,}) {
  return _then(_HotKeyAction(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as HotAction,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as int?,modifiers: null == modifiers ? _self._modifiers : modifiers // ignore: cast_nullable_to_non_nullable
as Set<KeyboardModifier>,
  ));
}


}

/// @nodoc
mixin _$Field {

 String get label; String get value; Validator? get validator;
/// Create a copy of Field
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FieldCopyWith<Field> get copyWith => _$FieldCopyWithImpl<Field>(this as Field, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Field&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.validator, validator) || other.validator == validator));
}


@override
int get hashCode => Object.hash(runtimeType,label,value,validator);

@override
String toString() {
  return 'Field(label: $label, value: $value, validator: $validator)';
}


}

/// @nodoc
abstract mixin class $FieldCopyWith<$Res>  {
  factory $FieldCopyWith(Field value, $Res Function(Field) _then) = _$FieldCopyWithImpl;
@useResult
$Res call({
 String label, String value, Validator? validator
});




}
/// @nodoc
class _$FieldCopyWithImpl<$Res>
    implements $FieldCopyWith<$Res> {
  _$FieldCopyWithImpl(this._self, this._then);

  final Field _self;
  final $Res Function(Field) _then;

/// Create a copy of Field
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,Object? validator = freezed,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,validator: freezed == validator ? _self.validator : validator // ignore: cast_nullable_to_non_nullable
as Validator?,
  ));
}

}


/// Adds pattern-matching-related methods to [Field].
extension FieldPatterns on Field {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Field value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Field() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Field value)  $default,){
final _that = this;
switch (_that) {
case _Field():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Field value)?  $default,){
final _that = this;
switch (_that) {
case _Field() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String value,  Validator? validator)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Field() when $default != null:
return $default(_that.label,_that.value,_that.validator);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String value,  Validator? validator)  $default,) {final _that = this;
switch (_that) {
case _Field():
return $default(_that.label,_that.value,_that.validator);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String value,  Validator? validator)?  $default,) {final _that = this;
switch (_that) {
case _Field() when $default != null:
return $default(_that.label,_that.value,_that.validator);case _:
  return null;

}
}

}

/// @nodoc


class _Field implements Field {
  const _Field({required this.label, required this.value, this.validator});
  

@override final  String label;
@override final  String value;
@override final  Validator? validator;

/// Create a copy of Field
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FieldCopyWith<_Field> get copyWith => __$FieldCopyWithImpl<_Field>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Field&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.validator, validator) || other.validator == validator));
}


@override
int get hashCode => Object.hash(runtimeType,label,value,validator);

@override
String toString() {
  return 'Field(label: $label, value: $value, validator: $validator)';
}


}

/// @nodoc
abstract mixin class _$FieldCopyWith<$Res> implements $FieldCopyWith<$Res> {
  factory _$FieldCopyWith(_Field value, $Res Function(_Field) _then) = __$FieldCopyWithImpl;
@override @useResult
$Res call({
 String label, String value, Validator? validator
});




}
/// @nodoc
class __$FieldCopyWithImpl<$Res>
    implements _$FieldCopyWith<$Res> {
  __$FieldCopyWithImpl(this._self, this._then);

  final _Field _self;
  final $Res Function(_Field) _then;

/// Create a copy of Field
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,Object? validator = freezed,}) {
  return _then(_Field(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,validator: freezed == validator ? _self.validator : validator // ignore: cast_nullable_to_non_nullable
as Validator?,
  ));
}


}

// dart format on
