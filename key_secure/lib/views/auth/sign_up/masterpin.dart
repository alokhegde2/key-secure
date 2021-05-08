import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/views/auth/sign_up/success.dart';

class MasterPin extends StatelessWidget {
  final _masterpaswordController = TextEditingController();
  final _confirmmasterpaswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: "logo1",
                  child: Image.asset(
                    "assets/logo/logo.png",
                    height: 80,
                    width: 80.0,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  "Setup Maseter \nPassword",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                      fontSize: 32, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  controller: _masterpaswordController,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Master Password",
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "5968",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    focusColor: Colors.white,
                    prefixIcon: Icon(CupertinoIcons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(CupertinoIcons.eye),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: _confirmmasterpaswordController,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Confirm Master Password",
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "5968",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    focusColor: Colors.white,
                    prefixIcon: Icon(CupertinoIcons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(CupertinoIcons.eye),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                InkWell(
                  radius: 10,
                  onTap: () {
                    Get.to(Success());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF12E17F),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        "Continue",
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
      ),
    );
  }
}
