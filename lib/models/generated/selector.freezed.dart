// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../selector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VM2<A,B> {

 A get a; B get b;
/// Create a copy of VM2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VM2CopyWith<A, B, VM2<A, B>> get copyWith => _$VM2CopyWithImpl<A, B, VM2<A, B>>(this as VM2<A, B>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VM2<A, B>&&const DeepCollectionEquality().equals(other.a, a)&&const DeepCollectionEquality().equals(other.b, b));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(a),const DeepCollectionEquality().hash(b));

@override
String toString() {
  return 'VM2<$A, $B>(a: $a, b: $b)';
}


}

/// @nodoc
abstract mixin class $VM2CopyWith<A,B,$Res>  {
  factory $VM2CopyWith(VM2<A, B> value, $Res Function(VM2<A, B>) _then) = _$VM2CopyWithImpl;
@useResult
$Res call({
 A a, B b
});




}
/// @nodoc
class _$VM2CopyWithImpl<A,B,$Res>
    implements $VM2CopyWith<A, B, $Res> {
  _$VM2CopyWithImpl(this._self, this._then);

  final VM2<A, B> _self;
  final $Res Function(VM2<A, B>) _then;

/// Create a copy of VM2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? a = freezed,Object? b = freezed,}) {
  return _then(_self.copyWith(
a: freezed == a ? _self.a : a // ignore: cast_nullable_to_non_nullable
as A,b: freezed == b ? _self.b : b // ignore: cast_nullable_to_non_nullable
as B,
  ));
}

}


/// Adds pattern-matching-related methods to [VM2].
extension VM2Patterns<A,B> on VM2<A, B> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VM2<A, B> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VM2() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VM2<A, B> value)  $default,){
final _that = this;
switch (_that) {
case _VM2():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VM2<A, B> value)?  $default,){
final _that = this;
switch (_that) {
case _VM2() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( A a,  B b)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VM2() when $default != null:
return $default(_that.a,_that.b);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( A a,  B b)  $default,) {final _that = this;
switch (_that) {
case _VM2():
return $default(_that.a,_that.b);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( A a,  B b)?  $default,) {final _that = this;
switch (_that) {
case _VM2() when $default != null:
return $default(_that.a,_that.b);case _:
  return null;

}
}

}

/// @nodoc


class _VM2<A,B> implements VM2<A, B> {
  const _VM2({required this.a, required this.b});
  

@override final  A a;
@override final  B b;

/// Create a copy of VM2
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VM2CopyWith<A, B, _VM2<A, B>> get copyWith => __$VM2CopyWithImpl<A, B, _VM2<A, B>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VM2<A, B>&&const DeepCollectionEquality().equals(other.a, a)&&const DeepCollectionEquality().equals(other.b, b));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(a),const DeepCollectionEquality().hash(b));

@override
String toString() {
  return 'VM2<$A, $B>(a: $a, b: $b)';
}


}

/// @nodoc
abstract mixin class _$VM2CopyWith<A,B,$Res> implements $VM2CopyWith<A, B, $Res> {
  factory _$VM2CopyWith(_VM2<A, B> value, $Res Function(_VM2<A, B>) _then) = __$VM2CopyWithImpl;
@override @useResult
$Res call({
 A a, B b
});




}
/// @nodoc
class __$VM2CopyWithImpl<A,B,$Res>
    implements _$VM2CopyWith<A, B, $Res> {
  __$VM2CopyWithImpl(this._self, this._then);

  final _VM2<A, B> _self;
  final $Res Function(_VM2<A, B>) _then;

/// Create a copy of VM2
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? a = freezed,Object? b = freezed,}) {
  return _then(_VM2<A, B>(
a: freezed == a ? _self.a : a // ignore: cast_nullable_to_non_nullable
as A,b: freezed == b ? _self.b : b // ignore: cast_nullable_to_non_nullable
as B,
  ));
}


}

/// @nodoc
mixin _$StartButtonSelectorState {

 bool get isInit; bool get hasProfile;
/// Create a copy of StartButtonSelectorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartButtonSelectorStateCopyWith<StartButtonSelectorState> get copyWith => _$StartButtonSelectorStateCopyWithImpl<StartButtonSelectorState>(this as StartButtonSelectorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartButtonSelectorState&&(identical(other.isInit, isInit) || other.isInit == isInit)&&(identical(other.hasProfile, hasProfile) || other.hasProfile == hasProfile));
}


@override
int get hashCode => Object.hash(runtimeType,isInit,hasProfile);

@override
String toString() {
  return 'StartButtonSelectorState(isInit: $isInit, hasProfile: $hasProfile)';
}


}

/// @nodoc
abstract mixin class $StartButtonSelectorStateCopyWith<$Res>  {
  factory $StartButtonSelectorStateCopyWith(StartButtonSelectorState value, $Res Function(StartButtonSelectorState) _then) = _$StartButtonSelectorStateCopyWithImpl;
@useResult
$Res call({
 bool isInit, bool hasProfile
});




}
/// @nodoc
class _$StartButtonSelectorStateCopyWithImpl<$Res>
    implements $StartButtonSelectorStateCopyWith<$Res> {
  _$StartButtonSelectorStateCopyWithImpl(this._self, this._then);

  final StartButtonSelectorState _self;
  final $Res Function(StartButtonSelectorState) _then;

/// Create a copy of StartButtonSelectorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isInit = null,Object? hasProfile = null,}) {
  return _then(_self.copyWith(
isInit: null == isInit ? _self.isInit : isInit // ignore: cast_nullable_to_non_nullable
as bool,hasProfile: null == hasProfile ? _self.hasProfile : hasProfile // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StartButtonSelectorState].
extension StartButtonSelectorStatePatterns on StartButtonSelectorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StartButtonSelectorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartButtonSelectorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StartButtonSelectorState value)  $default,){
final _that = this;
switch (_that) {
case _StartButtonSelectorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StartButtonSelectorState value)?  $default,){
final _that = this;
switch (_that) {
case _StartButtonSelectorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isInit,  bool hasProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartButtonSelectorState() when $default != null:
return $default(_that.isInit,_that.hasProfile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isInit,  bool hasProfile)  $default,) {final _that = this;
switch (_that) {
case _StartButtonSelectorState():
return $default(_that.isInit,_that.hasProfile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isInit,  bool hasProfile)?  $default,) {final _that = this;
switch (_that) {
case _StartButtonSelectorState() when $default != null:
return $default(_that.isInit,_that.hasProfile);case _:
  return null;

}
}

}

/// @nodoc


class _StartButtonSelectorState implements StartButtonSelectorState {
  const _StartButtonSelectorState({required this.isInit, required this.hasProfile});
  

@override final  bool isInit;
@override final  bool hasProfile;

/// Create a copy of StartButtonSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartButtonSelectorStateCopyWith<_StartButtonSelectorState> get copyWith => __$StartButtonSelectorStateCopyWithImpl<_StartButtonSelectorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartButtonSelectorState&&(identical(other.isInit, isInit) || other.isInit == isInit)&&(identical(other.hasProfile, hasProfile) || other.hasProfile == hasProfile));
}


@override
int get hashCode => Object.hash(runtimeType,isInit,hasProfile);

@override
String toString() {
  return 'StartButtonSelectorState(isInit: $isInit, hasProfile: $hasProfile)';
}


}

/// @nodoc
abstract mixin class _$StartButtonSelectorStateCopyWith<$Res> implements $StartButtonSelectorStateCopyWith<$Res> {
  factory _$StartButtonSelectorStateCopyWith(_StartButtonSelectorState value, $Res Function(_StartButtonSelectorState) _then) = __$StartButtonSelectorStateCopyWithImpl;
@override @useResult
$Res call({
 bool isInit, bool hasProfile
});




}
/// @nodoc
class __$StartButtonSelectorStateCopyWithImpl<$Res>
    implements _$StartButtonSelectorStateCopyWith<$Res> {
  __$StartButtonSelectorStateCopyWithImpl(this._self, this._then);

  final _StartButtonSelectorState _self;
  final $Res Function(_StartButtonSelectorState) _then;

/// Create a copy of StartButtonSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isInit = null,Object? hasProfile = null,}) {
  return _then(_StartButtonSelectorState(
isInit: null == isInit ? _self.isInit : isInit // ignore: cast_nullable_to_non_nullable
as bool,hasProfile: null == hasProfile ? _self.hasProfile : hasProfile // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ProfilesSelectorState {

 List<Profile> get profiles; String? get currentProfileId; int get columns;
/// Create a copy of ProfilesSelectorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfilesSelectorStateCopyWith<ProfilesSelectorState> get copyWith => _$ProfilesSelectorStateCopyWithImpl<ProfilesSelectorState>(this as ProfilesSelectorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfilesSelectorState&&const DeepCollectionEquality().equals(other.profiles, profiles)&&(identical(other.currentProfileId, currentProfileId) || other.currentProfileId == currentProfileId)&&(identical(other.columns, columns) || other.columns == columns));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(profiles),currentProfileId,columns);

@override
String toString() {
  return 'ProfilesSelectorState(profiles: $profiles, currentProfileId: $currentProfileId, columns: $columns)';
}


}

/// @nodoc
abstract mixin class $ProfilesSelectorStateCopyWith<$Res>  {
  factory $ProfilesSelectorStateCopyWith(ProfilesSelectorState value, $Res Function(ProfilesSelectorState) _then) = _$ProfilesSelectorStateCopyWithImpl;
@useResult
$Res call({
 List<Profile> profiles, String? currentProfileId, int columns
});




}
/// @nodoc
class _$ProfilesSelectorStateCopyWithImpl<$Res>
    implements $ProfilesSelectorStateCopyWith<$Res> {
  _$ProfilesSelectorStateCopyWithImpl(this._self, this._then);

  final ProfilesSelectorState _self;
  final $Res Function(ProfilesSelectorState) _then;

/// Create a copy of ProfilesSelectorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profiles = null,Object? currentProfileId = freezed,Object? columns = null,}) {
  return _then(_self.copyWith(
profiles: null == profiles ? _self.profiles : profiles // ignore: cast_nullable_to_non_nullable
as List<Profile>,currentProfileId: freezed == currentProfileId ? _self.currentProfileId : currentProfileId // ignore: cast_nullable_to_non_nullable
as String?,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfilesSelectorState].
extension ProfilesSelectorStatePatterns on ProfilesSelectorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfilesSelectorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfilesSelectorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfilesSelectorState value)  $default,){
final _that = this;
switch (_that) {
case _ProfilesSelectorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfilesSelectorState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfilesSelectorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Profile> profiles,  String? currentProfileId,  int columns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfilesSelectorState() when $default != null:
return $default(_that.profiles,_that.currentProfileId,_that.columns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Profile> profiles,  String? currentProfileId,  int columns)  $default,) {final _that = this;
switch (_that) {
case _ProfilesSelectorState():
return $default(_that.profiles,_that.currentProfileId,_that.columns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Profile> profiles,  String? currentProfileId,  int columns)?  $default,) {final _that = this;
switch (_that) {
case _ProfilesSelectorState() when $default != null:
return $default(_that.profiles,_that.currentProfileId,_that.columns);case _:
  return null;

}
}

}

/// @nodoc


class _ProfilesSelectorState implements ProfilesSelectorState {
  const _ProfilesSelectorState({required final  List<Profile> profiles, required this.currentProfileId, required this.columns}): _profiles = profiles;
  

 final  List<Profile> _profiles;
@override List<Profile> get profiles {
  if (_profiles is EqualUnmodifiableListView) return _profiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profiles);
}

@override final  String? currentProfileId;
@override final  int columns;

/// Create a copy of ProfilesSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfilesSelectorStateCopyWith<_ProfilesSelectorState> get copyWith => __$ProfilesSelectorStateCopyWithImpl<_ProfilesSelectorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfilesSelectorState&&const DeepCollectionEquality().equals(other._profiles, _profiles)&&(identical(other.currentProfileId, currentProfileId) || other.currentProfileId == currentProfileId)&&(identical(other.columns, columns) || other.columns == columns));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_profiles),currentProfileId,columns);

@override
String toString() {
  return 'ProfilesSelectorState(profiles: $profiles, currentProfileId: $currentProfileId, columns: $columns)';
}


}

/// @nodoc
abstract mixin class _$ProfilesSelectorStateCopyWith<$Res> implements $ProfilesSelectorStateCopyWith<$Res> {
  factory _$ProfilesSelectorStateCopyWith(_ProfilesSelectorState value, $Res Function(_ProfilesSelectorState) _then) = __$ProfilesSelectorStateCopyWithImpl;
@override @useResult
$Res call({
 List<Profile> profiles, String? currentProfileId, int columns
});




}
/// @nodoc
class __$ProfilesSelectorStateCopyWithImpl<$Res>
    implements _$ProfilesSelectorStateCopyWith<$Res> {
  __$ProfilesSelectorStateCopyWithImpl(this._self, this._then);

  final _ProfilesSelectorState _self;
  final $Res Function(_ProfilesSelectorState) _then;

/// Create a copy of ProfilesSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profiles = null,Object? currentProfileId = freezed,Object? columns = null,}) {
  return _then(_ProfilesSelectorState(
profiles: null == profiles ? _self._profiles : profiles // ignore: cast_nullable_to_non_nullable
as List<Profile>,currentProfileId: freezed == currentProfileId ? _self.currentProfileId : currentProfileId // ignore: cast_nullable_to_non_nullable
as String?,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$NetworkDetectionState {

 bool get isTesting; IpInfo? get ipInfo;
/// Create a copy of NetworkDetectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkDetectionStateCopyWith<NetworkDetectionState> get copyWith => _$NetworkDetectionStateCopyWithImpl<NetworkDetectionState>(this as NetworkDetectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkDetectionState&&(identical(other.isTesting, isTesting) || other.isTesting == isTesting)&&(identical(other.ipInfo, ipInfo) || other.ipInfo == ipInfo));
}


@override
int get hashCode => Object.hash(runtimeType,isTesting,ipInfo);

@override
String toString() {
  return 'NetworkDetectionState(isTesting: $isTesting, ipInfo: $ipInfo)';
}


}

/// @nodoc
abstract mixin class $NetworkDetectionStateCopyWith<$Res>  {
  factory $NetworkDetectionStateCopyWith(NetworkDetectionState value, $Res Function(NetworkDetectionState) _then) = _$NetworkDetectionStateCopyWithImpl;
@useResult
$Res call({
 bool isTesting, IpInfo? ipInfo
});




}
/// @nodoc
class _$NetworkDetectionStateCopyWithImpl<$Res>
    implements $NetworkDetectionStateCopyWith<$Res> {
  _$NetworkDetectionStateCopyWithImpl(this._self, this._then);

  final NetworkDetectionState _self;
  final $Res Function(NetworkDetectionState) _then;

/// Create a copy of NetworkDetectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isTesting = null,Object? ipInfo = freezed,}) {
  return _then(_self.copyWith(
isTesting: null == isTesting ? _self.isTesting : isTesting // ignore: cast_nullable_to_non_nullable
as bool,ipInfo: freezed == ipInfo ? _self.ipInfo : ipInfo // ignore: cast_nullable_to_non_nullable
as IpInfo?,
  ));
}

}


/// Adds pattern-matching-related methods to [NetworkDetectionState].
extension NetworkDetectionStatePatterns on NetworkDetectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NetworkDetectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkDetectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NetworkDetectionState value)  $default,){
final _that = this;
switch (_that) {
case _NetworkDetectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NetworkDetectionState value)?  $default,){
final _that = this;
switch (_that) {
case _NetworkDetectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isTesting,  IpInfo? ipInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkDetectionState() when $default != null:
return $default(_that.isTesting,_that.ipInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isTesting,  IpInfo? ipInfo)  $default,) {final _that = this;
switch (_that) {
case _NetworkDetectionState():
return $default(_that.isTesting,_that.ipInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isTesting,  IpInfo? ipInfo)?  $default,) {final _that = this;
switch (_that) {
case _NetworkDetectionState() when $default != null:
return $default(_that.isTesting,_that.ipInfo);case _:
  return null;

}
}

}

/// @nodoc


class _NetworkDetectionState implements NetworkDetectionState {
  const _NetworkDetectionState({required this.isTesting, required this.ipInfo});
  

@override final  bool isTesting;
@override final  IpInfo? ipInfo;

/// Create a copy of NetworkDetectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkDetectionStateCopyWith<_NetworkDetectionState> get copyWith => __$NetworkDetectionStateCopyWithImpl<_NetworkDetectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkDetectionState&&(identical(other.isTesting, isTesting) || other.isTesting == isTesting)&&(identical(other.ipInfo, ipInfo) || other.ipInfo == ipInfo));
}


@override
int get hashCode => Object.hash(runtimeType,isTesting,ipInfo);

@override
String toString() {
  return 'NetworkDetectionState(isTesting: $isTesting, ipInfo: $ipInfo)';
}


}

/// @nodoc
abstract mixin class _$NetworkDetectionStateCopyWith<$Res> implements $NetworkDetectionStateCopyWith<$Res> {
  factory _$NetworkDetectionStateCopyWith(_NetworkDetectionState value, $Res Function(_NetworkDetectionState) _then) = __$NetworkDetectionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isTesting, IpInfo? ipInfo
});




}
/// @nodoc
class __$NetworkDetectionStateCopyWithImpl<$Res>
    implements _$NetworkDetectionStateCopyWith<$Res> {
  __$NetworkDetectionStateCopyWithImpl(this._self, this._then);

  final _NetworkDetectionState _self;
  final $Res Function(_NetworkDetectionState) _then;

/// Create a copy of NetworkDetectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isTesting = null,Object? ipInfo = freezed,}) {
  return _then(_NetworkDetectionState(
isTesting: null == isTesting ? _self.isTesting : isTesting // ignore: cast_nullable_to_non_nullable
as bool,ipInfo: freezed == ipInfo ? _self.ipInfo : ipInfo // ignore: cast_nullable_to_non_nullable
as IpInfo?,
  ));
}


}

