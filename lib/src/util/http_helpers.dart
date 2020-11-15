import 'dart:convert';
import 'dart:io';

import 'package:gpodder_api/src/models/gpodder_user.dart';

class HttpHelpers {
  static Map<String, String> authHeader(GpodderUser user) {
    return {
      HttpHeaders.authorizationHeader: "BASIC " +
          base64Encode(utf8.encode(user.userId + ":" + user.password))
    };
  }

  static String encodeParameters(Map<String, dynamic> parameters) {
    return parameters.keys
        .map((key) =>
            "${Uri.encodeComponent(key)}=${Uri.encodeComponent(parameters[key])}")
        .join("&");
  }
}
