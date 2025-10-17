import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/widget.freezed.dart';

@freezed
abstract class ActivateState with _$ActivateState {
  const factory ActivateState({
    required bool active,
  }) = _ActivateState;
}

@freezed
abstract class CommonMessage with _$CommonMessage {
  const factory CommonMessage({
    required String id,
    required String text,
    @Default(Duration(seconds: 3)) Duration duration,
  }) = _CommonMessage;
}

@freezed
abstract class CommonAppBarState with _$CommonAppBarState {
  const factory CommonAppBarState({
    @Default([]) List<Widget> actions,
    Function(String)? onSearch,
    @Default(false) bool searching,
  }) = _CommonAppBarState;
}
