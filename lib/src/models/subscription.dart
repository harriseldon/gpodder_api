import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'subscription.g.dart';

/*
{
        "url": "http://ubuntupodcast.org/feed/ogg",
        "title": "Ubuntu Podcast",
        "author": "show@ubuntupodcast.org (Alan Pope, Mark Johnson, Martin Wimpress)",
        "description": "Upbeat and family-friendly show including news, discussion, interviews and\nreviews from the Ubuntu, Linux and Open Source world.",
        "subscribers": 0,
        "subscribers_last_week": 0,
        "logo_url": "http://ubuntupodcast.org/wp-content/uploads/powerpress/uplogo_1400.png",
        "scaled_logo_url": "http://gpodder.net/logo/64/725/7258cdb18bc3ada1e82ea13af388079840cb6dd2",
        "website": "https://ubuntupodcast.org",
        "mygpo_link": "http://gpodder.net/podcast/ubuntu-podcast-ogg-7"
    }
  */

@JsonSerializable(nullable: false)
class Subscription {
  final String url;
  final String title;
  final String description;
  final int subscribers;
  @JsonKey(name: 'subscribers_last_week')
  final int subscribersLastWeek;
  @JsonKey(name: 'logo_url')
  final String logoUrl;
  @JsonKey(name: 'scaled_logo_url')
  final String scaledLogoUrl;
  final String website;
  @JsonKey(name: 'mygpoLink')
  final String mygpoLink;

  Subscription(
      {this.url,
      this.title,
      this.description,
      this.subscribers,
      this.subscribersLastWeek,
      this.logoUrl,
      this.scaledLogoUrl,
      this.website,
      this.mygpoLink});

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}
