import 'package:gpodder_api/src/models/client_config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ClientConfigService {
  final String _configurationUrl = "http://gpodder.net/clientconfig.json";

  ClientConfig _config;

  ClientConfig get config => _config;

  ClientConfigService() {
    _fetchConfig();
  }

  Future<void> _fetchConfig() async {
    final response = await http.get(_configurationUrl);

    if (response.statusCode == 200) {
      _config = ClientConfig.fromJson(jsonDecode(response.body));
    }
  }
}