/// @nodoc
mixin _$TrayState {

 Mode get mode; int get port; bool get autoLaunch; bool get systemProxy; bool get tunEnable; bool get isStart; String? get locale; Brightness? get brightness; List<Group> get groups; SelectedMap get selectedMap;
/// Create a copy of TrayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrayStateCopyWith<TrayState> get copyWith => _$TrayStateCopyWithImpl<TrayState>(this as TrayState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrayState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.port, port) || other.port == port)&&(identical(other.autoLaunch, autoLaunch) || other.autoLaunch == autoLaunch)&&(identical(other.systemProxy, systemProxy) || other.systemProxy == systemProxy)&&(identical(other.tunEnable, tunEnable) || other.tunEnable == tunEnable)&&(identical(other.isStart, isStart) || other.isStart == isStart)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&const DeepCollectionEquality().equals(other.groups, groups)&&const DeepCollectionEquality().equals(other.selectedMap, selectedMap));
}


@override
int get hashCode => Object.hash(runtimeType,mode,port,autoLaunch,systemProxy,tunEnable,isStart,locale,brightness,const DeepCollectionEquality().hash(groups),const DeepCollectionEquality().hash(selectedMap));

@override
String toString() {
  return 'TrayState(mode: $mode, port: $port, autoLaunch: $autoLaunch, systemProxy: $systemProxy, tunEnable: $tunEnable, isStart: $isStart, locale: $locale, brightness: $brightness, groups: $groups, selectedMap: $selectedMap)';
}


}

/// @nodoc
abstract mixin class $TrayStateCopyWith<$Res>  {
  factory $TrayStateCopyWith(TrayState value, $Res Function(TrayState) _then) = _$TrayStateCopyWithImpl;
@useResult
$Res call({
 Mode mode, int port, bool autoLaunch, bool systemProxy, bool tunEnable, bool isStart, String? locale, Brightness? brightness, List<Group> groups, SelectedMap selectedMap
});




}
/// @nodoc
class _$TrayStateCopyWithImpl<$Res>
    implements $TrayStateCopyWith<$Res> {
  _$TrayStateCopyWithImpl(this._self, this._then);

  final TrayState _self;
  final $Res Function(TrayState) _then;

/// Create a copy of TrayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? port = null,Object? autoLaunch = null,Object? systemProxy = null,Object? tunEnable = null,Object? isStart = null,Object? locale = freezed,Object? brightness = freezed,Object? groups = null,Object? selectedMap = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as Mode,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,autoLaunch: null == autoLaunch ? _self.autoLaunch : autoLaunch // ignore: cast_nullable_to_non_nullable
as bool,systemProxy: null == systemProxy ? _self.systemProxy : systemProxy // ignore: cast_nullable_to_non_nullable
as bool,tunEnable: null == tunEnable ? _self.tunEnable : tunEnable // ignore: cast_nullable_to_non_nullable
as bool,isStart: null == isStart ? _self.isStart : isStart // ignore: cast_nullable_to_non_nullable
as bool,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,brightness: freezed == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as Brightness?,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<Group>,selectedMap: null == selectedMap ? _self.selectedMap : selectedMap // ignore: cast_nullable_to_non_nullable
as SelectedMap,
  ));
}

}


/// Adds pattern-matching-related methods to [TrayState].
extension TrayStatePatterns on TrayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrayState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrayState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrayState value)  $default,){
final _that = this;
switch (_that) {
case _TrayState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrayState value)?  $default,){
final _that = this;
switch (_that) {
case _TrayState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Mode mode,  int port,  bool autoLaunch,  bool systemProxy,  bool tunEnable,  bool isStart,  String? locale,  Brightness? brightness,  List<Group> groups,  SelectedMap selectedMap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrayState() when $default != null:
return $default(_that.mode,_that.port,_that.autoLaunch,_that.systemProxy,_that.tunEnable,_that.isStart,_that.locale,_that.brightness,_that.groups,_that.selectedMap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Mode mode,  int port,  bool autoLaunch,  bool systemProxy,  bool tunEnable,  bool isStart,  String? locale,  Brightness? brightness,  List<Group> groups,  SelectedMap selectedMap)  $default,) {final _that = this;
switch (_that) {
case _TrayState():
return $default(_that.mode,_that.port,_that.autoLaunch,_that.systemProxy,_that.tunEnable,_that.isStart,_that.locale,_that.brightness,_that.groups,_that.selectedMap);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Mode mode,  int port,  bool autoLaunch,  bool systemProxy,  bool tunEnable,  bool isStart,  String? locale,  Brightness? brightness,  List<Group> groups,  SelectedMap selectedMap)?  $default,) {final _that = this;
switch (_that) {
case _TrayState() when $default != null:
return $default(_that.mode,_that.port,_that.autoLaunch,_that.systemProxy,_that.tunEnable,_that.isStart,_that.locale,_that.brightness,_that.groups,_that.selectedMap);case _:
  return null;

}
}

}

/// @nodoc


class _TrayState implements TrayState {
  const _TrayState({required this.mode, required this.port, required this.autoLaunch, required this.systemProxy, required this.tunEnable, required this.isStart, required this.locale, required this.brightness, required final  List<Group> groups, required final  SelectedMap selectedMap}): _groups = groups,_selectedMap = selectedMap;
  

@override final  Mode mode;
@override final  int port;
@override final  bool autoLaunch;
@override final  bool systemProxy;
@override final  bool tunEnable;
@override final  bool isStart;
@override final  String? locale;
@override final  Brightness? brightness;
 final  List<Group> _groups;
@override List<Group> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

 final  SelectedMap _selectedMap;
@override SelectedMap get selectedMap {
  if (_selectedMap is EqualUnmodifiableMapView) return _selectedMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_selectedMap);
}


/// Create a copy of TrayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrayStateCopyWith<_TrayState> get copyWith => __$TrayStateCopyWithImpl<_TrayState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrayState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.port, port) || other.port == port)&&(identical(other.autoLaunch, autoLaunch) || other.autoLaunch == autoLaunch)&&(identical(other.systemProxy, systemProxy) || other.systemProxy == systemProxy)&&(identical(other.tunEnable, tunEnable) || other.tunEnable == tunEnable)&&(identical(other.isStart, isStart) || other.isStart == isStart)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&const DeepCollectionEquality().equals(other._groups, _groups)&&const DeepCollectionEquality().equals(other._selectedMap, _selectedMap));
}


@override
int get hashCode => Object.hash(runtimeType,mode,port,autoLaunch,systemProxy,tunEnable,isStart,locale,brightness,const DeepCollectionEquality().hash(_groups),const DeepCollectionEquality().hash(_selectedMap));

@override
String toString() {
  return 'TrayState(mode: $mode, port: $port, autoLaunch: $autoLaunch, systemProxy: $systemProxy, tunEnable: $tunEnable, isStart: $isStart, locale: $locale, brightness: $brightness, groups: $groups, selectedMap: $selectedMap)';
}


}

