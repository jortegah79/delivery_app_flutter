import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pruebas/src/models/rol.dart';
import 'package:pruebas/src/pages/roles/roles_controller.dart';

class RolesPages extends StatefulWidget {
  const RolesPages({super.key});

  @override
  State<RolesPages> createState() => _RolesPagesState();
}

class _RolesPagesState extends State<RolesPages> {
  RolesController _con = RolesController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context,refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecciona un rol"),
      ),
      body: Container(
        margin:EdgeInsets.only(top:MediaQuery.of(context).size.height*.05),
        child: ListView(
        
          children: _con.user != null
              ? _con.user!.roles.map((Rol rol) {
                  return _cardRol(rol,_con,context);
                }).toList()
              : [],            
        ),
      ),
    );
  }
  void refresh(){
    setState((){});
  }
}

Widget _cardRol(Rol rol,_con,BuildContext context) {
  var imagen;
  if (rol.image != "") {
    imagen = NetworkImage(rol.image);
  } else {
    imagen = AssetImage('assets/img/no-image.png');
  }
  return Container(
      margin:EdgeInsets.symmetric(vertical: 20),
    child: GestureDetector(
      onTap: (){
        _con.goToPage(rol.route);
      },
      child: Column(
          children: [
            Container(
              height: 150,
              width: 150,  
              margin:EdgeInsets.only(bottom: 10),            
              child: FadeInImage(
                image: imagen,
                fit: BoxFit.contain,
                fadeInDuration: Duration(milliseconds: 50),
                placeholder: AssetImage('assets/img/no-image.png'),
              ),
            ),
            Text(
              rol.name ?? "",
              style: TextStyle(fontSize: 16, color: Colors.black),
            )
          ],    
      ),
    ),
  );
  
  
}
