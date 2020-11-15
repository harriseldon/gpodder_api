import 'dart:core';

import 'package:gpodder_api/src/models/subscription.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_updates.g.dart';

@JsonSerializable(nullable: false)
class DeviceUpdates {
  @JsonKey(name: 'add')
  final List<Subscription> addedSubscriptions;

  @JsonKey(name: 'updates')
  final List<Subscription> updatedSubscriptions;

  @JsonKey(name: 'remove')
  final List<String> removedFeeds;

  @JsonKey(name: 'timestamp')
  final int internalTimestamp;

  DeviceUpdates(
      {this.addedSubscriptions,
      this.updatedSubscriptions,
      this.removedFeeds,
      this.internalTimestamp});

  factory DeviceUpdates.fromJson(Map<String, dynamic> json) =>
      _$DeviceUpdatesFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceUpdatesToJson(this);
}