/// @nodoc
abstract mixin class _$TrayStateCopyWith<$Res> implements $TrayStateCopyWith<$Res> {
  factory _$TrayStateCopyWith(_TrayState value, $Res Function(_TrayState) _then) = __$TrayStateCopyWithImpl;
@override @useResult
$Res call({
 Mode mode, int port, bool autoLaunch, bool systemProxy, bool tunEnable, bool isStart, String? locale, Brightness? brightness, List<Group> groups, SelectedMap selectedMap
});




}
/// @nodoc
class __$TrayStateCopyWithImpl<$Res>
    implements _$TrayStateCopyWith<$Res> {
  __$TrayStateCopyWithImpl(this._self, this._then);

  final _TrayState _self;
  final $Res Function(_TrayState) _then;

/// Create a copy of TrayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? port = null,Object? autoLaunch = null,Object? systemProxy = null,Object? tunEnable = null,Object? isStart = null,Object? locale = freezed,Object? brightness = freezed,Object? groups = null,Object? selectedMap = null,}) {
  return _then(_TrayState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as Mode,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,autoLaunch: null == autoLaunch ? _self.autoLaunch : autoLaunch // ignore: cast_nullable_to_non_nullable
as bool,systemProxy: null == systemProxy ? _self.systemProxy : systemProxy // ignore: cast_nullable_to_non_nullable
as bool,tunEnable: null == tunEnable ? _self.tunEnable : tunEnable // ignore: cast_nullable_to_non_nullable
as bool,isStart: null == isStart ? _self.isStart : isStart // ignore: cast_nullable_to_non_nullable
as bool,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,brightness: freezed == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as Brightness?,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<Group>,selectedMap: null == selectedMap ? _self._selectedMap : selectedMap // ignore: cast_nullable_to_non_nullable
as SelectedMap,
  ));
}


}

/// @nodoc
mixin _$HomeState {

 PageLabel get pageLabel; List<NavigationItem> get navigationItems; ViewMode get viewMode; String? get locale;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.pageLabel, pageLabel) || other.pageLabel == pageLabel)&&const DeepCollectionEquality().equals(other.navigationItems, navigationItems)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode)&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,pageLabel,const DeepCollectionEquality().hash(navigationItems),viewMode,locale);

@override
String toString() {
  return 'HomeState(pageLabel: $pageLabel, navigationItems: $navigationItems, viewMode: $viewMode, locale: $locale)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 PageLabel pageLabel, List<NavigationItem> navigationItems, ViewMode viewMode, String? locale
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageLabel = null,Object? navigationItems = null,Object? viewMode = null,Object? locale = freezed,}) {
  return _then(_self.copyWith(
pageLabel: null == pageLabel ? _self.pageLabel : pageLabel // ignore: cast_nullable_to_non_nullable
as PageLabel,navigationItems: null == navigationItems ? _self.navigationItems : navigationItems // ignore: cast_nullable_to_non_nullable
as List<NavigationItem>,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as ViewMode,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageLabel pageLabel,  List<NavigationItem> navigationItems,  ViewMode viewMode,  String? locale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.pageLabel,_that.navigationItems,_that.viewMode,_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageLabel pageLabel,  List<NavigationItem> navigationItems,  ViewMode viewMode,  String? locale)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.pageLabel,_that.navigationItems,_that.viewMode,_that.locale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageLabel pageLabel,  List<NavigationItem> navigationItems,  ViewMode viewMode,  String? locale)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.pageLabel,_that.navigationItems,_that.viewMode,_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({required this.pageLabel, required final  List<NavigationItem> navigationItems, required this.viewMode, required this.locale}): _navigationItems = navigationItems;
  

@override final  PageLabel pageLabel;
 final  List<NavigationItem> _navigationItems;
@override List<NavigationItem> get navigationItems {
  if (_navigationItems is EqualUnmodifiableListView) return _navigationItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_navigationItems);
}

@override final  ViewMode viewMode;
@override final  String? locale;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.pageLabel, pageLabel) || other.pageLabel == pageLabel)&&const DeepCollectionEquality().equals(other._navigationItems, _navigationItems)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode)&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,pageLabel,const DeepCollectionEquality().hash(_navigationItems),viewMode,locale);

@override
String toString() {
  return 'HomeState(pageLabel: $pageLabel, navigationItems: $navigationItems, viewMode: $viewMode, locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 PageLabel pageLabel, List<NavigationItem> navigationItems, ViewMode viewMode, String? locale
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageLabel = null,Object? navigationItems = null,Object? viewMode = null,Object? locale = freezed,}) {
  return _then(_HomeState(
pageLabel: null == pageLabel ? _self.pageLabel : pageLabel // ignore: cast_nullable_to_non_nullable
as PageLabel,navigationItems: null == navigationItems ? _self._navigationItems : navigationItems // ignore: cast_nullable_to_non_nullable
as List<NavigationItem>,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as ViewMode,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ProxiesSelectorState {

 List<String> get groupNames; String? get currentGroupName;
/// Create a copy of ProxiesSelectorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProxiesSelectorStateCopyWith<ProxiesSelectorState> get copyWith => _$ProxiesSelectorStateCopyWithImpl<ProxiesSelectorState>(this as ProxiesSelectorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProxiesSelectorState&&const DeepCollectionEquality().equals(other.groupNames, groupNames)&&(identical(other.currentGroupName, currentGroupName) || other.currentGroupName == currentGroupName));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(groupNames),currentGroupName);

@override
String toString() {
  return 'ProxiesSelectorState(groupNames: $groupNames, currentGroupName: $currentGroupName)';
}


}

/// @nodoc
abstract mixin class $ProxiesSelectorStateCopyWith<$Res>  {
  factory $ProxiesSelectorStateCopyWith(ProxiesSelectorState value, $Res Function(ProxiesSelectorState) _then) = _$ProxiesSelectorStateCopyWithImpl;
@useResult
$Res call({
 List<String> groupNames, String? currentGroupName
});




}
/// @nodoc
class _$ProxiesSelectorStateCopyWithImpl<$Res>
    implements $ProxiesSelectorStateCopyWith<$Res> {
  _$ProxiesSelectorStateCopyWithImpl(this._self, this._then);

  final ProxiesSelectorState _self;
  final $Res Function(ProxiesSelectorState) _then;

/// Create a copy of ProxiesSelectorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupNames = null,Object? currentGroupName = freezed,}) {
  return _then(_self.copyWith(
groupNames: null == groupNames ? _self.groupNames : groupNames // ignore: cast_nullable_to_non_nullable
as List<String>,currentGroupName: freezed == currentGroupName ? _self.currentGroupName : currentGroupName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProxiesSelectorState].
extension ProxiesSelectorStatePatterns on ProxiesSelectorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProxiesSelectorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProxiesSelectorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProxiesSelectorState value)  $default,){
final _that = this;
switch (_that) {
case _ProxiesSelectorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProxiesSelectorState value)?  $default,){
final _that = this;
switch (_that) {
case _ProxiesSelectorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> groupNames,  String? currentGroupName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProxiesSelectorState() when $default != null:
return $default(_that.groupNames,_that.currentGroupName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> groupNames,  String? currentGroupName)  $default,) {final _that = this;
switch (_that) {
case _ProxiesSelectorState():
return $default(_that.groupNames,_that.currentGroupName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> groupNames,  String? currentGroupName)?  $default,) {final _that = this;
switch (_that) {
case _ProxiesSelectorState() when $default != null:
return $default(_that.groupNames,_that.currentGroupName);case _:
  return null;

}
}

}

/// @nodoc


class _ProxiesSelectorState implements ProxiesSelectorState {
  const _ProxiesSelectorState({required final  List<String> groupNames, required this.currentGroupName}): _groupNames = groupNames;
  

 final  List<String> _groupNames;
@override List<String> get groupNames {
  if (_groupNames is EqualUnmodifiableListView) return _groupNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groupNames);
}

@override final  String? currentGroupName;

/// Create a copy of ProxiesSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProxiesSelectorStateCopyWith<_ProxiesSelectorState> get copyWith => __$ProxiesSelectorStateCopyWithImpl<_ProxiesSelectorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProxiesSelectorState&&const DeepCollectionEquality().equals(other._groupNames, _groupNames)&&(identical(other.currentGroupName, currentGroupName) || other.currentGroupName == currentGroupName));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_groupNames),currentGroupName);

@override
String toString() {
  return 'ProxiesSelectorState(groupNames: $groupNames, currentGroupName: $currentGroupName)';
}


}

/// @nodoc
abstract mixin class _$ProxiesSelectorStateCopyWith<$Res> implements $ProxiesSelectorStateCopyWith<$Res> {
  factory _$ProxiesSelectorStateCopyWith(_ProxiesSelectorState value, $Res Function(_ProxiesSelectorState) _then) = __$ProxiesSelectorStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> groupNames, String? currentGroupName
});




}
/// @nodoc
class __$ProxiesSelectorStateCopyWithImpl<$Res>
    implements _$ProxiesSelectorStateCopyWith<$Res> {
  __$ProxiesSelectorStateCopyWithImpl(this._self, this._then);

  final _ProxiesSelectorState _self;
  final $Res Function(_ProxiesSelectorState) _then;

/// Create a copy of ProxiesSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupNames = null,Object? currentGroupName = freezed,}) {
  return _then(_ProxiesSelectorState(
groupNames: null == groupNames ? _self._groupNames : groupNames // ignore: cast_nullable_to_non_nullable
as List<String>,currentGroupName: freezed == currentGroupName ? _self.currentGroupName : currentGroupName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$GroupNamesState {

 List<String> get groupNames;
/// Create a copy of GroupNamesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupNamesStateCopyWith<GroupNamesState> get copyWith => _$GroupNamesStateCopyWithImpl<GroupNamesState>(this as GroupNamesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupNamesState&&const DeepCollectionEquality().equals(other.groupNames, groupNames));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(groupNames));

@override
String toString() {
  return 'GroupNamesState(groupNames: $groupNames)';
}


}

/// @nodoc
abstract mixin class $GroupNamesStateCopyWith<$Res>  {
  factory $GroupNamesStateCopyWith(GroupNamesState value, $Res Function(GroupNamesState) _then) = _$GroupNamesStateCopyWithImpl;
@useResult
$Res call({
 List<String> groupNames
});




}
/// @nodoc
class _$GroupNamesStateCopyWithImpl<$Res>
    implements $GroupNamesStateCopyWith<$Res> {
  _$GroupNamesStateCopyWithImpl(this._self, this._then);

  final GroupNamesState _self;
  final $Res Function(GroupNamesState) _then;

/// Create a copy of GroupNamesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupNames = null,}) {
  return _then(_self.copyWith(
groupNames: null == groupNames ? _self.groupNames : groupNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupNamesState].
extension GroupNamesStatePatterns on GroupNamesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupNamesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupNamesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupNamesState value)  $default,){
final _that = this;
switch (_that) {
case _GroupNamesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupNamesState value)?  $default,){
final _that = this;
switch (_that) {
case _GroupNamesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> groupNames)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupNamesState() when $default != null:
return $default(_that.groupNames);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> groupNames)  $default,) {final _that = this;
switch (_that) {
case _GroupNamesState():
return $default(_that.groupNames);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> groupNames)?  $default,) {final _that = this;
switch (_that) {
case _GroupNamesState() when $default != null:
return $default(_that.groupNames);case _:
  return null;

}
}

}

/// @nodoc


class _GroupNamesState implements GroupNamesState {
  const _GroupNamesState({required final  List<String> groupNames}): _groupNames = groupNames;
  

 final  List<String> _groupNames;
@override List<String> get groupNames {
  if (_groupNames is EqualUnmodifiableListView) return _groupNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groupNames);
}


/// Create a copy of GroupNamesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupNamesStateCopyWith<_GroupNamesState> get copyWith => __$GroupNamesStateCopyWithImpl<_GroupNamesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupNamesState&&const DeepCollectionEquality().equals(other._groupNames, _groupNames));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_groupNames));

@override
String toString() {
  return 'GroupNamesState(groupNames: $groupNames)';
}


}

/// @nodoc
abstract mixin class _$GroupNamesStateCopyWith<$Res> implements $GroupNamesStateCopyWith<$Res> {
  factory _$GroupNamesStateCopyWith(_GroupNamesState value, $Res Function(_GroupNamesState) _then) = __$GroupNamesStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> groupNames
});




}
/// @nodoc
class __$GroupNamesStateCopyWithImpl<$Res>
    implements _$GroupNamesStateCopyWith<$Res> {
  __$GroupNamesStateCopyWithImpl(this._self, this._then);

  final _GroupNamesState _self;
  final $Res Function(_GroupNamesState) _then;

/// Create a copy of GroupNamesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupNames = null,}) {
  return _then(_GroupNamesState(
groupNames: null == groupNames ? _self._groupNames : groupNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$GroupsState {

 List<Group> get value;
/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupsStateCopyWith<GroupsState> get copyWith => _$GroupsStateCopyWithImpl<GroupsState>(this as GroupsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupsState&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'GroupsState(value: $value)';
}


}

/// @nodoc
abstract mixin class $GroupsStateCopyWith<$Res>  {
  factory $GroupsStateCopyWith(GroupsState value, $Res Function(GroupsState) _then) = _$GroupsStateCopyWithImpl;
@useResult
$Res call({
 List<Group> value
});




}
/// @nodoc
class _$GroupsStateCopyWithImpl<$Res>
    implements $GroupsStateCopyWith<$Res> {
  _$GroupsStateCopyWithImpl(this._self, this._then);

  final GroupsState _self;
  final $Res Function(GroupsState) _then;

/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as List<Group>,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupsState].
extension GroupsStatePatterns on GroupsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupsState value)  $default,){
final _that = this;
switch (_that) {
case _GroupsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupsState value)?  $default,){
final _that = this;
switch (_that) {
case _GroupsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Group> value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupsState() when $default != null:
return $default(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Group> value)  $default,) {final _that = this;
switch (_that) {
case _GroupsState():
return $default(_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Group> value)?  $default,) {final _that = this;
switch (_that) {
case _GroupsState() when $default != null:
return $default(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _GroupsState implements GroupsState {
  const _GroupsState({required final  List<Group> value}): _value = value;
  

 final  List<Group> _value;
@override List<Group> get value {
  if (_value is EqualUnmodifiableListView) return _value;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_value);
}


/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupsStateCopyWith<_GroupsState> get copyWith => __$GroupsStateCopyWithImpl<_GroupsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupsState&&const DeepCollectionEquality().equals(other._value, _value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_value));

@override
String toString() {
  return 'GroupsState(value: $value)';
}


}

/// @nodoc
abstract mixin class _$GroupsStateCopyWith<$Res> implements $GroupsStateCopyWith<$Res> {
  factory _$GroupsStateCopyWith(_GroupsState value, $Res Function(_GroupsState) _then) = __$GroupsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Group> value
});




}
/// @nodoc
class __$GroupsStateCopyWithImpl<$Res>
    implements _$GroupsStateCopyWith<$Res> {
  __$GroupsStateCopyWithImpl(this._self, this._then);

  final _GroupsState _self;
  final $Res Function(_GroupsState) _then;

/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_GroupsState(
value: null == value ? _self._value : value // ignore: cast_nullable_to_non_nullable
as List<Group>,
  ));
}


}

