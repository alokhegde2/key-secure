import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_web/constants.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: defaultPadding, right: defaultPadding),
      color: bgColor,
      height: 80.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Key Secure",
              style: GoogleFonts.ubuntu(
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Features",
                    style: GoogleFonts.poppins(color: secondaryColor),
                  ),
                ),
                SizedBox(
                  width: 40.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Download",
                    style: GoogleFonts.poppins(color: secondaryColor),
                  ),
                ),
                SizedBox(
                  width: 40.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Contact Us",
                    style: GoogleFonts.poppins(color: secondaryColor),
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50.0,
                width: 150.0,
                decoration: BoxDecoration(color: secondaryColor),
                child: Center(
                  child: Text(
                    "Launch On Web",
                    style: GoogleFonts.poppins(color: primaryColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
