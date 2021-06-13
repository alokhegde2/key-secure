import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0, top: 70),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
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
                    Get.toNamed('/login');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 3.0,
                        color: Colors.grey.shade600,
                      ),
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
