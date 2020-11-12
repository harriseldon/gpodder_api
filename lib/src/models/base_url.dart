import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'base_url.g.dart';

@JsonSerializable(nullable: false)
class BaseUrl {
  @JsonKey(name: 'baseurl')
  final String baseUrl;

  BaseUrl({this.baseUrl});

  factory BaseUrl.fromJson(Map<String, dynamic> json) =>
      _$BaseUrlFromJson(json);

  Map<String, dynamic> toJson() => _$BaseUrlToJson(this);
}
