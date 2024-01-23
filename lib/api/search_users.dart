import 'dart:convert';

import 'package:esgrow/api/api_constants.dart';
import 'package:esgrow/models/user_search.dart';
import 'package:http/http.dart' as http;

Future<List<UserSearchModel>> searchUsers(String name) async {
  var url = Uri.parse(BASE_URL)
      .replace(path: "/api/v1/users/search", queryParameters: {"name": name});

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    return (json["data"] as List)
        .map((e) => UserSearchModel.fromJson(e))
        .toList();
  } else {
    throw Exception("Error occurred");
  }
}
