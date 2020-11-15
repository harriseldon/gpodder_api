import 'package:gpodder_api/src/models/client_config.dart';
import 'package:gpodder_api/src/models/device.dart';
import 'package:gpodder_api/src/models/device_updates.dart';
import 'package:gpodder_api/src/models/gpodder_user.dart';
import 'package:gpodder_api/src/util/http_helpers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeviceService {
  final String _deviceApiPath = "/api/2/devices/";
  final String _updateApiPath = "/api/2/updates/";

  final ClientConfig config;
  final GpodderUser user;
  DeviceService({this.config, this.user});

  Future<void> updateDevice(Device device) async {
    final response = await http.post(
        this.config.api.baseUrl +
            _deviceApiPath +
            this.user.userId +
            "/" +
            device.id +
            ".json",
        headers: HttpHelpers.authHeader(this.user),
        body: device.toJson());

    if (response.statusCode == 200) {
      //successfult

    }
  }

  Future<List<Device>> listDevices() async {
    final response = await http.get(
        this.config.api.baseUrl + _deviceApiPath + this.user.userId + ".json",
        headers: HttpHelpers.authHeader(this.user));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Device>((json) => Device.fromJson(json)).toList();
    } else {
      throw Exception("Error Retrieving Devices");
    }
  }

  Future<DeviceUpdates> getDeviceUpdates(
      Device device, int internalTimestamp, bool includeActions) async {
    final String parameters = HttpHelpers.encodeParameters({
      "since": internalTimestamp ?? 0,
      "include_actions": includeActions ?? false
    });
    final response = await http.get(
        this.config.api.baseUrl +
            _updateApiPath +
            this.user.userId +
            "/" +
            device.id +
            ".json?" +
            parameters,
        headers: HttpHelpers.authHeader(this.user));

    if (response.statusCode == 200) {
      return DeviceUpdates.fromJson(
          jsonDecode(response.body).cast<Map<String, dynamic>>());
    } else {
      throw Exception("Error getting device updates");
    }
  }
}
