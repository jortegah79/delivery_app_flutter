import 'package:flutter/material.dart';
import 'package:pruebas/src/login/login_page.dart';
import 'package:pruebas/src/register/register_page.dart';
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
        "login":(context) => LoginPage(),
        "register":(context) =>RegisterPage()
      },
      theme:ThemeData(
        primarySwatch:  Colors.red
      )
      
    );
  }
}