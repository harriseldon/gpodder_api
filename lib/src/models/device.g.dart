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

Map<String, dynamic> _$DeviceToJson(Device instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['caption'] = instance.caption;
  val['type'] = instance.type;
  val['subscriptions'] = instance.subscriptions;
  return val;
}
