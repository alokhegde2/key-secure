import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/views/auth/on_board.dart';

class Login extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                TextFormField(
                  controller: _passwordController,
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
                      icon: Icon(CupertinoIcons.eye),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                InkWell(
                  onTap: () {},
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
