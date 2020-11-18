import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gpodder_api/src/models/client_config.dart';
import 'package:gpodder_api/src/models/device.dart';
import 'package:gpodder_api/src/models/episode_action.dart';
import 'package:gpodder_api/src/models/gpodder_user.dart';
import 'package:gpodder_api/src/util/http_helpers.dart';

import 'package:http/http.dart' as http;

class EpisodeActionsService {
  final String _episodeApiPath = "api/2/episodes/";
  final GpodderUser user;
  final ClientConfig config;

  EpisodeActionsService({this.user, this.config});

  Future<void> uploadEpisodeActions(List<EpisodeAction> actions) async {
    final response = await http.post(
        this.config.api.baseUrl +
            this._episodeApiPath +
            this.user.userId +
            ".json",
        headers: HttpHelpers.authHeader(this.user),
        body: jsonEncode(actions));

    if (response.statusCode == 200) {
      //TODO: Add resposne
      /*

      {
          "timestamp": 1337,
          "update_urls": [
              ["http://feeds2.feedburner.com/LinuxOutlaws?format=xml",
              "http://feeds.feedburner.com/LinuxOutlaws"],
              ["http://example.org/episode.mp3 ",
              "http://example.org/episode.mp3"]
          ]
      }

      */
    } else {
      throw Exception("Unable to update episode actions");
    }
  }

  Future<EpisodeActionResponse> getEpisodeActions(String podcastUrl,
      Device device, int sinceTimestamp, bool aggregateResults) async {
    final response = await http.get(
      this.config.api.baseUrl +
          this._episodeApiPath +
          this.user.userId +
          ".json?" +
          HttpHelpers.encodeParameters({
            "since": sinceTimestamp,
            "device": device?.id,
            "aggregated": aggregateResults,
            "podcast": podcastUrl
          }),
      headers: HttpHelpers.authHeader(this.user),
    );

    if (response.statusCode == 200) {
      return EpisodeActionResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          "Unable to get episode actions for ${podcastUrl ?? 'all'} and device ${device?.caption ?? 'all'}");
    }
  }
}
