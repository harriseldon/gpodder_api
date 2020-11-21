import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'gpodder_user.g.dart';

@JsonSerializable(nullable: false)
class GpodderUser {
  String userId;
  String password;

  GpodderUser({this.userId, this.password});

  factory GpodderUser.fromJson(Map<String, dynamic> json) =>
      _$GpodderUserFromJson(json);

  Map<String, dynamic> toJson() => _$GpodderUserToJson(this);
}
