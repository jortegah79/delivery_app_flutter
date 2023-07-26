import "package:flutter/material.dart";
import "package:pruebas/src/utils/shared_pref.dart";

import "../../models/user.dart";

class RolesController {
  BuildContext? context;
  User? user;
  SharedPref sharedPref = SharedPref();
  Function? refresh;

  Future? init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await sharedPref.read('user'));
    refresh();
  }
  void goToPage( ruta){
Navigator.pushNamedAndRemoveUntil(context!, ruta, (route) => true);
  }
}
