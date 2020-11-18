import 'package:gpodder_api/src/models/client_config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ClientConfigService {
  final String _configurationUrl = "https://gpodder.net/clientconfig.json";

  ClientConfig _config;

  ClientConfig get config => _config;
  Future configIsFetched;

  ClientConfigService() {
    this.configIsFetched = _fetchConfig();
  }

  Future _fetchConfig() async {
    final response = await http.get(_configurationUrl);

    if (response.statusCode == 200) {
      this._config = ClientConfig.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          "error retrieving client config from ${response.reasonPhrase}");
    }
  }
}
