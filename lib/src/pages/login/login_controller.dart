import "dart:convert";

import "package:flutter/material.dart";
import "package:pruebas/src/models/user.dart";
import "package:pruebas/src/provider/users_provider.dart";
import "package:pruebas/src/utils/my_snackbar.dart";
import "package:pruebas/src/utils/shared_pref.dart";

class LoginController {
  BuildContext? context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  UsersProvider userProvider = UsersProvider();
  SharedPref _sharedPref = new SharedPref();

  Future? init(BuildContext context) async {
    this.context = context;
    await userProvider.init(context);

    User user = User.fromJson(await _sharedPref.read('user') ?? {});

    if (user!.sessionToken != null) {
      if (user.roles.length > 1) {
        print("Usuario logueado: ${user.toJson()}");
        Navigator.pushNamedAndRemoveUntil(context!, 'roles', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, user.roles[0].route, (route) => false);
      }
    }
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, "register");
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    Map<String, dynamic> login = await userProvider.login(email, password);

    if (login['status'] == 401) {
      MySnackbar.show(context, login['data']);
    } else if (login['status'] == 200) {
      User user = User.fromJson(login['data']);
      _sharedPref.save("user", user.toJson());
      if (user.roles.length > 1) {
        print("Usuario logueado: ${user.toJson()}");
        Navigator.pushNamedAndRemoveUntil(context!, 'roles', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context!, user.roles[0].route, (route) => false);
      }
    }
  }
}