/// @nodoc
mixin _$NavigationItemsState {

 List<NavigationItem> get value;
/// Create a copy of NavigationItemsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationItemsStateCopyWith<NavigationItemsState> get copyWith => _$NavigationItemsStateCopyWithImpl<NavigationItemsState>(this as NavigationItemsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationItemsState&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'NavigationItemsState(value: $value)';
}


}

/// @nodoc
abstract mixin class $NavigationItemsStateCopyWith<$Res>  {
  factory $NavigationItemsStateCopyWith(NavigationItemsState value, $Res Function(NavigationItemsState) _then) = _$NavigationItemsStateCopyWithImpl;
@useResult
$Res call({
 List<NavigationItem> value
});




}
/// @nodoc
class _$NavigationItemsStateCopyWithImpl<$Res>
    implements $NavigationItemsStateCopyWith<$Res> {
  _$NavigationItemsStateCopyWithImpl(this._self, this._then);

  final NavigationItemsState _self;
  final $Res Function(NavigationItemsState) _then;

/// Create a copy of NavigationItemsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as List<NavigationItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [NavigationItemsState].
extension NavigationItemsStatePatterns on NavigationItemsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationItemsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationItemsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationItemsState value)  $default,){
final _that = this;
switch (_that) {
case _NavigationItemsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationItemsState value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationItemsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NavigationItem> value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigationItemsState() when $default != null:
return $default(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NavigationItem> value)  $default,) {final _that = this;
switch (_that) {
case _NavigationItemsState():
return $default(_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NavigationItem> value)?  $default,) {final _that = this;
switch (_that) {
case _NavigationItemsState() when $default != null:
return $default(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _NavigationItemsState implements NavigationItemsState {
  const _NavigationItemsState({required final  List<NavigationItem> value}): _value = value;
  

 final  List<NavigationItem> _value;
@override List<NavigationItem> get value {
  if (_value is EqualUnmodifiableListView) return _value;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_value);
}


/// Create a copy of NavigationItemsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationItemsStateCopyWith<_NavigationItemsState> get copyWith => __$NavigationItemsStateCopyWithImpl<_NavigationItemsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationItemsState&&const DeepCollectionEquality().equals(other._value, _value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_value));

@override
String toString() {
  return 'NavigationItemsState(value: $value)';
}


}

/// @nodoc
abstract mixin class _$NavigationItemsStateCopyWith<$Res> implements $NavigationItemsStateCopyWith<$Res> {
  factory _$NavigationItemsStateCopyWith(_NavigationItemsState value, $Res Function(_NavigationItemsState) _then) = __$NavigationItemsStateCopyWithImpl;
@override @useResult
$Res call({
 List<NavigationItem> value
});




}
/// @nodoc
class __$NavigationItemsStateCopyWithImpl<$Res>
    implements _$NavigationItemsStateCopyWith<$Res> {
  __$NavigationItemsStateCopyWithImpl(this._self, this._then);

  final _NavigationItemsState _self;
  final $Res Function(_NavigationItemsState) _then;

/// Create a copy of NavigationItemsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_NavigationItemsState(
value: null == value ? _self._value : value // ignore: cast_nullable_to_non_nullable
as List<NavigationItem>,
  ));
}


}

/// @nodoc
mixin _$ProxiesListSelectorState {

 List<String> get groupNames; Set<String> get currentUnfoldSet; ProxiesSortType get proxiesSortType; ProxyCardType get proxyCardType; num get sortNum; int get columns;
/// Create a copy of ProxiesListSelectorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProxiesListSelectorStateCopyWith<ProxiesListSelectorState> get copyWith => _$ProxiesListSelectorStateCopyWithImpl<ProxiesListSelectorState>(this as ProxiesListSelectorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProxiesListSelectorState&&const DeepCollectionEquality().equals(other.groupNames, groupNames)&&const DeepCollectionEquality().equals(other.currentUnfoldSet, currentUnfoldSet)&&(identical(other.proxiesSortType, proxiesSortType) || other.proxiesSortType == proxiesSortType)&&(identical(other.proxyCardType, proxyCardType) || other.proxyCardType == proxyCardType)&&(identical(other.sortNum, sortNum) || other.sortNum == sortNum)&&(identical(other.columns, columns) || other.columns == columns));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(groupNames),const DeepCollectionEquality().hash(currentUnfoldSet),proxiesSortType,proxyCardType,sortNum,columns);

@override
String toString() {
  return 'ProxiesListSelectorState(groupNames: $groupNames, currentUnfoldSet: $currentUnfoldSet, proxiesSortType: $proxiesSortType, proxyCardType: $proxyCardType, sortNum: $sortNum, columns: $columns)';
}


}

/// @nodoc
abstract mixin class $ProxiesListSelectorStateCopyWith<$Res>  {
  factory $ProxiesListSelectorStateCopyWith(ProxiesListSelectorState value, $Res Function(ProxiesListSelectorState) _then) = _$ProxiesListSelectorStateCopyWithImpl;
@useResult
$Res call({
 List<String> groupNames, Set<String> currentUnfoldSet, ProxiesSortType proxiesSortType, ProxyCardType proxyCardType, num sortNum, int columns
});




}
/// @nodoc
class _$ProxiesListSelectorStateCopyWithImpl<$Res>
    implements $ProxiesListSelectorStateCopyWith<$Res> {
  _$ProxiesListSelectorStateCopyWithImpl(this._self, this._then);

  final ProxiesListSelectorState _self;
  final $Res Function(ProxiesListSelectorState) _then;

/// Create a copy of ProxiesListSelectorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupNames = null,Object? currentUnfoldSet = null,Object? proxiesSortType = null,Object? proxyCardType = null,Object? sortNum = null,Object? columns = null,}) {
  return _then(_self.copyWith(
groupNames: null == groupNames ? _self.groupNames : groupNames // ignore: cast_nullable_to_non_nullable
as List<String>,currentUnfoldSet: null == currentUnfoldSet ? _self.currentUnfoldSet : currentUnfoldSet // ignore: cast_nullable_to_non_nullable
as Set<String>,proxiesSortType: null == proxiesSortType ? _self.proxiesSortType : proxiesSortType // ignore: cast_nullable_to_non_nullable
as ProxiesSortType,proxyCardType: null == proxyCardType ? _self.proxyCardType : proxyCardType // ignore: cast_nullable_to_non_nullable
as ProxyCardType,sortNum: null == sortNum ? _self.sortNum : sortNum // ignore: cast_nullable_to_non_nullable
as num,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProxiesListSelectorState].
extension ProxiesListSelectorStatePatterns on ProxiesListSelectorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProxiesListSelectorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProxiesListSelectorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProxiesListSelectorState value)  $default,){
final _that = this;
switch (_that) {
case _ProxiesListSelectorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProxiesListSelectorState value)?  $default,){
final _that = this;
switch (_that) {
case _ProxiesListSelectorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> groupNames,  Set<String> currentUnfoldSet,  ProxiesSortType proxiesSortType,  ProxyCardType proxyCardType,  num sortNum,  int columns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProxiesListSelectorState() when $default != null:
return $default(_that.groupNames,_that.currentUnfoldSet,_that.proxiesSortType,_that.proxyCardType,_that.sortNum,_that.columns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> groupNames,  Set<String> currentUnfoldSet,  ProxiesSortType proxiesSortType,  ProxyCardType proxyCardType,  num sortNum,  int columns)  $default,) {final _that = this;
switch (_that) {
case _ProxiesListSelectorState():
return $default(_that.groupNames,_that.currentUnfoldSet,_that.proxiesSortType,_that.proxyCardType,_that.sortNum,_that.columns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> groupNames,  Set<String> currentUnfoldSet,  ProxiesSortType proxiesSortType,  ProxyCardType proxyCardType,  num sortNum,  int columns)?  $default,) {final _that = this;
switch (_that) {
case _ProxiesListSelectorState() when $default != null:
return $default(_that.groupNames,_that.currentUnfoldSet,_that.proxiesSortType,_that.proxyCardType,_that.sortNum,_that.columns);case _:
  return null;

}
}

}

/// @nodoc


class _ProxiesListSelectorState implements ProxiesListSelectorState {
  const _ProxiesListSelectorState({required final  List<String> groupNames, required final  Set<String> currentUnfoldSet, required this.proxiesSortType, required this.proxyCardType, required this.sortNum, required this.columns}): _groupNames = groupNames,_currentUnfoldSet = currentUnfoldSet;
  

 final  List<String> _groupNames;
@override List<String> get groupNames {
  if (_groupNames is EqualUnmodifiableListView) return _groupNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groupNames);
}

 final  Set<String> _currentUnfoldSet;
@override Set<String> get currentUnfoldSet {
  if (_currentUnfoldSet is EqualUnmodifiableSetView) return _currentUnfoldSet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_currentUnfoldSet);
}

@override final  ProxiesSortType proxiesSortType;
@override final  ProxyCardType proxyCardType;
@override final  num sortNum;
@override final  int columns;

/// Create a copy of ProxiesListSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProxiesListSelectorStateCopyWith<_ProxiesListSelectorState> get copyWith => __$ProxiesListSelectorStateCopyWithImpl<_ProxiesListSelectorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProxiesListSelectorState&&const DeepCollectionEquality().equals(other._groupNames, _groupNames)&&const DeepCollectionEquality().equals(other._currentUnfoldSet, _currentUnfoldSet)&&(identical(other.proxiesSortType, proxiesSortType) || other.proxiesSortType == proxiesSortType)&&(identical(other.proxyCardType, proxyCardType) || other.proxyCardType == proxyCardType)&&(identical(other.sortNum, sortNum) || other.sortNum == sortNum)&&(identical(other.columns, columns) || other.columns == columns));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_groupNames),const DeepCollectionEquality().hash(_currentUnfoldSet),proxiesSortType,proxyCardType,sortNum,columns);

@override
String toString() {
  return 'ProxiesListSelectorState(groupNames: $groupNames, currentUnfoldSet: $currentUnfoldSet, proxiesSortType: $proxiesSortType, proxyCardType: $proxyCardType, sortNum: $sortNum, columns: $columns)';
}


}

