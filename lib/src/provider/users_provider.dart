import "dart:convert" as convert;

import "package:http/http.dart" as http;
import "package:flutter/material.dart";
import "package:pruebas/src/api/environment.dart";

import "../models/user.dart";

class UsersProvider {
  String _url = Environment.API_DELIVERY;
  String _api = "/delivery/api/users";

  BuildContext? context;

  Future? init(BuildContext context) {
    this.context = context;
  }

  Future<String?> create(User user) async {
    Uri url = Uri.http(_url, '$_api/register');

    String bodyParams = convert.jsonEncode(user);
    Map<String, String> headers = {'Content-type': 'application/json'};

    dynamic response = await http.post(url, headers: headers, body: bodyParams);

    String data = response.body;

    return data;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    Uri url = Uri.http(_url, '$_api/login');

    String bodyParams =
        convert.jsonEncode({"email": email, "password": password});

    Map<String, String> headers = {'Content-type': 'application/json'};

    dynamic response = await http.post(url, headers: headers, body: bodyParams);

    if (response.statusCode == 200) {
      print(convert.jsonDecode(response.body));
      return {
        "status": response.statusCode,
        "data": convert.jsonDecode(response.body)
      
      };
    } else {
      return {"status": response.statusCode, "data": response.body};
    }
  }
}
