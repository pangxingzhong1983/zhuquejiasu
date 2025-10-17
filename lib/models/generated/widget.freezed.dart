// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivateState {

 bool get active;
/// Create a copy of ActivateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivateStateCopyWith<ActivateState> get copyWith => _$ActivateStateCopyWithImpl<ActivateState>(this as ActivateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivateState&&(identical(other.active, active) || other.active == active));
}


@override
int get hashCode => Object.hash(runtimeType,active);

@override
String toString() {
  return 'ActivateState(active: $active)';
}


}

/// @nodoc
abstract mixin class $ActivateStateCopyWith<$Res>  {
  factory $ActivateStateCopyWith(ActivateState value, $Res Function(ActivateState) _then) = _$ActivateStateCopyWithImpl;
@useResult
$Res call({
 bool active
});




}
/// @nodoc
class _$ActivateStateCopyWithImpl<$Res>
    implements $ActivateStateCopyWith<$Res> {
  _$ActivateStateCopyWithImpl(this._self, this._then);

  final ActivateState _self;
  final $Res Function(ActivateState) _then;

/// Create a copy of ActivateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = null,}) {
  return _then(_self.copyWith(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivateState].
extension ActivateStatePatterns on ActivateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivateState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivateState value)  $default,){
final _that = this;
switch (_that) {
case _ActivateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivateState value)?  $default,){
final _that = this;
switch (_that) {
case _ActivateState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivateState() when $default != null:
return $default(_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool active)  $default,) {final _that = this;
switch (_that) {
case _ActivateState():
return $default(_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool active)?  $default,) {final _that = this;
switch (_that) {
case _ActivateState() when $default != null:
return $default(_that.active);case _:
  return null;

}
}

}

/// @nodoc


class _ActivateState implements ActivateState {
  const _ActivateState({required this.active});
  

@override final  bool active;

/// Create a copy of ActivateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivateStateCopyWith<_ActivateState> get copyWith => __$ActivateStateCopyWithImpl<_ActivateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivateState&&(identical(other.active, active) || other.active == active));
}


@override
int get hashCode => Object.hash(runtimeType,active);

@override
String toString() {
  return 'ActivateState(active: $active)';
}


}

