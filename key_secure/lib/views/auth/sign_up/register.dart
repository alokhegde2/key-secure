import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/controllers/auth_controller.dart';
import 'package:key_secure/views/auth/sign_up/masterpin.dart';
import 'package:key_secure/views/static/terms_and_cond.dart';
import 'package:key_secure/widgets/error.dart';

class Register extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  // String error = "";

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
                  height: 30.0,
                ),
                Text(
                  "Register Account",
                  style: GoogleFonts.ubuntu(
                      fontSize: 32, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Complete your details to continue",
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFE0E0E0).withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "John Doe",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusColor: Colors.white,
                      prefixIcon: Icon(CupertinoIcons.person)),
                ),
                SizedBox(
                  height: 30.0,
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
                  height: 30.0,
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
                  height: 30.0,
                ),
                Obx(
                  () => TextFormField(
                    controller: _confirmpasswordController,
                    obscureText:
                        (authController.isPasswordVisible.value) ? false : true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
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
                  height: 20.0,
                ),
                Obx(
                  () => Container(
                    child: (authController.isError.value)
                        ? ErrorMessage(error: authController.err.toString())
                        : null,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    if (_nameController.text.length <= 3) {
                      authController.error();
                      authController
                          .seterror("Name should be greater than 3 charecters");
                    } else if (_nameController.text.isNum) {
                      authController.error();
                      authController
                          .seterror("Name should not contain numbers");
                    } else if (!_emailController.text.contains(
                        RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))) {
                      authController.error();
                      authController.seterror("Invalid Email");
                    } else if (!_passwordController.text.contains(RegExp(
                        r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"))) {
                      authController.error();
                      authController.seterror("Choose a stronger password");
                    } else if (_passwordController.text !=
                        _confirmpasswordController.text) {
                      authController.error();
                      authController.seterror("Passwords are not matching");
                    } else {
                      authController.noerror();
                      Get.to(MasterPin());
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF12E17F),
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
                Text(
                  "By continuing you confirm \n that you agree with our terms and condition",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(TermsAndConditons());
                  },
                  child: Text(
                    "Terms and Condition",
                    style: GoogleFonts.ubuntu(
                      color: Color(0xFFFE504F),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
