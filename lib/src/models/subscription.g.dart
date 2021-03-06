// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return Subscription(
    url: json['url'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    subscribers: json['subscribers'] as int,
    subscribersLastWeek: json['subscribers_last_week'] as int,
    logoUrl: json['logo_url'] as String,
    scaledLogoUrl: json['scaled_logo_url'] as String,
    website: json['website'] as String,
    mygpoLink: json['mygpo_link'] as String,
    released: json['released'] == null
        ? null
        : DateTime.parse(json['released'] as String),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'description': instance.description,
      'subscribers': instance.subscribers,
      'subscribers_last_week': instance.subscribersLastWeek,
      'logo_url': instance.logoUrl,
      'scaled_logo_url': instance.scaledLogoUrl,
      'website': instance.website,
      'mygpo_link': instance.mygpoLink,
      'released': instance.released?.toIso8601String(),
      'status': instance.status,
    };