/// @nodoc
abstract mixin class _$ProxiesListSelectorStateCopyWith<$Res> implements $ProxiesListSelectorStateCopyWith<$Res> {
  factory _$ProxiesListSelectorStateCopyWith(_ProxiesListSelectorState value, $Res Function(_ProxiesListSelectorState) _then) = __$ProxiesListSelectorStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> groupNames, Set<String> currentUnfoldSet, ProxiesSortType proxiesSortType, ProxyCardType proxyCardType, num sortNum, int columns
});




}
/// @nodoc
class __$ProxiesListSelectorStateCopyWithImpl<$Res>
    implements _$ProxiesListSelectorStateCopyWith<$Res> {
  __$ProxiesListSelectorStateCopyWithImpl(this._self, this._then);

  final _ProxiesListSelectorState _self;
  final $Res Function(_ProxiesListSelectorState) _then;

/// Create a copy of ProxiesListSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupNames = null,Object? currentUnfoldSet = null,Object? proxiesSortType = null,Object? proxyCardType = null,Object? sortNum = null,Object? columns = null,}) {
  return _then(_ProxiesListSelectorState(
groupNames: null == groupNames ? _self._groupNames : groupNames // ignore: cast_nullable_to_non_nullable
as List<String>,currentUnfoldSet: null == currentUnfoldSet ? _self._currentUnfoldSet : currentUnfoldSet // ignore: cast_nullable_to_non_nullable
as Set<String>,proxiesSortType: null == proxiesSortType ? _self.proxiesSortType : proxiesSortType // ignore: cast_nullable_to_non_nullable
as ProxiesSortType,proxyCardType: null == proxyCardType ? _self.proxyCardType : proxyCardType // ignore: cast_nullable_to_non_nullable
as ProxyCardType,sortNum: null == sortNum ? _self.sortNum : sortNum // ignore: cast_nullable_to_non_nullable
as num,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ProxyGroupSelectorState {

 String? get testUrl; ProxiesSortType get proxiesSortType; ProxyCardType get proxyCardType; num get sortNum; GroupType get groupType; List<Proxy> get proxies; int get columns;
/// Create a copy of ProxyGroupSelectorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProxyGroupSelectorStateCopyWith<ProxyGroupSelectorState> get copyWith => _$ProxyGroupSelectorStateCopyWithImpl<ProxyGroupSelectorState>(this as ProxyGroupSelectorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProxyGroupSelectorState&&(identical(other.testUrl, testUrl) || other.testUrl == testUrl)&&(identical(other.proxiesSortType, proxiesSortType) || other.proxiesSortType == proxiesSortType)&&(identical(other.proxyCardType, proxyCardType) || other.proxyCardType == proxyCardType)&&(identical(other.sortNum, sortNum) || other.sortNum == sortNum)&&(identical(other.groupType, groupType) || other.groupType == groupType)&&const DeepCollectionEquality().equals(other.proxies, proxies)&&(identical(other.columns, columns) || other.columns == columns));
}


@override
int get hashCode => Object.hash(runtimeType,testUrl,proxiesSortType,proxyCardType,sortNum,groupType,const DeepCollectionEquality().hash(proxies),columns);

@override
String toString() {
  return 'ProxyGroupSelectorState(testUrl: $testUrl, proxiesSortType: $proxiesSortType, proxyCardType: $proxyCardType, sortNum: $sortNum, groupType: $groupType, proxies: $proxies, columns: $columns)';
}


}

/// @nodoc
abstract mixin class $ProxyGroupSelectorStateCopyWith<$Res>  {
  factory $ProxyGroupSelectorStateCopyWith(ProxyGroupSelectorState value, $Res Function(ProxyGroupSelectorState) _then) = _$ProxyGroupSelectorStateCopyWithImpl;
@useResult
$Res call({
 String? testUrl, ProxiesSortType proxiesSortType, ProxyCardType proxyCardType, num sortNum, GroupType groupType, List<Proxy> proxies, int columns
});




}
/// @nodoc
class _$ProxyGroupSelectorStateCopyWithImpl<$Res>
    implements $ProxyGroupSelectorStateCopyWith<$Res> {
  _$ProxyGroupSelectorStateCopyWithImpl(this._self, this._then);

  final ProxyGroupSelectorState _self;
  final $Res Function(ProxyGroupSelectorState) _then;

/// Create a copy of ProxyGroupSelectorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? testUrl = freezed,Object? proxiesSortType = null,Object? proxyCardType = null,Object? sortNum = null,Object? groupType = null,Object? proxies = null,Object? columns = null,}) {
  return _then(_self.copyWith(
testUrl: freezed == testUrl ? _self.testUrl : testUrl // ignore: cast_nullable_to_non_nullable
as String?,proxiesSortType: null == proxiesSortType ? _self.proxiesSortType : proxiesSortType // ignore: cast_nullable_to_non_nullable
as ProxiesSortType,proxyCardType: null == proxyCardType ? _self.proxyCardType : proxyCardType // ignore: cast_nullable_to_non_nullable
as ProxyCardType,sortNum: null == sortNum ? _self.sortNum : sortNum // ignore: cast_nullable_to_non_nullable
as num,groupType: null == groupType ? _self.groupType : groupType // ignore: cast_nullable_to_non_nullable
as GroupType,proxies: null == proxies ? _self.proxies : proxies // ignore: cast_nullable_to_non_nullable
as List<Proxy>,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProxyGroupSelectorState].
extension ProxyGroupSelectorStatePatterns on ProxyGroupSelectorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProxyGroupSelectorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProxyGroupSelectorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProxyGroupSelectorState value)  $default,){
final _that = this;
switch (_that) {
case _ProxyGroupSelectorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProxyGroupSelectorState value)?  $default,){
final _that = this;
switch (_that) {
case _ProxyGroupSelectorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? testUrl,  ProxiesSortType proxiesSortType,  ProxyCardType proxyCardType,  num sortNum,  GroupType groupType,  List<Proxy> proxies,  int columns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProxyGroupSelectorState() when $default != null:
return $default(_that.testUrl,_that.proxiesSortType,_that.proxyCardType,_that.sortNum,_that.groupType,_that.proxies,_that.columns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? testUrl,  ProxiesSortType proxiesSortType,  ProxyCardType proxyCardType,  num sortNum,  GroupType groupType,  List<Proxy> proxies,  int columns)  $default,) {final _that = this;
switch (_that) {
case _ProxyGroupSelectorState():
return $default(_that.testUrl,_that.proxiesSortType,_that.proxyCardType,_that.sortNum,_that.groupType,_that.proxies,_that.columns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? testUrl,  ProxiesSortType proxiesSortType,  ProxyCardType proxyCardType,  num sortNum,  GroupType groupType,  List<Proxy> proxies,  int columns)?  $default,) {final _that = this;
switch (_that) {
case _ProxyGroupSelectorState() when $default != null:
return $default(_that.testUrl,_that.proxiesSortType,_that.proxyCardType,_that.sortNum,_that.groupType,_that.proxies,_that.columns);case _:
  return null;

}
}

}

/// @nodoc


class _ProxyGroupSelectorState implements ProxyGroupSelectorState {
  const _ProxyGroupSelectorState({required this.testUrl, required this.proxiesSortType, required this.proxyCardType, required this.sortNum, required this.groupType, required final  List<Proxy> proxies, required this.columns}): _proxies = proxies;
  

@override final  String? testUrl;
@override final  ProxiesSortType proxiesSortType;
@override final  ProxyCardType proxyCardType;
@override final  num sortNum;
@override final  GroupType groupType;
 final  List<Proxy> _proxies;
@override List<Proxy> get proxies {
  if (_proxies is EqualUnmodifiableListView) return _proxies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_proxies);
}

@override final  int columns;

/// Create a copy of ProxyGroupSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProxyGroupSelectorStateCopyWith<_ProxyGroupSelectorState> get copyWith => __$ProxyGroupSelectorStateCopyWithImpl<_ProxyGroupSelectorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProxyGroupSelectorState&&(identical(other.testUrl, testUrl) || other.testUrl == testUrl)&&(identical(other.proxiesSortType, proxiesSortType) || other.proxiesSortType == proxiesSortType)&&(identical(other.proxyCardType, proxyCardType) || other.proxyCardType == proxyCardType)&&(identical(other.sortNum, sortNum) || other.sortNum == sortNum)&&(identical(other.groupType, groupType) || other.groupType == groupType)&&const DeepCollectionEquality().equals(other._proxies, _proxies)&&(identical(other.columns, columns) || other.columns == columns));
}


@override
int get hashCode => Object.hash(runtimeType,testUrl,proxiesSortType,proxyCardType,sortNum,groupType,const DeepCollectionEquality().hash(_proxies),columns);

@override
String toString() {
  return 'ProxyGroupSelectorState(testUrl: $testUrl, proxiesSortType: $proxiesSortType, proxyCardType: $proxyCardType, sortNum: $sortNum, groupType: $groupType, proxies: $proxies, columns: $columns)';
}


}

/// @nodoc
abstract mixin class _$ProxyGroupSelectorStateCopyWith<$Res> implements $ProxyGroupSelectorStateCopyWith<$Res> {
  factory _$ProxyGroupSelectorStateCopyWith(_ProxyGroupSelectorState value, $Res Function(_ProxyGroupSelectorState) _then) = __$ProxyGroupSelectorStateCopyWithImpl;
@override @useResult
$Res call({
 String? testUrl, ProxiesSortType proxiesSortType, ProxyCardType proxyCardType, num sortNum, GroupType groupType, List<Proxy> proxies, int columns
});




}
/// @nodoc
class __$ProxyGroupSelectorStateCopyWithImpl<$Res>
    implements _$ProxyGroupSelectorStateCopyWith<$Res> {
  __$ProxyGroupSelectorStateCopyWithImpl(this._self, this._then);

  final _ProxyGroupSelectorState _self;
  final $Res Function(_ProxyGroupSelectorState) _then;

/// Create a copy of ProxyGroupSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? testUrl = freezed,Object? proxiesSortType = null,Object? proxyCardType = null,Object? sortNum = null,Object? groupType = null,Object? proxies = null,Object? columns = null,}) {
  return _then(_ProxyGroupSelectorState(
testUrl: freezed == testUrl ? _self.testUrl : testUrl // ignore: cast_nullable_to_non_nullable
as String?,proxiesSortType: null == proxiesSortType ? _self.proxiesSortType : proxiesSortType // ignore: cast_nullable_to_non_nullable
as ProxiesSortType,proxyCardType: null == proxyCardType ? _self.proxyCardType : proxyCardType // ignore: cast_nullable_to_non_nullable
as ProxyCardType,sortNum: null == sortNum ? _self.sortNum : sortNum // ignore: cast_nullable_to_non_nullable
as num,groupType: null == groupType ? _self.groupType : groupType // ignore: cast_nullable_to_non_nullable
as GroupType,proxies: null == proxies ? _self._proxies : proxies // ignore: cast_nullable_to_non_nullable
as List<Proxy>,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$MoreToolsSelectorState {

 List<NavigationItem> get navigationItems;
/// Create a copy of MoreToolsSelectorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoreToolsSelectorStateCopyWith<MoreToolsSelectorState> get copyWith => _$MoreToolsSelectorStateCopyWithImpl<MoreToolsSelectorState>(this as MoreToolsSelectorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoreToolsSelectorState&&const DeepCollectionEquality().equals(other.navigationItems, navigationItems));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(navigationItems));

@override
String toString() {
  return 'MoreToolsSelectorState(navigationItems: $navigationItems)';
}


}

/// @nodoc
abstract mixin class $MoreToolsSelectorStateCopyWith<$Res>  {
  factory $MoreToolsSelectorStateCopyWith(MoreToolsSelectorState value, $Res Function(MoreToolsSelectorState) _then) = _$MoreToolsSelectorStateCopyWithImpl;
@useResult
$Res call({
 List<NavigationItem> navigationItems
});




}
/// @nodoc
class _$MoreToolsSelectorStateCopyWithImpl<$Res>
    implements $MoreToolsSelectorStateCopyWith<$Res> {
  _$MoreToolsSelectorStateCopyWithImpl(this._self, this._then);

  final MoreToolsSelectorState _self;
  final $Res Function(MoreToolsSelectorState) _then;

/// Create a copy of MoreToolsSelectorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? navigationItems = null,}) {
  return _then(_self.copyWith(
navigationItems: null == navigationItems ? _self.navigationItems : navigationItems // ignore: cast_nullable_to_non_nullable
as List<NavigationItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [MoreToolsSelectorState].
extension MoreToolsSelectorStatePatterns on MoreToolsSelectorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoreToolsSelectorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoreToolsSelectorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoreToolsSelectorState value)  $default,){
final _that = this;
switch (_that) {
case _MoreToolsSelectorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoreToolsSelectorState value)?  $default,){
final _that = this;
switch (_that) {
case _MoreToolsSelectorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NavigationItem> navigationItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoreToolsSelectorState() when $default != null:
return $default(_that.navigationItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NavigationItem> navigationItems)  $default,) {final _that = this;
switch (_that) {
case _MoreToolsSelectorState():
return $default(_that.navigationItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NavigationItem> navigationItems)?  $default,) {final _that = this;
switch (_that) {
case _MoreToolsSelectorState() when $default != null:
return $default(_that.navigationItems);case _:
  return null;

}
}

}

/// @nodoc


class _MoreToolsSelectorState implements MoreToolsSelectorState {
  const _MoreToolsSelectorState({required final  List<NavigationItem> navigationItems}): _navigationItems = navigationItems;
  

 final  List<NavigationItem> _navigationItems;
@override List<NavigationItem> get navigationItems {
  if (_navigationItems is EqualUnmodifiableListView) return _navigationItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_navigationItems);
}


/// Create a copy of MoreToolsSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoreToolsSelectorStateCopyWith<_MoreToolsSelectorState> get copyWith => __$MoreToolsSelectorStateCopyWithImpl<_MoreToolsSelectorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoreToolsSelectorState&&const DeepCollectionEquality().equals(other._navigationItems, _navigationItems));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_navigationItems));

@override
String toString() {
  return 'MoreToolsSelectorState(navigationItems: $navigationItems)';
}


}

/// @nodoc
abstract mixin class _$MoreToolsSelectorStateCopyWith<$Res> implements $MoreToolsSelectorStateCopyWith<$Res> {
  factory _$MoreToolsSelectorStateCopyWith(_MoreToolsSelectorState value, $Res Function(_MoreToolsSelectorState) _then) = __$MoreToolsSelectorStateCopyWithImpl;
@override @useResult
$Res call({
 List<NavigationItem> navigationItems
});




}
/// @nodoc
class __$MoreToolsSelectorStateCopyWithImpl<$Res>
    implements _$MoreToolsSelectorStateCopyWith<$Res> {
  __$MoreToolsSelectorStateCopyWithImpl(this._self, this._then);

  final _MoreToolsSelectorState _self;
  final $Res Function(_MoreToolsSelectorState) _then;

/// Create a copy of MoreToolsSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? navigationItems = null,}) {
  return _then(_MoreToolsSelectorState(
navigationItems: null == navigationItems ? _self._navigationItems : navigationItems // ignore: cast_nullable_to_non_nullable
as List<NavigationItem>,
  ));
}


}

/// @nodoc
mixin _$PackageListSelectorState {

 List<Package> get packages; AccessControl get accessControl;
/// Create a copy of PackageListSelectorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageListSelectorStateCopyWith<PackageListSelectorState> get copyWith => _$PackageListSelectorStateCopyWithImpl<PackageListSelectorState>(this as PackageListSelectorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageListSelectorState&&const DeepCollectionEquality().equals(other.packages, packages)&&(identical(other.accessControl, accessControl) || other.accessControl == accessControl));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(packages),accessControl);

@override
String toString() {
  return 'PackageListSelectorState(packages: $packages, accessControl: $accessControl)';
}


}

/// @nodoc
abstract mixin class $PackageListSelectorStateCopyWith<$Res>  {
  factory $PackageListSelectorStateCopyWith(PackageListSelectorState value, $Res Function(PackageListSelectorState) _then) = _$PackageListSelectorStateCopyWithImpl;
@useResult
$Res call({
 List<Package> packages, AccessControl accessControl
});


$AccessControlCopyWith<$Res> get accessControl;

}
/// @nodoc
class _$PackageListSelectorStateCopyWithImpl<$Res>
    implements $PackageListSelectorStateCopyWith<$Res> {
  _$PackageListSelectorStateCopyWithImpl(this._self, this._then);

  final PackageListSelectorState _self;
  final $Res Function(PackageListSelectorState) _then;

/// Create a copy of PackageListSelectorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packages = null,Object? accessControl = null,}) {
  return _then(_self.copyWith(
packages: null == packages ? _self.packages : packages // ignore: cast_nullable_to_non_nullable
as List<Package>,accessControl: null == accessControl ? _self.accessControl : accessControl // ignore: cast_nullable_to_non_nullable
as AccessControl,
  ));
}
/// Create a copy of PackageListSelectorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessControlCopyWith<$Res> get accessControl {
  
  return $AccessControlCopyWith<$Res>(_self.accessControl, (value) {
    return _then(_self.copyWith(accessControl: value));
  });
}
}


/// Adds pattern-matching-related methods to [PackageListSelectorState].
extension PackageListSelectorStatePatterns on PackageListSelectorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageListSelectorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageListSelectorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageListSelectorState value)  $default,){
final _that = this;
switch (_that) {
case _PackageListSelectorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageListSelectorState value)?  $default,){
final _that = this;
switch (_that) {
case _PackageListSelectorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Package> packages,  AccessControl accessControl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageListSelectorState() when $default != null:
return $default(_that.packages,_that.accessControl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Package> packages,  AccessControl accessControl)  $default,) {final _that = this;
switch (_that) {
case _PackageListSelectorState():
return $default(_that.packages,_that.accessControl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Package> packages,  AccessControl accessControl)?  $default,) {final _that = this;
switch (_that) {
case _PackageListSelectorState() when $default != null:
return $default(_that.packages,_that.accessControl);case _:
  return null;

}
}

}

/// @nodoc


class _PackageListSelectorState implements PackageListSelectorState {
  const _PackageListSelectorState({required final  List<Package> packages, required this.accessControl}): _packages = packages;
  

 final  List<Package> _packages;
@override List<Package> get packages {
  if (_packages is EqualUnmodifiableListView) return _packages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packages);
}

@override final  AccessControl accessControl;

/// Create a copy of PackageListSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageListSelectorStateCopyWith<_PackageListSelectorState> get copyWith => __$PackageListSelectorStateCopyWithImpl<_PackageListSelectorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageListSelectorState&&const DeepCollectionEquality().equals(other._packages, _packages)&&(identical(other.accessControl, accessControl) || other.accessControl == accessControl));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_packages),accessControl);

@override
String toString() {
  return 'PackageListSelectorState(packages: $packages, accessControl: $accessControl)';
}


}

