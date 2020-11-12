// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    title: json['title'] as String,
    tag: json['tag'] as String,
    usage: json['usage'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'title': instance.title,
      'tag': instance.tag,
      'usage': instance.usage,
    };
