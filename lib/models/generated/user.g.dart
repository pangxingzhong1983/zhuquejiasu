// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num?)?.toInt(),
  email: json['email'] as String?,
  balance: (json['balance'] as num?)?.toDouble(),
  expiredAt: (json['expired_at'] as num?)?.toInt(),
  inviteCode: json['inviteCode'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'balance': instance.balance,
  'expired_at': instance.expiredAt,
  'inviteCode': instance.inviteCode,
};
