import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/controllers/user_controller.dart';
import 'package:key_secure/views/static/privacy_policy.dart';

import '../main.dart';
import 'auth/main_auth.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Settings",
          style: GoogleFonts.ubuntu(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Obx(
            () => ListView(
              children: [
                (userController.userList.length != 0)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userController.userList[0].name,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600, fontSize: 25.0),
                          ),
                          Text(
                            userController.userList[0].email,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300, fontSize: 15.0),
                          ),
                        ],
                      )
                    : Center(child: CircularProgressIndicator()),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  height: 8,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  "My Account",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: 20.0),
                ),
                SizedBox(
                  height: 25.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.lock),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Change Password",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 17.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  height: 8,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.security),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Change Master Password",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 17.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 45.0,
                ),
                Text(
                  "Key Secure",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: 20.0),
                ),
                SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.info_circle),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "About us",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 17.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  height: 8,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.person_3),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Support Us",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 17.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  height: 8,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.share),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Share",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 17.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  height: 8,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    Get.to(PrivacyPolicy());
                  },
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.exclamationmark_shield),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Privacy Policy",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 17.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  height: 8,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () async {
                    box.erase();
                    Get.off(MainAuth());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Logout",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 17.0),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Icon(CupertinoIcons.power),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  height: 8,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "App Version v 1.0.0",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 17.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
