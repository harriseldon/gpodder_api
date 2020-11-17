// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeAction _$EpisodeActionFromJson(Map<String, dynamic> json) {
  return EpisodeAction(
    podcastUrl: json['podcast'] as String,
    episodeUrl: json['episode'] as String,
    deviceId: json['device'] as String,
    action: json['action'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
    startedAtSeconds: json['started'] as int,
    currentPositionSeconds: json['position'] as int,
    totalSeconds: json['total'] as int,
  );
}

Map<String, dynamic> _$EpisodeActionToJson(EpisodeAction instance) =>
    <String, dynamic>{
      'podcast': instance.podcastUrl,
      'episode': instance.episodeUrl,
      'device': instance.deviceId,
      'action': instance.action,
      'timestamp': instance.timestamp.toIso8601String(),
      'started': instance.startedAtSeconds,
      'position': instance.currentPositionSeconds,
      'total': instance.totalSeconds,
    };

EpisodeActionResponse _$EpisodeActionResponseFromJson(
    Map<String, dynamic> json) {
  return EpisodeActionResponse(
    actions: (json['actions'] as List)
        .map((e) => EpisodeAction.fromJson(e as Map<String, dynamic>))
        .toList(),
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$EpisodeActionResponseToJson(
        EpisodeActionResponse instance) =>
    <String, dynamic>{
      'actions': instance.actions,
      'timestamp': instance.timestamp,
    };
