import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pruebas/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:pruebas/src/utils/my_colors.dart';

class ClientProductListPage extends StatefulWidget {
  const ClientProductListPage({super.key});

  @override
  State<ClientProductListPage> createState() => _ClientProductListPageState();
}

class _ClientProductListPageState extends State<ClientProductListPage> {
  ClientProductListController _con = ClientProductListController();

  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context,refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      key: _con.key,
      appBar: AppBar(leading: _menuDrawer()),
      drawer: _drawer(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _con.logout();
            },
            child: Text('Cerrar sesión')),
      ),
    );
    
  }

  Widget _drawer() {
    dynamic imagen=_con.user?.imagen != null 
                    ?NetworkImage(_con.user!.imagen??" ")
                    :AssetImage('assets/img/no-image.png');
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyColors.primaryColor,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '${_con.user?.name ??""}  ${_con.user?.lastname??""}',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
              Text(
                '${_con.user?.email??""}',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                maxLines: 1,
              ),
              Text(
                '${_con.user?.phone??""}',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                maxLines: 1,
              ),
              Container(
                  height: 60,
                  margin: EdgeInsets.only(top: 10),
                  child: FadeInImage(
                    image: imagen,
                    fit: BoxFit.contain,
                    fadeInDuration: Duration(milliseconds: 50),
                    placeholder: AssetImage('assets/img/no-image.png'),
                  ))
            ]),
          ),
          ListTile(
            title: Text("Editar perfil"),
            trailing: Icon(Icons.edit_outlined),
          ),
          ListTile(
            title: Text("Mis pedidos"),
            trailing: Icon(Icons.shopping_cart_outlined),
          ),
          _con.user !=null ?
          _con.user!.roles.length > 1?
          ListTile(
            onTap: (){
              _con.goToRoles(context);
            },
            title: Text("Seleccionar rol"),
            trailing: Icon(Icons.person_outline),
          )
          :
          Container():Container(),
           ListTile(
            onTap: _con.logout,
              title: Text("Cerrar sesión"),
              trailing: Icon(Icons.power_settings_new),
            ),
          
        ],
      ),
    );
   
  }

  Widget _menuDrawer() {
    return GestureDetector(
      onTap: _con.openDrawer,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Image.asset('assets/img/menu.png',
            color: Colors.white, width: 20, height: 20),
      ),
    );
  }
   void refresh(){
      setState(() {});
    }
}
