import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterController extends GetxController {
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isError = false.obs;

  //togglling password visible
  togglePassword() {
    if (isPasswordVisible.value) {
      isPasswordVisible(false);
    } else {
      isPasswordVisible(true);
    }
  }

  //toggling confirmPassword
  toggleConfirmPassword() {
    if (isConfirmPasswordVisible.value) {
      isConfirmPasswordVisible(false);
    } else {
      isConfirmPasswordVisible(true);
    }
  }

  setError(err) {
    isError(true);
    Get.snackbar(
      "Error",
      err,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      borderRadius: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      messageText: Text(
        err,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 17.0,
          letterSpacing: .9,
        ),
        textAlign: TextAlign.center,
      ),
      titleText: Text(
        "",
        style: GoogleFonts.poppins(fontSize: 0.0),
      ),
    );
  }
}
