//For reset the main password
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/auth_controller/verify_and_forgot_master_pass_controller.dart';
import 'package:key_secure_v2/services/auth_services/login_services.dart';
import 'package:key_secure_v2/widgets/auth_widgets/error.dart';

import '../../constants.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var forgotPasswordController = Get.put(VerifyAndForgotMasterPass());
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
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
                  "Reset password",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Enter the email associated with your account and we'll send  an email with instructions to reset your password",
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
                  height: 20.0,
                ),
                Obx(
                  () => Container(
                    child: (forgotPasswordController.isError.value)
                        ? Center(
                            child: ErrorMessage(
                                error: forgotPasswordController.error.value),
                          )
                        : null,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    var mail = _emailController.text;
                    submitMail(mail, forgotPasswordController);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Obx(
                        () => Text(
                          "${forgotPasswordController.forgotButtonText.value}",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
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

submitMail(email, controller) async {
  controller.setForgotButtonText("Verifying...");
  if (!email.contains(RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))) {
    controller.setError("Invalid Email");
    controller.setForgotButtonText("Send Instructions");
  } else {
    var response = await LoginServices().resetPassword(email);

    if (response.statusCode == 400) {
      controller.setError("${response.body["message"]}");
      controller.setForgotButtonText("Send Instructions");
    } else if (response.statusCode == 200) {
      controller.success();
      controller.setForgotButtonText("Success");
      Get.toNamed('/mail-sent', arguments: {
        "type": "password recover",
        "button": "try again with another mail",
        "nextRoute": "/login",
        "sentRoute": "/forgot-pass"
      });
    } else {
      controller.setError("Some unknown error occured");
      controller.setForgotButtonText("Send Instructions");
    }
  }
}
