import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'tag.dart';

part 'tags.g.dart';

@JsonSerializable(nullable: false)
class Tags {
  final List<Tag> tags;

  Tags({this.tags});

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}
