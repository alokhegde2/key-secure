import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';

class MailSent extends StatelessWidget {
  MailSent({Key? key}) : super(key: key);
  final nextRoute = Get.arguments["nextRoute"];
  final title = Get.arguments["type"];
  final button = Get.arguments["button"];
  final sentRoute = Get.arguments["sentRoute"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 70.0,
                ),
                Center(
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    child: Image.asset('assets/images/icons/mail_sent.png'),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Check your mail",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  // padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "We have sent a $title",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  // padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "instructions to your email.",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed("$nextRoute");
                  },
                  child: Container(
                    height: 50.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Open mail app",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF4C596D),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Did not receive the email? Check your spam filter, or",
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed("$sentRoute");
                  },
                  child: Text(
                    "$button",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
