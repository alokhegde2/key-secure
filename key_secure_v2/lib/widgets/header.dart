import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/user_controller/user_controller.dart';

class Header extends StatelessWidget {
  final String imgUrl =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png";
  @override
  Widget build(BuildContext context) {
    var userController = Get.put(UserController());

    return Container(
      width: MediaQuery.of(context).size.width,
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
              SizedBox(
                width: 20.0,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed("/settings");
                },
                child: Obx(
                  () => Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: CircleAvatar(
                      backgroundImage:
                          (userController.userData["user"]!.avatar != "")
                              ? NetworkImage(
                                  userController.userData["user"]!.avatar,
                                  scale: 1.0)
                              : NetworkImage(imgUrl, scale: 1.0),
                    ),
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
