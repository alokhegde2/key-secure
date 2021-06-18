import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Unauthorized extends StatelessWidget {
  const Unauthorized({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unauthorized"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "401",
              style: GoogleFonts.poppins(
                // color: kSecondaryColor,
                fontSize: 80.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Oops!",
              style: GoogleFonts.poppins(
                fontSize: 23.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Hey,you're not autherized to access this page . Login to access this page",
              style: GoogleFonts.poppins(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
