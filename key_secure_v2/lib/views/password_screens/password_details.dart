import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';

class PasswordDetails extends StatelessWidget {
  final title = Get.parameters["title"].toString();
  final emailId = Get.parameters["emailId"].toString();
  final username = Get.parameters["username"].toString();
  final category = Get.parameters["category"].toString();
  final password = Get.parameters["password"].toString();
  final image = Get.parameters["image"].toString();
  final note = Get.parameters["note"].toString();
  final id = Get.parameters["id"].toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(
                  bottom: 150.0, left: 10.0, right: 10.0, top: 20.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: id,
                      child: Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: NetworkImage(image, scale: 1.0),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: Text(
                            title,
                            style: GoogleFonts.poppins(
                              fontSize: 21.0,
                              fontWeight: FontWeight.w700,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: Text(
                            username,
                            style: GoogleFonts.poppins(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star_border,
                        size: 35.0,
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 50.0,
                  thickness: 1,
                ),
                Text(
                  "Username :",
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "\t\t" + username,
                  style: GoogleFonts.poppins(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Email :",
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "\t\t" + emailId,
                  style: GoogleFonts.poppins(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Password :",
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "\t\t" + password,
                  style: GoogleFonts.poppins(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Divider(
                  height: 50.0,
                  thickness: 1,
                ),
                Text(
                  "Note :",
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "\t\t" + note,
                  style: GoogleFonts.poppins(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.4),
                      Theme.of(context).scaffoldBackgroundColor,
                    ],
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text(
                          "Delete",
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text(
                          "Update",
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
