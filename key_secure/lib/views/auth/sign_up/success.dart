import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/views/home_page.dart';

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0, top: 70),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Success",
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Log in to to continue",
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color(0xFFE0E0E0).withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80.0,
              ),
              Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    color: Color(0xFF12E17F),
                    borderRadius: BorderRadius.circular(100.0)),
                child: Icon(
                  Icons.check,
                  size: 100.0,
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              InkWell(
                onTap: () {
                  Get.to(HomePage());
                },
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
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  height: 50.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