/// @nodoc
abstract mixin class _$PackageListSelectorStateCopyWith<$Res> implements $PackageListSelectorStateCopyWith<$Res> {
  factory _$PackageListSelectorStateCopyWith(_PackageListSelectorState value, $Res Function(_PackageListSelectorState) _then) = __$PackageListSelectorStateCopyWithImpl;
@override @useResult
$Res call({
 List<Package> packages, AccessControl accessControl
});


@override $AccessControlCopyWith<$Res> get accessControl;

}
/// @nodoc
class __$PackageListSelectorStateCopyWithImpl<$Res>
    implements _$PackageListSelectorStateCopyWith<$Res> {
  __$PackageListSelectorStateCopyWithImpl(this._self, this._then);

  final _PackageListSelectorState _self;
  final $Res Function(_PackageListSelectorState) _then;

/// Create a copy of PackageListSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packages = null,Object? accessControl = null,}) {
  return _then(_PackageListSelectorState(
packages: null == packages ? _self._packages : packages // ignore: cast_nullable_to_non_nullable
as List<Package>,accessControl: null == accessControl ? _self.accessControl : accessControl // ignore: cast_nullable_to_non_nullable
as AccessControl,
  ));
}

/// Create a copy of PackageListSelectorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessControlCopyWith<$Res> get accessControl {
  
  return $AccessControlCopyWith<$Res>(_self.accessControl, (value) {
    return _then(_self.copyWith(accessControl: value));
  });
}
}

/// @nodoc
mixin _$ProxiesListHeaderSelectorState {

 double get offset; int get currentIndex;
/// Create a copy of ProxiesListHeaderSelectorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProxiesListHeaderSelectorStateCopyWith<ProxiesListHeaderSelectorState> get copyWith => _$ProxiesListHeaderSelectorStateCopyWithImpl<ProxiesListHeaderSelectorState>(this as ProxiesListHeaderSelectorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProxiesListHeaderSelectorState&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex));
}


@override
int get hashCode => Object.hash(runtimeType,offset,currentIndex);

@override
String toString() {
  return 'ProxiesListHeaderSelectorState(offset: $offset, currentIndex: $currentIndex)';
}


}

/// @nodoc
abstract mixin class $ProxiesListHeaderSelectorStateCopyWith<$Res>  {
  factory $ProxiesListHeaderSelectorStateCopyWith(ProxiesListHeaderSelectorState value, $Res Function(ProxiesListHeaderSelectorState) _then) = _$ProxiesListHeaderSelectorStateCopyWithImpl;
@useResult
$Res call({
 double offset, int currentIndex
});




}
/// @nodoc
class _$ProxiesListHeaderSelectorStateCopyWithImpl<$Res>
    implements $ProxiesListHeaderSelectorStateCopyWith<$Res> {
  _$ProxiesListHeaderSelectorStateCopyWithImpl(this._self, this._then);

  final ProxiesListHeaderSelectorState _self;
  final $Res Function(ProxiesListHeaderSelectorState) _then;

/// Create a copy of ProxiesListHeaderSelectorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offset = null,Object? currentIndex = null,}) {
  return _then(_self.copyWith(
offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as double,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProxiesListHeaderSelectorState].
extension ProxiesListHeaderSelectorStatePatterns on ProxiesListHeaderSelectorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProxiesListHeaderSelectorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProxiesListHeaderSelectorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProxiesListHeaderSelectorState value)  $default,){
final _that = this;
switch (_that) {
case _ProxiesListHeaderSelectorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProxiesListHeaderSelectorState value)?  $default,){
final _that = this;
switch (_that) {
case _ProxiesListHeaderSelectorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double offset,  int currentIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProxiesListHeaderSelectorState() when $default != null:
return $default(_that.offset,_that.currentIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double offset,  int currentIndex)  $default,) {final _that = this;
switch (_that) {
case _ProxiesListHeaderSelectorState():
return $default(_that.offset,_that.currentIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double offset,  int currentIndex)?  $default,) {final _that = this;
switch (_that) {
case _ProxiesListHeaderSelectorState() when $default != null:
return $default(_that.offset,_that.currentIndex);case _:
  return null;

}
}

}

/// @nodoc


class _ProxiesListHeaderSelectorState implements ProxiesListHeaderSelectorState {
  const _ProxiesListHeaderSelectorState({required this.offset, required this.currentIndex});
  

@override final  double offset;
@override final  int currentIndex;

/// Create a copy of ProxiesListHeaderSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProxiesListHeaderSelectorStateCopyWith<_ProxiesListHeaderSelectorState> get copyWith => __$ProxiesListHeaderSelectorStateCopyWithImpl<_ProxiesListHeaderSelectorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProxiesListHeaderSelectorState&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex));
}


@override
int get hashCode => Object.hash(runtimeType,offset,currentIndex);

@override
String toString() {
  return 'ProxiesListHeaderSelectorState(offset: $offset, currentIndex: $currentIndex)';
}


}

