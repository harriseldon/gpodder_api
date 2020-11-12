// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientConfig _$ClientConfigFromJson(Map<String, dynamic> json) {
  return ClientConfig(
    api: BaseUrl.fromJson(json['mygpo'] as Map<String, dynamic>),
    feedService:
        BaseUrl.fromJson(json['mygpo-feedservice'] as Map<String, dynamic>),
    updateTimeout: json['update-timeout'] as int,
  );
}

Map<String, dynamic> _$ClientConfigToJson(ClientConfig instance) =>
    <String, dynamic>{
      'mygpo': instance.api,
      'mygpo-feedservice': instance.feedService,
      'update-timeout': instance.updateTimeout,
    };
