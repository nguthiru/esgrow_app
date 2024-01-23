import 'dart:convert';
import 'dart:io';

import '../models/account_details.dart';
import 'api_constants.dart';
import 'package:http/http.dart' as http;

Future<AccountDetails?> login(String username, String password) async {
  var url = Uri.parse(BASE_URL).replace(path: "/api/v1/users/login");

  var payload = {
    "username": username,
    "password": password,
  };

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: jsonEncode(payload));

  if (response.statusCode == HttpStatus.ok) {
    var json = jsonDecode(response.body);
    if (json["data"] != null && json["data"] != {}) {
      return AccountDetails.fromJson(json["data"]);
    }
  }
  return null;
}
