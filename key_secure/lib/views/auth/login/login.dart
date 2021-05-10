import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/controllers/auth_controller.dart';
import 'package:key_secure/services/remote_servces.dart';
import 'package:key_secure/views/auth/login/master_pass.dart';
import 'package:key_secure/views/auth/on_board.dart';
import 'package:key_secure/views/home_page.dart';
import 'package:key_secure/widgets/error.dart';

import '../../../main.dart';

class Login extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: "logo1",
                  child: Image.asset(
                    "assets/logo/logo.png",
                    height: 80,
                    width: 80.0,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Welcome Back",
                  style: GoogleFonts.ubuntu(
                      fontSize: 32, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Sign In with your email and password",
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFE0E0E0).withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 70.0,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
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
                  height: 25.0,
                ),
                Obx(
                  () => TextFormField(
                    controller: _passwordController,
                    obscureText:
                        (authController.isPasswordVisible.value) ? false : true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusColor: Colors.white,
                      prefixIcon: Icon(CupertinoIcons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          (authController.isPasswordVisible.value)
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                        ),
                        onPressed: () {
                          authController.toggle();
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Obx(
                  () => Container(
                    child: (authController.isError.value)
                        ? ErrorMessage(error: authController.err.toString())
                        : null,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                InkWell(
                  onTap: () async {
                    if (_emailController.text.length == 0) {
                      authController.error();
                      authController.seterror("Fields should not be empty");
                    } else if (_passwordController.text.length == 0) {
                      authController.error();
                      authController.seterror("Fields should not be empty");
                    } else {
                      authController.noerror();
                      var email = _emailController.text;
                      var password = _passwordController.text;
                      var jwt =
                          await RemoteServices.attemptLogin(email, password);
                      if (jwt != null) {
                        box.write('jwt', jwt);
                        Get.to(HomePage());
                      } else {
                        authController.error();
                        authController
                            .seterror("Email and Password does not match");
                      }
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        "Continue",
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
                  height: 25.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password",
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
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
                        Get.to(OnBoard());
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          color: Color(0xFFFE504F),
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
    );
  }
}
