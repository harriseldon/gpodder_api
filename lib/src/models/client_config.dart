import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'base_url.dart';

part 'client_config.g.dart';

@JsonSerializable(nullable: false)
class ClientConfig {
  @JsonKey(name: 'mygpo')
  final BaseUrl api;

  @JsonKey(name: 'mygpo-feedservice')
  final BaseUrl feedService;

  @JsonKey(name: 'update-timeout')
  final int updateTimeout;

  ClientConfig({this.api, this.feedService, this.updateTimeout});

  factory ClientConfig.fromJson(Map<String, dynamic> json) =>
      _$ClientConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ClientConfigToJson(this);
}
