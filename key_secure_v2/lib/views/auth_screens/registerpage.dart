import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/auth_controller/register_controller.dart';
import 'package:key_secure_v2/services/auth_services/register_services.dart';

import '../../constants.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //importing register controller
    final registerController = Get.put(RegisterController());

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "johndoe@gmail.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  focusColor: Colors.white,
                  prefixIcon: Icon(CupertinoIcons.mail)),
            ),
            SizedBox(
              height: 30.0,
            ),
            Obx(
              () => TextFormField(
                controller: _passwordController,
                obscureText:
                    (registerController.isPasswordVisible.value) ? false : true,
                keyboardType: TextInputType.visiblePassword,
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
            ),
            SizedBox(
              height: 30.0,
            ),
            Obx(() => TextFormField(
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText:
                      (registerController.isConfirmPasswordVisible.value)
                          ? false
                          : true,
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
                )),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                var email = _emailController.text;
                var name = _nameController.text;
                var password = _passwordController.text;
                var confirmPassword = _confirmPasswordController.text;
                // if (password != confirmPassword) {
                //   registerController.setError("Helllo");
                // }
                signUp(
                    name, email, password, confirmPassword, registerController);
                // Get.toNamed('/mail-sent', arguments: {
                //   "type": "mail confirmation",
                //   "button": "Try again with proper mail",
                //   "nextRoute": "/master",
                //   "sentRoute": "/register"
                // });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "Sign Up",
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
    ));
  }
}

signUp(name, email, password, confirmPassword, controller) async {
  if (name.length <= 3) {
    controller.setError("Name should be greater than 3 charecters");
  } else if (!email.contains(RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))) {
    controller.setError("Invalid Email");
  } else if (!password.contains(RegExp(
      r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"))) {
    controller.setError("Choose a stronger password");
  } else if (password != confirmPassword) {
    controller.setError("Passwords are not matching");
  } else{
    var res = await RegisterServices().registerUser(name,email,password);
    controller.setError("${res.body["message"]}");

  }
}
