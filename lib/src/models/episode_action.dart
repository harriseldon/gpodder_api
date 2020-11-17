import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'episode_action.g.dart';

@JsonSerializable(nullable: false)
class EpisodeAction {
  @JsonKey(name: 'podcast')
  String podcastUrl;

  @JsonKey(name: 'episode')
  String episodeUrl;

  @JsonKey(name: 'device')
  String deviceId;

  String action;

  DateTime timestamp;

  //Only valid for “play”. the position (in seconds) at which the client started playback. Requires position and total to be set.
  @JsonKey(name: 'started')
  int startedAtSeconds;

  //Only valid for “play”. the position (in seconds) at which the client stopped playback
  @JsonKey(name: 'position')
  int currentPositionSeconds;

  //Only valid for “play”. the total length of the file in seconds. Requires position and started to be set.
  @JsonKey(name: 'total')
  int totalSeconds;

  EpisodeAction(
      {this.podcastUrl,
      this.episodeUrl,
      this.deviceId,
      this.action,
      this.timestamp,
      this.startedAtSeconds,
      this.currentPositionSeconds,
      this.totalSeconds})
      : assert(action.contains(new RegExp("download|delete|play|new|flattr")));

  factory EpisodeAction.fromJson(Map<String, dynamic> json) =>
      _$EpisodeActionFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeActionToJson(this);
}

@JsonSerializable(nullable: false)
class EpisodeActionResponse {
  final List<EpisodeAction> actions;

  final int timestamp;

  EpisodeActionResponse({this.actions, this.timestamp});

  factory EpisodeActionResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeActionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeActionResponseToJson(this);
}
