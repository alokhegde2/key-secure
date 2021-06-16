import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.offAllNamed("/master-pass");
            },
            borderRadius: BorderRadius.circular(100.0),
            child: Container(
              height: 50.0,
              child: Center(
                child: Text(
                  "Key Secure",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // InkWell(
              //   onTap: () {},
              //   child: Container(
              //     height: 40.0,
              //     width: 40.0,
              //     decoration: BoxDecoration(
              //       color: kMainColor,
              //       borderRadius: BorderRadius.circular(20.0),
              //     ),
              //     child: Center(
              //       child: Icon(
              //         CupertinoIcons.add,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                width: 20.0,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed("/settings");
                },
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: CircleAvatar(
                    child: FlutterLogo(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
