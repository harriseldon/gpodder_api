import 'dart:convert';

import 'package:gpodder_api/src/models/client_config.dart';
import 'package:gpodder_api/src/models/subscription.dart';
import 'package:gpodder_api/src/models/tag.dart';
import 'package:http/http.dart' as http;
import 'package:gpodder_api/src/util/http_helpers.dart';

class DirectoryService {
  final String _tagsApiPath = "/api/2/tags/";
  final String _singleTagApiPath = "/api/2/tag/";
  final String _topListApiPath = "/toplist/";
  final String _podcastApiPath = "/api/2/data/podcast.json";
  final String _episodeApiPath = "/api/2/data/episode.json";

  final ClientConfig config;

  DirectoryService({this.config});

  Future<List<Tag>> getTopTags(int count) async {
    final response = await http.get(
        this.config.api.baseUrl + _tagsApiPath + count.toString() + ".json");

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Tag>((json) => Tag.fromJson(json)).toList();
    } else {
      throw Exception("Error Retrieving Tags");
    }
  }

  Future<List<Subscription>> getPodcastsByTag(int count, Tag tag) async {
    final response = await http.get(this.config.api.baseUrl +
        _singleTagApiPath +
        tag.tag +
        "/" +
        count.toString() +
        ".json");

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<Subscription>((json) => Subscription.fromJson(json))
          .toList();
    } else {
      throw Exception("Error Retrieving Podcasts for tag ${tag.title}");
    }
  }

  Future<List<Subscription>> getTopList(int count) async {
    final response = await http.get(
        this.config.api.baseUrl + _topListApiPath + count.toString() + ".json");

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<Subscription>((json) => Subscription.fromJson(json))
          .toList();
    } else {
      throw Exception("Error Retrieving Top Podcasts");
    }
  }

  Future<Subscription> getPodcastDetails(String podcastUrl) async {
    final response = await http.get(this.config.api.baseUrl +
        _podcastApiPath +
        HttpHelpers.encodeParameters({"url": podcastUrl}));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return Subscription.fromJson(parsed);
    } else {
      throw Exception("Error Retrieving Podcast");
    }
  }

  Future<Subscription> getEpisodeDetails(
      String podcastUrl, String episodeUrl) async {
    final response = await http.get(this.config.api.baseUrl +
        _episodeApiPath +
        HttpHelpers.encodeParameters(
            {"podcast": podcastUrl, "url": episodeUrl}));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return Subscription.fromJson(parsed);
    } else {
      throw Exception("Error Retrieving Podcast");
    }
  }

  Future<List<Subscription>> findPodcast(String searchString) async {
    final response = await http.get(this.config.api.baseUrl +
        "search.json" +
        HttpHelpers.encodeParameters({"q": searchString}));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<Subscription>((json) => Subscription.fromJson(json))
          .toList();
    } else {
      throw Exception("Error Retrieving Top Podcasts");
    }
  }
}
