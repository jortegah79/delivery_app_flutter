import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:pruebas/src/pages/login/login_controller.dart';
import 'package:pruebas/src/utils/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: -80,
            left: -100,
            child: _circleLogin(),
          ),
          Positioned(
            top: 60,
            left: 22,
            child: _textLogin(),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                _lottieAnimation(),
                _textfieldEmail(),
                _textfieldPassword(),
                _buttonIngresar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _textPregunta(),
                    SizedBox(width: 7),
                    _textRegistrate()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(
          top: 150, bottom: MediaQuery.of(context).size.height * 0.22),
      child: Image.asset('assets/img/delivery.png', width: 200, height: 200),
    );
  }

  Widget _textfieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
          controller: _con.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Correo electrónico",
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(Icons.email, color: MyColors.primaryColor),
          )),
    );
  }

  Widget _textfieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
          obscureText: true,
          controller: _con.passwordController,
          decoration: InputDecoration(
            hintText: "Contraseña",
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(Icons.lock, color: MyColors.primaryColor),
          )),
    );
  }

  Widget _buttonIngresar() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
          onPressed: () {
            _con.login();
          },
          child: Text("INGRESAR"),
          style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ))),
    );
  }

  Widget _textPregunta() {
    return Text(
      "¿No tienes cuenta?",
      style: TextStyle(color: MyColors.primaryColor),
    );
  }

  Widget _textRegistrate() {
    return GestureDetector(
      onTap: () {
        _con.goToRegisterPage();
      },
      child: Text(
        "Registrate",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: MyColors.primaryColor),
      ),
    );
  }

  Widget _circleLogin() {
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor),
    );
  }

  Widget _textLogin() {
    return Text(
      "LOGIN",
      style: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22),
    );
  }

  Widget _lottieAnimation() {
    return Container(
      margin: EdgeInsets.only(
          top: 190, bottom: MediaQuery.of(context).size.height * 0.10),
      child:
          Lottie.asset('assets/json/delivery2.json', width: 300, height: 200),
    );
  }
}
