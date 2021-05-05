import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/models/images.dart';
import 'package:key_secure/models/password.dart';
import 'package:key_secure/views/password_details.dart';

class PasswordCard extends StatelessWidget {
  final Password password;

  PasswordCard(this.password);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: () {
          Get.to(PasswordDeails(password));
        },
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: password.passwordId,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(imageUrl[password.appType]),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        password.appName,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        password.appMailId,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Icon(CupertinoIcons.chevron_forward),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
