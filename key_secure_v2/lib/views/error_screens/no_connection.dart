import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/network_controller.dart';
import 'package:key_secure_v2/controller/password_controller/password_controller.dart';
import 'package:key_secure_v2/controller/user_controller/user_controller.dart';

class NoConnection extends StatelessWidget {
  final controller;
  final fromRoute;
  NoConnection({required this.controller, required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final passwordController = Get.put(PasswordController());
    var networkController = Get.put(NetworkConnectivityController());

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: MediaQuery.of(context).size.height * 0.90,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/no_internet.svg",
            height: 150.0,
            width: MediaQuery.of(context).size.width * 0.70,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Oops ! No connection",
            style: GoogleFonts.poppins(
              fontSize: 23.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Hey,please connect to internet and retry",
            style: GoogleFonts.poppins(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () {
                networkController.onInit();
                switch (controller) {
                  case "userController":
                    userController.onInit();
                    break;
                  default:
                }
              },
              child: Container(
                height: 50.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: kMainColor, width: 2.0),
                ),
                child: Center(
                  child: Text(
                    "Retry",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
