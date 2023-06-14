import "package:flutter/material.dart";

class RegisterController {
  BuildContext? context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPassControler = new TextEditingController();

  Future? init(BuildContext context) {
    this.context = context;
  }

  void registro() {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastname = lastnameController.text.trim();
    String phone = phoneController.text.trim();
    String pass = passwordController.text.trim();
    String pass2 = confirmPassControler.text.trim();

    print("email: $email");
    print("name: $name");
    print("lastname: $lastname");
    print("phone: $phone");
    print("pass: $pass");
    print("confirm: $pass2");
  }
}
