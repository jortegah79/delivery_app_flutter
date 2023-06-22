import "package:flutter/material.dart";
import "package:pruebas/src/models/user.dart";
import "package:pruebas/src/provider/users_provider.dart";
import "package:pruebas/src/utils/my_snackbar.dart";

class RegisterController {
  BuildContext? context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPassControler = new TextEditingController();
  UsersProvider usersProvider = new UsersProvider();

  Future? init(BuildContext context) {
    this.context = context;
  }

  Future<void> create() async {
    String id = '0';
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastname = lastnameController.text.trim();
    String phone = phoneController.text.trim();
    String pass = passwordController.text.trim();
    String pass2 = confirmPassControler.text.trim();

    if (email.isEmpty ||
        name.isEmpty ||
        lastname.isEmpty ||
        phone.isEmpty ||
        pass.isEmpty ||
        pass2.isEmpty) {
      MySnackbar.show(context, "Debes ingresar todos los campos.");
      return;
    }
    if (pass != pass2) {
      MySnackbar.show(context, "Las contraseñas no coinciden");
      return;
    }
    if (pass.length < 6) {
      MySnackbar.show(
          context, "La contraseña tiene que tener al menos 6 carácteres.");
      return;
    }

    User user = User(
        id: "",
        name: name,
        lastname: lastname,
        email: email,
        phone: phone,
        password: pass,
        sessionToken: "",
        imagen: "");

    id = await usersProvider.create(user) ?? "0";
    print('El resultado es este: ${id}');
  }
}