/// @nodoc
abstract mixin class _$ActivateStateCopyWith<$Res> implements $ActivateStateCopyWith<$Res> {
  factory _$ActivateStateCopyWith(_ActivateState value, $Res Function(_ActivateState) _then) = __$ActivateStateCopyWithImpl;
@override @useResult
$Res call({
 bool active
});




}
/// @nodoc
class __$ActivateStateCopyWithImpl<$Res>
    implements _$ActivateStateCopyWith<$Res> {
  __$ActivateStateCopyWithImpl(this._self, this._then);

  final _ActivateState _self;
  final $Res Function(_ActivateState) _then;

/// Create a copy of ActivateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = null,}) {
  return _then(_ActivateState(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$CommonMessage {

 String get id; String get text; Duration get duration;
/// Create a copy of CommonMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommonMessageCopyWith<CommonMessage> get copyWith => _$CommonMessageCopyWithImpl<CommonMessage>(this as CommonMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommonMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,duration);

@override
String toString() {
  return 'CommonMessage(id: $id, text: $text, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $CommonMessageCopyWith<$Res>  {
  factory $CommonMessageCopyWith(CommonMessage value, $Res Function(CommonMessage) _then) = _$CommonMessageCopyWithImpl;
@useResult
$Res call({
 String id, String text, Duration duration
});




}
/// @nodoc
class _$CommonMessageCopyWithImpl<$Res>
    implements $CommonMessageCopyWith<$Res> {
  _$CommonMessageCopyWithImpl(this._self, this._then);

  final CommonMessage _self;
  final $Res Function(CommonMessage) _then;

/// Create a copy of CommonMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? duration = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [CommonMessage].
extension CommonMessagePatterns on CommonMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommonMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommonMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommonMessage value)  $default,){
final _that = this;
switch (_that) {
case _CommonMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommonMessage value)?  $default,){
final _that = this;
switch (_that) {
case _CommonMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  Duration duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommonMessage() when $default != null:
return $default(_that.id,_that.text,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  Duration duration)  $default,) {final _that = this;
switch (_that) {
case _CommonMessage():
return $default(_that.id,_that.text,_that.duration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  Duration duration)?  $default,) {final _that = this;
switch (_that) {
case _CommonMessage() when $default != null:
return $default(_that.id,_that.text,_that.duration);case _:
  return null;

}
}

}

/// @nodoc


class _CommonMessage implements CommonMessage {
  const _CommonMessage({required this.id, required this.text, this.duration = const Duration(seconds: 3)});
  

@override final  String id;
@override final  String text;
@override@JsonKey() final  Duration duration;

/// Create a copy of CommonMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommonMessageCopyWith<_CommonMessage> get copyWith => __$CommonMessageCopyWithImpl<_CommonMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommonMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,duration);

@override
String toString() {
  return 'CommonMessage(id: $id, text: $text, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$CommonMessageCopyWith<$Res> implements $CommonMessageCopyWith<$Res> {
  factory _$CommonMessageCopyWith(_CommonMessage value, $Res Function(_CommonMessage) _then) = __$CommonMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, Duration duration
});




}
/// @nodoc
class __$CommonMessageCopyWithImpl<$Res>
    implements _$CommonMessageCopyWith<$Res> {
  __$CommonMessageCopyWithImpl(this._self, this._then);

  final _CommonMessage _self;
  final $Res Function(_CommonMessage) _then;

/// Create a copy of CommonMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? duration = null,}) {
  return _then(_CommonMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc
mixin _$CommonAppBarState {

 List<Widget> get actions;  Function(String)? get onSearch; bool get searching;
/// Create a copy of CommonAppBarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommonAppBarStateCopyWith<CommonAppBarState> get copyWith => _$CommonAppBarStateCopyWithImpl<CommonAppBarState>(this as CommonAppBarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommonAppBarState&&const DeepCollectionEquality().equals(other.actions, actions)&&(identical(other.onSearch, onSearch) || other.onSearch == onSearch)&&(identical(other.searching, searching) || other.searching == searching));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(actions),onSearch,searching);

@override
String toString() {
  return 'CommonAppBarState(actions: $actions, onSearch: $onSearch, searching: $searching)';
}


}

/// @nodoc
abstract mixin class $CommonAppBarStateCopyWith<$Res>  {
  factory $CommonAppBarStateCopyWith(CommonAppBarState value, $Res Function(CommonAppBarState) _then) = _$CommonAppBarStateCopyWithImpl;
@useResult
$Res call({
 List<Widget> actions,  Function(String)? onSearch, bool searching
});




}
/// @nodoc
class _$CommonAppBarStateCopyWithImpl<$Res>
    implements $CommonAppBarStateCopyWith<$Res> {
  _$CommonAppBarStateCopyWithImpl(this._self, this._then);

  final CommonAppBarState _self;
  final $Res Function(CommonAppBarState) _then;

/// Create a copy of CommonAppBarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? actions = null,Object? onSearch = freezed,Object? searching = null,}) {
  return _then(_self.copyWith(
actions: null == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as List<Widget>,onSearch: freezed == onSearch ? _self.onSearch : onSearch // ignore: cast_nullable_to_non_nullable
as  Function(String)?,searching: null == searching ? _self.searching : searching // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CommonAppBarState].
extension CommonAppBarStatePatterns on CommonAppBarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommonAppBarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommonAppBarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommonAppBarState value)  $default,){
final _that = this;
switch (_that) {
case _CommonAppBarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommonAppBarState value)?  $default,){
final _that = this;
switch (_that) {
case _CommonAppBarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Widget> actions,   Function(String)? onSearch,  bool searching)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommonAppBarState() when $default != null:
return $default(_that.actions,_that.onSearch,_that.searching);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Widget> actions,   Function(String)? onSearch,  bool searching)  $default,) {final _that = this;
switch (_that) {
case _CommonAppBarState():
return $default(_that.actions,_that.onSearch,_that.searching);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Widget> actions,   Function(String)? onSearch,  bool searching)?  $default,) {final _that = this;
switch (_that) {
case _CommonAppBarState() when $default != null:
return $default(_that.actions,_that.onSearch,_that.searching);case _:
  return null;

}
}

}

/// @nodoc


class _CommonAppBarState implements CommonAppBarState {
  const _CommonAppBarState({final  List<Widget> actions = const [], this.onSearch, this.searching = false}): _actions = actions;
  

 final  List<Widget> _actions;
@override@JsonKey() List<Widget> get actions {
  if (_actions is EqualUnmodifiableListView) return _actions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actions);
}

@override final   Function(String)? onSearch;
@override@JsonKey() final  bool searching;

/// Create a copy of CommonAppBarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommonAppBarStateCopyWith<_CommonAppBarState> get copyWith => __$CommonAppBarStateCopyWithImpl<_CommonAppBarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommonAppBarState&&const DeepCollectionEquality().equals(other._actions, _actions)&&(identical(other.onSearch, onSearch) || other.onSearch == onSearch)&&(identical(other.searching, searching) || other.searching == searching));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_actions),onSearch,searching);

@override
String toString() {
  return 'CommonAppBarState(actions: $actions, onSearch: $onSearch, searching: $searching)';
}


}

/// @nodoc
abstract mixin class _$CommonAppBarStateCopyWith<$Res> implements $CommonAppBarStateCopyWith<$Res> {
  factory _$CommonAppBarStateCopyWith(_CommonAppBarState value, $Res Function(_CommonAppBarState) _then) = __$CommonAppBarStateCopyWithImpl;
@override @useResult
$Res call({
 List<Widget> actions,  Function(String)? onSearch, bool searching
});




}
/// @nodoc
class __$CommonAppBarStateCopyWithImpl<$Res>
    implements _$CommonAppBarStateCopyWith<$Res> {
  __$CommonAppBarStateCopyWithImpl(this._self, this._then);

  final _CommonAppBarState _self;
  final $Res Function(_CommonAppBarState) _then;

/// Create a copy of CommonAppBarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? actions = null,Object? onSearch = freezed,Object? searching = null,}) {
  return _then(_CommonAppBarState(
actions: null == actions ? _self._actions : actions // ignore: cast_nullable_to_non_nullable
as List<Widget>,onSearch: freezed == onSearch ? _self.onSearch : onSearch // ignore: cast_nullable_to_non_nullable
as  Function(String)?,searching: null == searching ? _self.searching : searching // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
