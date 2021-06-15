import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var _lastPressedAt; //last click time
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          //Re-timed after two clicks of more than 1 second
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Press again to exit the program",
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
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
