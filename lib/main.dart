import 'package:flutter/material.dart';
import 'package:pruebas/src/pages/client/products/list/client_products_list_page.dart';
import 'package:pruebas/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:pruebas/src/pages/login/login_page.dart';
import 'package:pruebas/src/pages/register/register_page.dart';
import 'package:pruebas/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:pruebas/src/pages/roles/roles_page.dart';
import 'package:pruebas/src/utils/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title:'Delivery App Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        "login":(context) =>  LoginPage(),
        "register":(context) => RegisterPage(),
        "client/products/list":(context)=>  ClientProductListPage(),
        "restaurant/orders/list":(context)=>  RestaurantOrdersListPage(),
        "delivery/orders/list":(context)=>  DeliveryOrdersListPage(),
        "roles":(context)=> RolesPages(),
      },
      theme:ThemeData(
        primarySwatch:  Colors.red
      )
      
    );
  }
}