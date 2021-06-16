import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/main.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      message: "Press back again to close",
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding:
                EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0, top: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        color: Colors.grey,
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
                    color: Color(0xFFFE504F),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
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
                    box.remove("email");
                    Get.offAllNamed('/login',
                        arguments: {"preRoute": "/success"});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                      // border: Border.all(
                      //   width: 3.0,
                      //   color: kSecondaryColor,
                      // ),
                    ),
                    child: Center(
                      child: Text(
                        "Log In",
                        style: GoogleFonts.ubuntu(
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
      ),
    );
  }
}
