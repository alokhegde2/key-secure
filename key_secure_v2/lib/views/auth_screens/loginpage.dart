import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/auth_controller/login_controller.dart';
import 'package:key_secure_v2/main.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  //email controller get email of user
  final _emailController = TextEditingController();
  //password controller to get password from user
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return WillPopScope(
      onWillPop: () async {
        if (Get.arguments["preRoute"] == "/success") {
          var _lastPressedAt; //last click time
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            //Re-timed after two clicks of more than 1 second
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Press again to exit the program",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                backgroundColor: Colors.black,
              ),
            );
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        } else {
          return true;
        }
      },
      child: Scaffold(
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
                  "Sign In with your email and password",
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
                height: 40.0,
              ),
              Obx(
                () => TextFormField(
                  controller: _passwordController,
                  obscureText:
                      (loginController.isPasswordVisibile.value) ? false : true,
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
                        loginController.togglePassword();
                      },
                      icon: Icon((loginController.isPasswordVisibile.value)
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              InkWell(
                onTap: () {
                  // Get.toNamed('/master-pass');
                  print(box.read("email"));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      "Sign In",
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
                height: 40.0,
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('/forgot-pass');
                },
                child: Text(
                  "Forgot Password",
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont't have an account?",
                    style: GoogleFonts.poppins(),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/register');
                    },
                    child: Text(
                      "Sign Up",
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
      )),
    );
  }
}
