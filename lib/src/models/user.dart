import 'dart:convert';

import 'package:pruebas/src/models/rol.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String id;
    String name;
    String lastname;
    String email;
    String phone;
    String password;
    String sessionToken;
    String? imagen;
    List<Rol> roles=[];

    User({
        required  this.id,
        required this.name,
        required this.lastname,
        required this.email,
        required this.phone,
        required this.password,
        required this.sessionToken,
        required this.imagen,
        required this.roles
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        sessionToken: json["session_token"],
        imagen: json["image"],
        roles:json['roles']==null?[]
        :List<Rol>.from(json['roles'].map((model)=>Rol.fromJson(model)))
    );

    Map<String, dynamic> toJson() => {
        "id": id="",
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "password": password,
        "session_token": sessionToken="",
        "imagen": imagen="",
        "roles":roles
    };
}
