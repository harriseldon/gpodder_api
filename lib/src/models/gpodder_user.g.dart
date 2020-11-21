// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpodder_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GpodderUser _$GpodderUserFromJson(Map<String, dynamic> json) {
  return GpodderUser(
    userId: json['userId'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$GpodderUserToJson(GpodderUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'password': instance.password,
    };
