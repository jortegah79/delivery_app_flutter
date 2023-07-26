import "package:flutter/material.dart";
import "package:pruebas/src/models/user.dart";
import "package:pruebas/src/utils/shared_pref.dart";

class ClientProductListController {
  
  BuildContext? context;
  final SharedPref _sharedPref=SharedPref();
  GlobalKey <ScaffoldState> key=GlobalKey<ScaffoldState>();

  User? user;
  Function? refresh;
  
  Future? init(BuildContext context,Function refresh) async{
    this.context = context;
    user=User.fromJson(await _sharedPref.read('user') );
    refresh(); 

  }

  void logout() {
    _sharedPref.logout(context!);
  }
  void openDrawer(){
    key.currentState?.openDrawer();
  }
  void goToRoles(BuildContext context ){
    Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
  }
}
