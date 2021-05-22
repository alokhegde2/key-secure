import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_web/controller/main_controller.dart';

import '../constants.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainController = Get.put(MainController());
    return Container(
      padding: EdgeInsets.only(
          left: defaultPadding, right: defaultPadding, top: 50.0, bottom: 50.0),
      color: bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              RichText(
                text: TextSpan(
                  text: "The secure way\nto store -- \n\t\t\t--passwords",
                  style: GoogleFonts.ubuntu(
                      color: secondaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 50.0,
                      letterSpacing: 2,
                      height: 1.5),
                ),
              ),
              SizedBox(height: 40.0),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: secondaryColor),
                      child: Center(
                        child: Row(
                          children: [
                             SvgPicture.asset(
                            "assets/svg/apple.svg",
                            height: 20.0,
                            width: 20,
                            // color: color: primaryColor,
                          ),
                            Text(
                              "Download",
                              style: GoogleFonts.poppins(color: primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 25.0),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Center(
                        child: Row(
                          children: [
                            Image.network(
                                "https://img-premium.flaticon.com/png/512/731/731985.png?token=exp=1621164213~hmac=09fb1225a9fe694233477d73e772db06",
                                width: 20.0,
                                height: 20.0,
                                color: primaryColor),
                            Text(
                              "Download",
                              style: GoogleFonts.poppins(color: primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 400.0,
            width: 600.0,
            // transform:  Matrix4.identity()..rotateZ(15 * 3.1415927 / 180),
            child: Image.asset(
              'assets/images/home.png',
            ),
          )
        ],
      ),
    );
  }
}
