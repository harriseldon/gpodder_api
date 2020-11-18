import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gpodder_api/src/models/client_config.dart';
import 'package:gpodder_api/src/models/device.dart';
import 'package:gpodder_api/src/models/device_updates.dart';
import 'package:gpodder_api/src/models/gpodder_user.dart';
import 'package:gpodder_api/src/models/subscription.dart';
import 'package:gpodder_api/src/util/http_helpers.dart';
import 'package:http/http.dart' as http;

class SubscriptionService {
  final String _subscriptionsApiPath = "subscriptions/";
  final GpodderUser user;
  final ClientConfig config;

  SubscriptionService({this.user, this.config});

  Future<List<Subscription>> getDeviceSubscriptions(Device device) async {
    final response = await http.get(
        this.config.api.baseUrl +
            _subscriptionsApiPath +
            this.user.userId +
            "/" +
            device.id +
            ".json",
        headers: HttpHelpers.authHeader(this.user));

    if (response.statusCode == 200) {
      return compute(_parseSubscriptions, response.body);
    } else {
      throw Exception(
          "Unable to retrieve subscriptions for device ${device.caption} url: ${this.config.api.baseUrl + _subscriptionsApiPath + this.user.userId + '/' + device.id + '.json'} error: ${response.reasonPhrase}");
    }
  }

  Future<List<Subscription>> getAllSubscriptions() async {
    final response = await http.get(
        this.config.api.baseUrl +
            _subscriptionsApiPath +
            this.user.userId +
            ".json",
        headers: HttpHelpers.authHeader(this.user));

    if (response.statusCode == 200) {
      return compute(_parseSubscriptions, response.body);
    } else {
      throw Exception(
          "Unable to retrieve subscriptions for user ${this.user.userId}");
    }
  }

  Future<void> updateAllDeviceSubscriptions(
      Device device, List<Subscription> subscriptions) async {
    final response = await http.put(
        this.config.api.baseUrl +
            _subscriptionsApiPath +
            this.user.userId +
            "/" +
            device.id +
            ".txt",
        headers: HttpHelpers.authHeader(this.user),
        body: subscriptions.map<String>((sub) => sub.url).toList().join("\n"));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<Subscription>((json) => Subscription.fromJson(json))
          .toList();
    } else {
      throw Exception(
          "Unable to retrieve subscriptions for user ${this.user.userId}");
    }
  }

  Future<void> updateSubscriptionChanges(Device device,
      List<Subscription> additions, List<Subscription> subtractions) async {
    List<String> add = additions.map<String>((sub) => sub.url).toList();
    List<String> remove = subtractions.map<String>((sub) => sub.url).toList();

    Map<String, dynamic> payload = {"add": add, "remoove": remove};
    final response = await http.post(
        this.config.api.baseUrl +
            _subscriptionsApiPath +
            this.user.userId +
            "/" +
            device.id +
            ".json",
        headers: HttpHelpers.authHeader(this.user),
        body: jsonEncode(payload));

    if (response.statusCode == 200) {
      //TODO:PARSE REPSPONSE
      /* Example response
      {
      "timestamp": 1337,
      "update_urls":
      [
        [
        "http://feeds2.feedburner.com/LinuxOutlaws?format=xml", //old
        "http://feeds.feedburner.com/LinuxOutlaws" //new
        ],
        [
        "http://example.org/podcast.rss ",
        "http://example.org/podcast.rss"
        ]
      ]
    }
      
   */
    } else {
      throw Exception("Unable to update changes for device ${device.caption}");
    }
  }

  Future<DeviceUpdates> getSubscriptionChanges(
      Device device, int sinceTimestamp) async {
    final response = await http.get(
        this.config.api.baseUrl +
            _subscriptionsApiPath +
            this.user.userId +
            "/" +
            device.id +
            ".json?" +
            HttpHelpers.encodeParameters({"since": sinceTimestamp}),
        headers: HttpHelpers.authHeader(this.user));

    if (response.statusCode == 200) {
      return compute(_parseDeviceUpdates, response.body);
    } else {
      throw Exception("Unable to get updates for device ${device.caption}");
    }
  }

  List<Subscription> _parseSubscriptions(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Subscription>((json) => Subscription.fromJson(json))
        .toList();
  }

  DeviceUpdates _parseDeviceUpdates(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return DeviceUpdates.fromJson(parsed);
  }
}
