import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/auth_controller/register_controller.dart';
import 'package:key_secure_v2/main.dart';
import 'package:key_secure_v2/services/auth_services/register_services.dart';
import 'package:key_secure_v2/views/error_screens/server_down.dart';
import 'package:key_secure_v2/widgets/snack_bar.dart';

import '../../constants.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController(); //last click time

  @override
  Widget build(BuildContext context) {
    //importing register controller
    final registerController = Get.put(RegisterController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Obx(
            () => Form(
              key: _formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Image.asset(
                      "assets/logo/logo.png",
                      height: 80,
                      width: 80.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Text(
                        "Key Secure",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Text(
                      "Complete your details to continue",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.length <= 3) {
                        return "Name should be greater than 3 charecters";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "John Doe",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusColor: Colors.white,
                      prefixIcon: Icon(CupertinoIcons.person),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (!value!.contains(
                          RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))) {
                        return "Enter Valid Email";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "johndoe@gmail.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusColor: Colors.white,
                      prefixIcon: Icon(CupertinoIcons.mail),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: (registerController.isPasswordVisible.value)
                        ? false
                        : true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (!value!.contains(RegExp(
                          r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"))) {
                        return "Choose a stronger password";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "*************",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusColor: Colors.white,
                      prefixIcon: Icon(CupertinoIcons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          registerController.togglePassword();
                        },
                        icon: Icon((registerController.isPasswordVisible.value)
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText:
                        (registerController.isConfirmPasswordVisible.value)
                            ? false
                            : true,
                    validator: (value) {
                      if (_passwordController.text != value) {
                        return "Passwords are not matching";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "*************",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusColor: Colors.white,
                      prefixIcon: Icon(CupertinoIcons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          registerController.toggleConfirmPassword();
                        },
                        icon: Icon(
                            (registerController.isConfirmPasswordVisible.value)
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () {
                      var email = _emailController.text;
                      var name = _nameController.text;
                      var password = _passwordController.text;
                      var confirmPassword = _confirmPasswordController.text;
                      if (registerController.isButtonEnabled.value) {
                        if (_formKey.currentState!.validate()) {
                          _signUp(
                            name,
                            email,
                            password,
                            confirmPassword,
                            registerController,
                            context,
                          );
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          "${registerController.buttonText.value}",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      height: 50.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.poppins(),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/login');
                        },
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.poppins(
                            color: kMainColor,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_signUp(name, email, password, confirmPassword, controller, context) async {
  controller.setButtonText("Verifying...");
  controller.toggleButton(false);
  var response = await RegisterServices().registerUser(name, email, password);
  if (response.statusCode == 200) {
    box.write("email", email);
    controller.toggleButton(true);
    controller.setButtonText("Account Created");
    Get.offAllNamed(
      '/mail-sent',
      arguments: {
        "type": "mail confirmation",
        "button": "Try again with proper mail",
        "nextRoute": "/master",
        "sentRoute": "/register"
      },
    );
  } else if (response.statusCode == 400) {
    errorSnack("${response.body["message"]}", context);
    controller.toggleButton(true);
    controller.setButtonText("Sign Up");
  } else if (response.statusCode == 500) {
    errorSnack("Internal Server Error", context);
    controller.toggleButton(true);
    controller.setButtonText("Sign Up");
  } else {
    Get.off(ServerDown());
  }
}
