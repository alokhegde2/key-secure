import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/models/images.dart';
import 'package:key_secure/models/password.dart';

class PasswordDeails extends StatelessWidget {
  final Password passwordList;

  const PasswordDeails(this.passwordList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(CupertinoIcons.chevron_left),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: passwordList.id,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(imageUrl[passwordList.appType]),
                            fit: BoxFit.fill)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      passwordList.appName,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700, fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      passwordList.appUserId,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: 15.0),
                    ),
                  ],
                ),
                IconButton(icon: Icon(CupertinoIcons.star), onPressed: () {})
              ],
            ),
            Divider(
              height: 40.0,
              thickness: 1,
            ),
            SizedBox(
                      height: 15.0,
                    ),
            Text(
              "Username",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
            SizedBox(
                      height: 8.0,
                    ),
            Text(
              passwordList.appUserId,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300, fontSize: 20.0),
            ),
            SizedBox(
                      height: 15.0,
                    ),
            Text(
              "Email",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
            SizedBox(
                      height: 8.0,
                    ),
            Text(
              passwordList.appMailId,
              style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w300, fontSize: 20.0),
            ),
             SizedBox(
                      height: 15.0,
                    ),
            Text(
              "Password",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
            SizedBox(
                      height: 8.0,
                    ),
            Text(
              passwordList.appPassword,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
