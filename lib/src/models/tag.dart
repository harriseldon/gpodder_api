import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable(nullable: false)
class Tag {
  final String title;
  final String tag;
  final String usage;

  Tag({this.title, this.tag, this.usage});

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}
