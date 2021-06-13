import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';

class MasterPass extends StatelessWidget {
  const MasterPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Text(
                "Master password",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Enter the master password associated with your account to contine.",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF556274),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Master Password",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF556274),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                // controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "johndoe@gmail.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  focusColor: Colors.white,
                  prefixIcon: Icon(Icons.vpn_key),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: TextButton(
                onPressed: () {
                  Get.toNamed('/forgot-master-pass');
                },
                child: Text(
                  "Forgot Master Password",
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline),
                ),
            ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/home');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      "Verify",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  height: 50.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
