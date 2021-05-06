import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/views/auth/on_board.dart';

class MainAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 80),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Hero(
                    tag: "logo1",
                    child: Image.asset(
                      "assets/logo/logo.png",
                      height: 150,
                      width: 150.0,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Manage your \n Passwords with ease",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "Keep your passwords safe \n with us",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color(0xFF747474),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(OnBoard(),transition: Transition.fadeIn);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF12E17F),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up with Email ID",
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
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          width: 3.0,
                          color: Color(0xFF12E17F),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Log In",
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
