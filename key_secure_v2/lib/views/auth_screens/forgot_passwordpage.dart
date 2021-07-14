//For reset the main password
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/auth_controller/verify_and_forgot_master_pass_controller.dart';
import 'package:key_secure_v2/services/auth_services/login_services.dart';
import 'package:key_secure_v2/views/error_screens/server_down.dart';
import 'package:key_secure_v2/widgets/snack_bar.dart';

import '../../constants.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var forgotPasswordController = Get.put(VerifyAndForgotMasterPass());
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Form(
              key: _formKey,
              // child: SingleChildScrollView(
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
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
                    validator: (value) {
                      if (!value!.contains(
                          RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))) {
                        return "Enter Proper Email";
                      }
                    },
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
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () {
                      var mail = _emailController.text;
                      if (forgotPasswordController.isButtonEnabled.value) {
                        if (_formKey.currentState!.validate()) {
                          submitMail(mail, forgotPasswordController, context);
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          "${forgotPasswordController.forgotButtonText.value}",
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
          // ),
        ),
      ),
    );
  }
}

submitMail(email, controller, context) async {
  controller.setForgotButtonText("Verifying...");
  controller.toggleButton(false);
  var response = await LoginServices().resetPassword(email);

  if (response.statusCode == 400) {
    errorSnack("${response.body["message"]}", context);
    controller.toggleButton(true);
    controller.setForgotButtonText("Send Instructions");
  } else if (response.statusCode == 200) {
    successSnack("Link sent to registered email id", context);
    controller.setForgotButtonText("Success");
    controller.toggleButton(true);
    Get.toNamed('/mail-sent', arguments: {
      "type": "password recover",
      "button": "try again with another mail",
      "nextRoute": "/login",
      "sentRoute": "/forgot-pass"
    });
  } else if (response.statusCode == 500) {
    errorSnack("Internal Server Error", context);
    controller.setForgotButtonText("Send Instructions");
    controller.toggleButton(true);
  } else {
    Get.off(ServerDown());
  }
}
