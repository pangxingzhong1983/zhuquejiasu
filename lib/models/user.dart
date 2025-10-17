import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'generated/user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? email;
  double? balance;
  @JsonKey(name: 'expiredAt')
  int? expiredAt;
  String? inviteCode;

  User({
    required this.id,
    required this.email,
    required this.balance,
    required this.expiredAt,
    required this.inviteCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
