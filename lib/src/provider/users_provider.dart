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

      String data = convert.jsonEncode(response.body);
       
      return data;
    
  }
}
