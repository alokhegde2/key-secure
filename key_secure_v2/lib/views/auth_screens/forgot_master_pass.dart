import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/auth_controller/verify_and_forgot_master_pass.dart';

import '../../constants.dart';

class ForgotMasterPass extends StatelessWidget {
  ForgotMasterPass({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _masterPassController = TextEditingController();
  final _confirmMasterPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final forgotMasterPassController = Get.put(VerifyAndForgotMasterPass());
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Master Password"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Text(
                  "Reset master password",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Enter the email associated with your account and also the password of your account and also the new master password",
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
                  "Email address",
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
                  controller: _emailController,
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
                      prefixIcon: Icon(CupertinoIcons.mail)),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Password",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF556274),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Obx(
                  () => TextFormField(
                    controller: _passwordController,
                    obscureText:
                        (forgotMasterPassController.isPasswordVisible.value)
                            ? false
                            : true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "*************",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusColor: Colors.white,
                      prefixIcon: Icon(CupertinoIcons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          forgotMasterPassController.togglePassword();
                        },
                        icon: Icon(
                            (forgotMasterPassController.isPasswordVisible.value)
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "New Master Password",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF556274),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Obx(
                  () => TextFormField(
                    controller: _masterPassController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: (forgotMasterPassController
                            .isNewMasterPassVisible.value)
                        ? false
                        : true,
                    decoration: InputDecoration(
                      labelText: "Master Password",
                      hintText: "*************",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusColor: Colors.white,
                      prefixIcon: Icon(Icons.vpn_key),
                      suffixIcon: IconButton(
                        onPressed: () {
                          forgotMasterPassController.toggleNewMasterPassword();
                        },
                        icon: Icon((forgotMasterPassController
                                .isNewMasterPassVisible.value)
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Confirm Master Password",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF556274),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Obx(
                  () => TextFormField(
                    controller: _confirmMasterPassController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: (forgotMasterPassController
                            .isConfirmNewMasterPassVisible.value)
                        ? false
                        : true,
                    decoration: InputDecoration(
                      labelText: "Confirm Master Password",
                      hintText: "*************",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusColor: Colors.white,
                      prefixIcon: Icon(Icons.vpn_key),
                      suffixIcon: IconButton(
                        onPressed: () {
                          forgotMasterPassController
                              .toggleConfirmNewMasterPassword();
                        },
                        icon: Icon((forgotMasterPassController
                                .isConfirmNewMasterPassVisible.value)
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed('/master-pass');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        "Reset Master Password",
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