/// @nodoc
abstract mixin class _$ProxiesListHeaderSelectorStateCopyWith<$Res> implements $ProxiesListHeaderSelectorStateCopyWith<$Res> {
  factory _$ProxiesListHeaderSelectorStateCopyWith(_ProxiesListHeaderSelectorState value, $Res Function(_ProxiesListHeaderSelectorState) _then) = __$ProxiesListHeaderSelectorStateCopyWithImpl;
@override @useResult
$Res call({
 double offset, int currentIndex
});




}
/// @nodoc
class __$ProxiesListHeaderSelectorStateCopyWithImpl<$Res>
    implements _$ProxiesListHeaderSelectorStateCopyWith<$Res> {
  __$ProxiesListHeaderSelectorStateCopyWithImpl(this._self, this._then);

  final _ProxiesListHeaderSelectorState _self;
  final $Res Function(_ProxiesListHeaderSelectorState) _then;

/// Create a copy of ProxiesListHeaderSelectorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offset = null,Object? currentIndex = null,}) {
  return _then(_ProxiesListHeaderSelectorState(
offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as double,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ProxiesActionsState {

 PageLabel get pageLabel; ProxiesType get type; bool get hasProviders;
/// Create a copy of ProxiesActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProxiesActionsStateCopyWith<ProxiesActionsState> get copyWith => _$ProxiesActionsStateCopyWithImpl<ProxiesActionsState>(this as ProxiesActionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProxiesActionsState&&(identical(other.pageLabel, pageLabel) || other.pageLabel == pageLabel)&&(identical(other.type, type) || other.type == type)&&(identical(other.hasProviders, hasProviders) || other.hasProviders == hasProviders));
}


@override
int get hashCode => Object.hash(runtimeType,pageLabel,type,hasProviders);

@override
String toString() {
  return 'ProxiesActionsState(pageLabel: $pageLabel, type: $type, hasProviders: $hasProviders)';
}


}

/// @nodoc
abstract mixin class $ProxiesActionsStateCopyWith<$Res>  {
  factory $ProxiesActionsStateCopyWith(ProxiesActionsState value, $Res Function(ProxiesActionsState) _then) = _$ProxiesActionsStateCopyWithImpl;
@useResult
$Res call({
 PageLabel pageLabel, ProxiesType type, bool hasProviders
});




}
/// @nodoc
class _$ProxiesActionsStateCopyWithImpl<$Res>
    implements $ProxiesActionsStateCopyWith<$Res> {
  _$ProxiesActionsStateCopyWithImpl(this._self, this._then);

  final ProxiesActionsState _self;
  final $Res Function(ProxiesActionsState) _then;

/// Create a copy of ProxiesActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageLabel = null,Object? type = null,Object? hasProviders = null,}) {
  return _then(_self.copyWith(
pageLabel: null == pageLabel ? _self.pageLabel : pageLabel // ignore: cast_nullable_to_non_nullable
as PageLabel,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProxiesType,hasProviders: null == hasProviders ? _self.hasProviders : hasProviders // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProxiesActionsState].
extension ProxiesActionsStatePatterns on ProxiesActionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProxiesActionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProxiesActionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProxiesActionsState value)  $default,){
final _that = this;
switch (_that) {
case _ProxiesActionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProxiesActionsState value)?  $default,){
final _that = this;
switch (_that) {
case _ProxiesActionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageLabel pageLabel,  ProxiesType type,  bool hasProviders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProxiesActionsState() when $default != null:
return $default(_that.pageLabel,_that.type,_that.hasProviders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageLabel pageLabel,  ProxiesType type,  bool hasProviders)  $default,) {final _that = this;
switch (_that) {
case _ProxiesActionsState():
return $default(_that.pageLabel,_that.type,_that.hasProviders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageLabel pageLabel,  ProxiesType type,  bool hasProviders)?  $default,) {final _that = this;
switch (_that) {
case _ProxiesActionsState() when $default != null:
return $default(_that.pageLabel,_that.type,_that.hasProviders);case _:
  return null;

}
}

}

/// @nodoc


class _ProxiesActionsState implements ProxiesActionsState {
  const _ProxiesActionsState({required this.pageLabel, required this.type, required this.hasProviders});
  

@override final  PageLabel pageLabel;
@override final  ProxiesType type;
@override final  bool hasProviders;

/// Create a copy of ProxiesActionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProxiesActionsStateCopyWith<_ProxiesActionsState> get copyWith => __$ProxiesActionsStateCopyWithImpl<_ProxiesActionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProxiesActionsState&&(identical(other.pageLabel, pageLabel) || other.pageLabel == pageLabel)&&(identical(other.type, type) || other.type == type)&&(identical(other.hasProviders, hasProviders) || other.hasProviders == hasProviders));
}


@override
int get hashCode => Object.hash(runtimeType,pageLabel,type,hasProviders);

@override
String toString() {
  return 'ProxiesActionsState(pageLabel: $pageLabel, type: $type, hasProviders: $hasProviders)';
}


}

/// @nodoc
abstract mixin class _$ProxiesActionsStateCopyWith<$Res> implements $ProxiesActionsStateCopyWith<$Res> {
  factory _$ProxiesActionsStateCopyWith(_ProxiesActionsState value, $Res Function(_ProxiesActionsState) _then) = __$ProxiesActionsStateCopyWithImpl;
@override @useResult
$Res call({
 PageLabel pageLabel, ProxiesType type, bool hasProviders
});




}
/// @nodoc
class __$ProxiesActionsStateCopyWithImpl<$Res>
    implements _$ProxiesActionsStateCopyWith<$Res> {
  __$ProxiesActionsStateCopyWithImpl(this._self, this._then);

  final _ProxiesActionsState _self;
  final $Res Function(_ProxiesActionsState) _then;

/// Create a copy of ProxiesActionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageLabel = null,Object? type = null,Object? hasProviders = null,}) {
  return _then(_ProxiesActionsState(
pageLabel: null == pageLabel ? _self.pageLabel : pageLabel // ignore: cast_nullable_to_non_nullable
as PageLabel,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProxiesType,hasProviders: null == hasProviders ? _self.hasProviders : hasProviders // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ProxyState {

 bool get isStart; bool get systemProxy; List<String> get bassDomain; int get port;
/// Create a copy of ProxyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProxyStateCopyWith<ProxyState> get copyWith => _$ProxyStateCopyWithImpl<ProxyState>(this as ProxyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProxyState&&(identical(other.isStart, isStart) || other.isStart == isStart)&&(identical(other.systemProxy, systemProxy) || other.systemProxy == systemProxy)&&const DeepCollectionEquality().equals(other.bassDomain, bassDomain)&&(identical(other.port, port) || other.port == port));
}


@override
int get hashCode => Object.hash(runtimeType,isStart,systemProxy,const DeepCollectionEquality().hash(bassDomain),port);

@override
String toString() {
  return 'ProxyState(isStart: $isStart, systemProxy: $systemProxy, bassDomain: $bassDomain, port: $port)';
}


}

/// @nodoc
abstract mixin class $ProxyStateCopyWith<$Res>  {
  factory $ProxyStateCopyWith(ProxyState value, $Res Function(ProxyState) _then) = _$ProxyStateCopyWithImpl;
@useResult
$Res call({
 bool isStart, bool systemProxy, List<String> bassDomain, int port
});




}
/// @nodoc
class _$ProxyStateCopyWithImpl<$Res>
    implements $ProxyStateCopyWith<$Res> {
  _$ProxyStateCopyWithImpl(this._self, this._then);

  final ProxyState _self;
  final $Res Function(ProxyState) _then;

/// Create a copy of ProxyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isStart = null,Object? systemProxy = null,Object? bassDomain = null,Object? port = null,}) {
  return _then(_self.copyWith(
isStart: null == isStart ? _self.isStart : isStart // ignore: cast_nullable_to_non_nullable
as bool,systemProxy: null == systemProxy ? _self.systemProxy : systemProxy // ignore: cast_nullable_to_non_nullable
as bool,bassDomain: null == bassDomain ? _self.bassDomain : bassDomain // ignore: cast_nullable_to_non_nullable
as List<String>,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProxyState].
extension ProxyStatePatterns on ProxyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProxyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProxyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProxyState value)  $default,){
final _that = this;
switch (_that) {
case _ProxyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProxyState value)?  $default,){
final _that = this;
switch (_that) {
case _ProxyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isStart,  bool systemProxy,  List<String> bassDomain,  int port)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProxyState() when $default != null:
return $default(_that.isStart,_that.systemProxy,_that.bassDomain,_that.port);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isStart,  bool systemProxy,  List<String> bassDomain,  int port)  $default,) {final _that = this;
switch (_that) {
case _ProxyState():
return $default(_that.isStart,_that.systemProxy,_that.bassDomain,_that.port);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isStart,  bool systemProxy,  List<String> bassDomain,  int port)?  $default,) {final _that = this;
switch (_that) {
case _ProxyState() when $default != null:
return $default(_that.isStart,_that.systemProxy,_that.bassDomain,_that.port);case _:
  return null;

}
}

}

/// @nodoc


class _ProxyState implements ProxyState {
  const _ProxyState({required this.isStart, required this.systemProxy, required final  List<String> bassDomain, required this.port}): _bassDomain = bassDomain;
  

@override final  bool isStart;
@override final  bool systemProxy;
 final  List<String> _bassDomain;
@override List<String> get bassDomain {
  if (_bassDomain is EqualUnmodifiableListView) return _bassDomain;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bassDomain);
}

@override final  int port;

/// Create a copy of ProxyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProxyStateCopyWith<_ProxyState> get copyWith => __$ProxyStateCopyWithImpl<_ProxyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProxyState&&(identical(other.isStart, isStart) || other.isStart == isStart)&&(identical(other.systemProxy, systemProxy) || other.systemProxy == systemProxy)&&const DeepCollectionEquality().equals(other._bassDomain, _bassDomain)&&(identical(other.port, port) || other.port == port));
}


@override
int get hashCode => Object.hash(runtimeType,isStart,systemProxy,const DeepCollectionEquality().hash(_bassDomain),port);

@override
String toString() {
  return 'ProxyState(isStart: $isStart, systemProxy: $systemProxy, bassDomain: $bassDomain, port: $port)';
}


}

/// @nodoc
abstract mixin class _$ProxyStateCopyWith<$Res> implements $ProxyStateCopyWith<$Res> {
  factory _$ProxyStateCopyWith(_ProxyState value, $Res Function(_ProxyState) _then) = __$ProxyStateCopyWithImpl;
@override @useResult
$Res call({
 bool isStart, bool systemProxy, List<String> bassDomain, int port
});




}
/// @nodoc
class __$ProxyStateCopyWithImpl<$Res>
    implements _$ProxyStateCopyWith<$Res> {
  __$ProxyStateCopyWithImpl(this._self, this._then);

  final _ProxyState _self;
  final $Res Function(_ProxyState) _then;

/// Create a copy of ProxyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isStart = null,Object? systemProxy = null,Object? bassDomain = null,Object? port = null,}) {
  return _then(_ProxyState(
isStart: null == isStart ? _self.isStart : isStart // ignore: cast_nullable_to_non_nullable
as bool,systemProxy: null == systemProxy ? _self.systemProxy : systemProxy // ignore: cast_nullable_to_non_nullable
as bool,bassDomain: null == bassDomain ? _self._bassDomain : bassDomain // ignore: cast_nullable_to_non_nullable
as List<String>,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ClashConfigState {

 bool get overrideDns; ClashConfig get clashConfig;
/// Create a copy of ClashConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClashConfigStateCopyWith<ClashConfigState> get copyWith => _$ClashConfigStateCopyWithImpl<ClashConfigState>(this as ClashConfigState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClashConfigState&&(identical(other.overrideDns, overrideDns) || other.overrideDns == overrideDns)&&(identical(other.clashConfig, clashConfig) || other.clashConfig == clashConfig));
}


@override
int get hashCode => Object.hash(runtimeType,overrideDns,clashConfig);

@override
String toString() {
  return 'ClashConfigState(overrideDns: $overrideDns, clashConfig: $clashConfig)';
}


}

/// @nodoc
abstract mixin class $ClashConfigStateCopyWith<$Res>  {
  factory $ClashConfigStateCopyWith(ClashConfigState value, $Res Function(ClashConfigState) _then) = _$ClashConfigStateCopyWithImpl;
@useResult
$Res call({
 bool overrideDns, ClashConfig clashConfig
});


$ClashConfigCopyWith<$Res> get clashConfig;

}
/// @nodoc
class _$ClashConfigStateCopyWithImpl<$Res>
    implements $ClashConfigStateCopyWith<$Res> {
  _$ClashConfigStateCopyWithImpl(this._self, this._then);

  final ClashConfigState _self;
  final $Res Function(ClashConfigState) _then;

/// Create a copy of ClashConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? overrideDns = null,Object? clashConfig = null,}) {
  return _then(_self.copyWith(
overrideDns: null == overrideDns ? _self.overrideDns : overrideDns // ignore: cast_nullable_to_non_nullable
as bool,clashConfig: null == clashConfig ? _self.clashConfig : clashConfig // ignore: cast_nullable_to_non_nullable
as ClashConfig,
  ));
}
/// Create a copy of ClashConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClashConfigCopyWith<$Res> get clashConfig {
  
  return $ClashConfigCopyWith<$Res>(_self.clashConfig, (value) {
    return _then(_self.copyWith(clashConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClashConfigState].
extension ClashConfigStatePatterns on ClashConfigState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClashConfigState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClashConfigState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClashConfigState value)  $default,){
final _that = this;
switch (_that) {
case _ClashConfigState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClashConfigState value)?  $default,){
final _that = this;
switch (_that) {
case _ClashConfigState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool overrideDns,  ClashConfig clashConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClashConfigState() when $default != null:
return $default(_that.overrideDns,_that.clashConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool overrideDns,  ClashConfig clashConfig)  $default,) {final _that = this;
switch (_that) {
case _ClashConfigState():
return $default(_that.overrideDns,_that.clashConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool overrideDns,  ClashConfig clashConfig)?  $default,) {final _that = this;
switch (_that) {
case _ClashConfigState() when $default != null:
return $default(_that.overrideDns,_that.clashConfig);case _:
  return null;

}
}

}

/// @nodoc


class _ClashConfigState implements ClashConfigState {
  const _ClashConfigState({required this.overrideDns, required this.clashConfig});
  

@override final  bool overrideDns;
@override final  ClashConfig clashConfig;

/// Create a copy of ClashConfigState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClashConfigStateCopyWith<_ClashConfigState> get copyWith => __$ClashConfigStateCopyWithImpl<_ClashConfigState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClashConfigState&&(identical(other.overrideDns, overrideDns) || other.overrideDns == overrideDns)&&(identical(other.clashConfig, clashConfig) || other.clashConfig == clashConfig));
}


@override
int get hashCode => Object.hash(runtimeType,overrideDns,clashConfig);

@override
String toString() {
  return 'ClashConfigState(overrideDns: $overrideDns, clashConfig: $clashConfig)';
}


}

/// @nodoc
abstract mixin class _$ClashConfigStateCopyWith<$Res> implements $ClashConfigStateCopyWith<$Res> {
  factory _$ClashConfigStateCopyWith(_ClashConfigState value, $Res Function(_ClashConfigState) _then) = __$ClashConfigStateCopyWithImpl;
@override @useResult
$Res call({
 bool overrideDns, ClashConfig clashConfig
});


@override $ClashConfigCopyWith<$Res> get clashConfig;

}
/// @nodoc
class __$ClashConfigStateCopyWithImpl<$Res>
    implements _$ClashConfigStateCopyWith<$Res> {
  __$ClashConfigStateCopyWithImpl(this._self, this._then);

  final _ClashConfigState _self;
  final $Res Function(_ClashConfigState) _then;

/// Create a copy of ClashConfigState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? overrideDns = null,Object? clashConfig = null,}) {
  return _then(_ClashConfigState(
overrideDns: null == overrideDns ? _self.overrideDns : overrideDns // ignore: cast_nullable_to_non_nullable
as bool,clashConfig: null == clashConfig ? _self.clashConfig : clashConfig // ignore: cast_nullable_to_non_nullable
as ClashConfig,
  ));
}

/// Create a copy of ClashConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClashConfigCopyWith<$Res> get clashConfig {
  
  return $ClashConfigCopyWith<$Res>(_self.clashConfig, (value) {
    return _then(_self.copyWith(clashConfig: value));
  });
}
}

/// @nodoc
mixin _$DashboardState {

 List<DashboardWidget> get dashboardWidgets; double get viewWidth;
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateCopyWith<DashboardState> get copyWith => _$DashboardStateCopyWithImpl<DashboardState>(this as DashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState&&const DeepCollectionEquality().equals(other.dashboardWidgets, dashboardWidgets)&&(identical(other.viewWidth, viewWidth) || other.viewWidth == viewWidth));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(dashboardWidgets),viewWidth);

@override
String toString() {
  return 'DashboardState(dashboardWidgets: $dashboardWidgets, viewWidth: $viewWidth)';
}


}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res>  {
  factory $DashboardStateCopyWith(DashboardState value, $Res Function(DashboardState) _then) = _$DashboardStateCopyWithImpl;
@useResult
$Res call({
 List<DashboardWidget> dashboardWidgets, double viewWidth
});




}
/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dashboardWidgets = null,Object? viewWidth = null,}) {
  return _then(_self.copyWith(
dashboardWidgets: null == dashboardWidgets ? _self.dashboardWidgets : dashboardWidgets // ignore: cast_nullable_to_non_nullable
as List<DashboardWidget>,viewWidth: null == viewWidth ? _self.viewWidth : viewWidth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardState value)  $default,){
final _that = this;
switch (_that) {
case _DashboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DashboardWidget> dashboardWidgets,  double viewWidth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.dashboardWidgets,_that.viewWidth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DashboardWidget> dashboardWidgets,  double viewWidth)  $default,) {final _that = this;
switch (_that) {
case _DashboardState():
return $default(_that.dashboardWidgets,_that.viewWidth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DashboardWidget> dashboardWidgets,  double viewWidth)?  $default,) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.dashboardWidgets,_that.viewWidth);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardState implements DashboardState {
  const _DashboardState({required final  List<DashboardWidget> dashboardWidgets, required this.viewWidth}): _dashboardWidgets = dashboardWidgets;
  

 final  List<DashboardWidget> _dashboardWidgets;
@override List<DashboardWidget> get dashboardWidgets {
  if (_dashboardWidgets is EqualUnmodifiableListView) return _dashboardWidgets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dashboardWidgets);
}

@override final  double viewWidth;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStateCopyWith<_DashboardState> get copyWith => __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardState&&const DeepCollectionEquality().equals(other._dashboardWidgets, _dashboardWidgets)&&(identical(other.viewWidth, viewWidth) || other.viewWidth == viewWidth));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_dashboardWidgets),viewWidth);

