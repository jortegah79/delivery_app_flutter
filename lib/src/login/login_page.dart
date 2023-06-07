import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Delivery App")),
      body: Stack(
        children: [
          Container(
            width:150,
            height:150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(45),
                  bottomLeft: Radius.circular(85),
                  bottomRight: Radius.circular(35)),
            
            color: Colors.pinkAccent,
            )
          ),
        Container(
          margin:EdgeInsets.only(top:60,left:60),
          child: Text("LOGIN")
        ),
        ],
      ),
    );
  }
}
