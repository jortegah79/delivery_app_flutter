import 'package:flutter/material.dart';
import 'package:pruebas/src/login/login_page.dart';

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
      theme: ThemeData(primaryColor: Color.fromRGBO(155, 155, 155, 0.8)),
      initialRoute: 'login',
      routes: {
        "login":(context) => LoginPage()
      },
    );
  }
}