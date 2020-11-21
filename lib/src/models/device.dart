import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

final typeRegex = RegExp("desktop|laptop|mobile|server|other");

@JsonSerializable(nullable: true)
class Device {
  @JsonKey(disallowNullValue: true)
  final String id;

  final String caption;

  final String type;

  final int subscriptions;

  Device({this.id, this.caption, this.type, this.subscriptions})
      : assert(type.contains(typeRegex));

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}
