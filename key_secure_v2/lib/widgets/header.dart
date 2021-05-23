import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/services/theme_services.dart';
import 'package:key_secure_v2/views/settings.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Key Secure",
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  ThemeServices().changeThemeMode();
                },
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              InkWell(
                onTap: (){
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
