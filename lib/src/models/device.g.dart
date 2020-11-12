// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['id']);
  return Device(
    id: json['id'] as String,
    caption: json['caption'] as String,
    type: json['type'] as String,
    subscriptions: json['subscriptions'] as int,
  );
}

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'id': instance.id,
      'caption': instance.caption,
      'type': instance.type,
      'subscriptions': instance.subscriptions,
    };
