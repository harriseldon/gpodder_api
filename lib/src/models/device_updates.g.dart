// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_updates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceUpdates _$DeviceUpdatesFromJson(Map<String, dynamic> json) {
  return DeviceUpdates(
    addedSubscriptions: (json['add'] as List)
        .map((e) => Subscription.fromJson(e as Map<String, dynamic>))
        .toList(),
    updatedSubscriptions: (json['updates'] as List)
        .map((e) => Subscription.fromJson(e as Map<String, dynamic>))
        .toList(),
    removedFeeds: (json['remove'] as List).map((e) => e as String).toList(),
    internalTimestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$DeviceUpdatesToJson(DeviceUpdates instance) =>
    <String, dynamic>{
      'add': instance.addedSubscriptions,
      'updates': instance.updatedSubscriptions,
      'remove': instance.removedFeeds,
      'timestamp': instance.internalTimestamp,
    };