@override
String toString() {
  return 'DashboardState(dashboardWidgets: $dashboardWidgets, viewWidth: $viewWidth)';
}


}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(_DashboardState value, $Res Function(_DashboardState) _then) = __$DashboardStateCopyWithImpl;
@override @useResult
$Res call({
 List<DashboardWidget> dashboardWidgets, double viewWidth
});




}
/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dashboardWidgets = null,Object? viewWidth = null,}) {
  return _then(_DashboardState(
dashboardWidgets: null == dashboardWidgets ? _self._dashboardWidgets : dashboardWidgets // ignore: cast_nullable_to_non_nullable
as List<DashboardWidget>,viewWidth: null == viewWidth ? _self.viewWidth : viewWidth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$ProxyCardState {

 String get proxyName; String? get testUrl;
/// Create a copy of ProxyCardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProxyCardStateCopyWith<ProxyCardState> get copyWith => _$ProxyCardStateCopyWithImpl<ProxyCardState>(this as ProxyCardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProxyCardState&&(identical(other.proxyName, proxyName) || other.proxyName == proxyName)&&(identical(other.testUrl, testUrl) || other.testUrl == testUrl));
}


@override
int get hashCode => Object.hash(runtimeType,proxyName,testUrl);

@override
String toString() {
  return 'ProxyCardState(proxyName: $proxyName, testUrl: $testUrl)';
}


}

/// @nodoc
abstract mixin class $ProxyCardStateCopyWith<$Res>  {
  factory $ProxyCardStateCopyWith(ProxyCardState value, $Res Function(ProxyCardState) _then) = _$ProxyCardStateCopyWithImpl;
@useResult
$Res call({
 String proxyName, String? testUrl
});




}
/// @nodoc
class _$ProxyCardStateCopyWithImpl<$Res>
    implements $ProxyCardStateCopyWith<$Res> {
  _$ProxyCardStateCopyWithImpl(this._self, this._then);

  final ProxyCardState _self;
  final $Res Function(ProxyCardState) _then;

/// Create a copy of ProxyCardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? proxyName = null,Object? testUrl = freezed,}) {
  return _then(_self.copyWith(
proxyName: null == proxyName ? _self.proxyName : proxyName // ignore: cast_nullable_to_non_nullable
as String,testUrl: freezed == testUrl ? _self.testUrl : testUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProxyCardState].
extension ProxyCardStatePatterns on ProxyCardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProxyCardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProxyCardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProxyCardState value)  $default,){
final _that = this;
switch (_that) {
case _ProxyCardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProxyCardState value)?  $default,){
final _that = this;
switch (_that) {
case _ProxyCardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String proxyName,  String? testUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProxyCardState() when $default != null:
return $default(_that.proxyName,_that.testUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String proxyName,  String? testUrl)  $default,) {final _that = this;
switch (_that) {
case _ProxyCardState():
return $default(_that.proxyName,_that.testUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String proxyName,  String? testUrl)?  $default,) {final _that = this;
switch (_that) {
case _ProxyCardState() when $default != null:
return $default(_that.proxyName,_that.testUrl);case _:
  return null;

}
}

}

/// @nodoc


class _ProxyCardState implements ProxyCardState {
  const _ProxyCardState({required this.proxyName, this.testUrl});
  

@override final  String proxyName;
@override final  String? testUrl;

/// Create a copy of ProxyCardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProxyCardStateCopyWith<_ProxyCardState> get copyWith => __$ProxyCardStateCopyWithImpl<_ProxyCardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProxyCardState&&(identical(other.proxyName, proxyName) || other.proxyName == proxyName)&&(identical(other.testUrl, testUrl) || other.testUrl == testUrl));
}


@override
int get hashCode => Object.hash(runtimeType,proxyName,testUrl);

@override
String toString() {
  return 'ProxyCardState(proxyName: $proxyName, testUrl: $testUrl)';
}


}

/// @nodoc
abstract mixin class _$ProxyCardStateCopyWith<$Res> implements $ProxyCardStateCopyWith<$Res> {
  factory _$ProxyCardStateCopyWith(_ProxyCardState value, $Res Function(_ProxyCardState) _then) = __$ProxyCardStateCopyWithImpl;
@override @useResult
$Res call({
 String proxyName, String? testUrl
});




}
/// @nodoc
class __$ProxyCardStateCopyWithImpl<$Res>
    implements _$ProxyCardStateCopyWith<$Res> {
  __$ProxyCardStateCopyWithImpl(this._self, this._then);

  final _ProxyCardState _self;
  final $Res Function(_ProxyCardState) _then;

/// Create a copy of ProxyCardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? proxyName = null,Object? testUrl = freezed,}) {
  return _then(_ProxyCardState(
proxyName: null == proxyName ? _self.proxyName : proxyName // ignore: cast_nullable_to_non_nullable
as String,testUrl: freezed == testUrl ? _self.testUrl : testUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$VpnState {

 TunStack get stack; VpnProps get vpnProps;
/// Create a copy of VpnState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VpnStateCopyWith<VpnState> get copyWith => _$VpnStateCopyWithImpl<VpnState>(this as VpnState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VpnState&&(identical(other.stack, stack) || other.stack == stack)&&(identical(other.vpnProps, vpnProps) || other.vpnProps == vpnProps));
}


@override
int get hashCode => Object.hash(runtimeType,stack,vpnProps);

@override
String toString() {
  return 'VpnState(stack: $stack, vpnProps: $vpnProps)';
}


}

/// @nodoc
abstract mixin class $VpnStateCopyWith<$Res>  {
  factory $VpnStateCopyWith(VpnState value, $Res Function(VpnState) _then) = _$VpnStateCopyWithImpl;
@useResult
$Res call({
 TunStack stack, VpnProps vpnProps
});


$VpnPropsCopyWith<$Res> get vpnProps;

}
/// @nodoc
class _$VpnStateCopyWithImpl<$Res>
    implements $VpnStateCopyWith<$Res> {
  _$VpnStateCopyWithImpl(this._self, this._then);

  final VpnState _self;
  final $Res Function(VpnState) _then;

/// Create a copy of VpnState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stack = null,Object? vpnProps = null,}) {
  return _then(_self.copyWith(
stack: null == stack ? _self.stack : stack // ignore: cast_nullable_to_non_nullable
as TunStack,vpnProps: null == vpnProps ? _self.vpnProps : vpnProps // ignore: cast_nullable_to_non_nullable
as VpnProps,
  ));
}
/// Create a copy of VpnState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VpnPropsCopyWith<$Res> get vpnProps {
  
  return $VpnPropsCopyWith<$Res>(_self.vpnProps, (value) {
    return _then(_self.copyWith(vpnProps: value));
  });
}
}


/// Adds pattern-matching-related methods to [VpnState].
extension VpnStatePatterns on VpnState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VpnState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VpnState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VpnState value)  $default,){
final _that = this;
switch (_that) {
case _VpnState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VpnState value)?  $default,){
final _that = this;
switch (_that) {
case _VpnState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TunStack stack,  VpnProps vpnProps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VpnState() when $default != null:
return $default(_that.stack,_that.vpnProps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TunStack stack,  VpnProps vpnProps)  $default,) {final _that = this;
switch (_that) {
case _VpnState():
return $default(_that.stack,_that.vpnProps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TunStack stack,  VpnProps vpnProps)?  $default,) {final _that = this;
switch (_that) {
case _VpnState() when $default != null:
return $default(_that.stack,_that.vpnProps);case _:
  return null;

}
}

}

/// @nodoc


class _VpnState implements VpnState {
  const _VpnState({required this.stack, required this.vpnProps});
  

@override final  TunStack stack;
@override final  VpnProps vpnProps;

/// Create a copy of VpnState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VpnStateCopyWith<_VpnState> get copyWith => __$VpnStateCopyWithImpl<_VpnState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VpnState&&(identical(other.stack, stack) || other.stack == stack)&&(identical(other.vpnProps, vpnProps) || other.vpnProps == vpnProps));
}


@override
int get hashCode => Object.hash(runtimeType,stack,vpnProps);

@override
String toString() {
  return 'VpnState(stack: $stack, vpnProps: $vpnProps)';
}


}

/// @nodoc
abstract mixin class _$VpnStateCopyWith<$Res> implements $VpnStateCopyWith<$Res> {
  factory _$VpnStateCopyWith(_VpnState value, $Res Function(_VpnState) _then) = __$VpnStateCopyWithImpl;
@override @useResult
$Res call({
 TunStack stack, VpnProps vpnProps
});


@override $VpnPropsCopyWith<$Res> get vpnProps;

}
/// @nodoc
class __$VpnStateCopyWithImpl<$Res>
    implements _$VpnStateCopyWith<$Res> {
  __$VpnStateCopyWithImpl(this._self, this._then);

  final _VpnState _self;
  final $Res Function(_VpnState) _then;

/// Create a copy of VpnState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stack = null,Object? vpnProps = null,}) {
  return _then(_VpnState(
stack: null == stack ? _self.stack : stack // ignore: cast_nullable_to_non_nullable
as TunStack,vpnProps: null == vpnProps ? _self.vpnProps : vpnProps // ignore: cast_nullable_to_non_nullable
as VpnProps,
  ));
}

/// Create a copy of VpnState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VpnPropsCopyWith<$Res> get vpnProps {
  
  return $VpnPropsCopyWith<$Res>(_self.vpnProps, (value) {
    return _then(_self.copyWith(vpnProps: value));
  });
}
}

// dart format on
