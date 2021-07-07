import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NoConnection extends StatelessWidget {
  final controller;
  final fromRoute;
  NoConnection({required this.controller, required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Server Down"),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                "Oops ! No connection Down",
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
              Container(
                height: 50.0,
                width: 150.0,
                child: Text("Retry"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
