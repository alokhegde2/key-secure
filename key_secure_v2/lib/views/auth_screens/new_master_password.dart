//for creating new master password
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/auth_controller/new_master_controller.dart';
import 'package:key_secure_v2/main.dart';
import 'package:key_secure_v2/services/auth_services/register_services.dart';
import 'package:key_secure_v2/widgets/auth_widgets/error.dart';

import '../../constants.dart';

class MasterPassword extends StatelessWidget {
  MasterPassword({Key? key}) : super(key: key);
  final _masterPassController = TextEditingController();
  final _confirmMasterPassController = TextEditingController();
  final _emailController = TextEditingController();
  final _email = box.read("email");
  @override
  Widget build(BuildContext context) {
    //importing master pass controller
    final newMasterPassController = Get.put(NewMasterController());
    return DoubleBack(
      message: "Press back again to close",
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Image.asset(
                    "assets/logo/logo.png",
                    height: 80,
                    width: 80.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Text(
                      "Key Secure",
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: kMainColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    "Create Master Password.",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                (() {
                  if (_email == null) {
                    return TextFormField(
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
                    );
                  } else {
                    return SizedBox();
                  }
                }()),
                SizedBox(
                  height: 25.0,
                ),
                Obx(
                  () => TextFormField(
                    controller: _masterPassController,
                    obscureText:
                        (newMasterPassController.isMasterPassVisible.value)
                            ? false
                            : true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Master Password",
                      hintText: "***********",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusColor: Colors.white,
                      prefixIcon: Icon(Icons.vpn_key),
                      suffixIcon: IconButton(
                        onPressed: () {
                          newMasterPassController.toggleMasterPass();
                        },
                        icon: Icon(
                            (newMasterPassController.isMasterPassVisible.value)
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Obx(
                  () => TextFormField(
                    controller: _confirmMasterPassController,
                    obscureText: (newMasterPassController
                            .isConfirmMasterPasswordVisible.value)
                        ? false
                        : true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Confirm Master Password",
                      hintText: "***********",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusColor: Colors.white,
                      prefixIcon: Icon(Icons.vpn_key),
                      suffixIcon: IconButton(
                        onPressed: () {
                          newMasterPassController.toggleConfirmMasterPass();
                        },
                        icon: Icon((newMasterPassController
                                .isConfirmMasterPasswordVisible.value)
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Obx(
                  () => Container(
                    child: (newMasterPassController.isError.value)
                        ? Center(
                            child: ErrorMessage(
                                error: newMasterPassController.error.value),
                          )
                        : null,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    // Get.toNamed('/success');
                    var masterPassword = _masterPassController.text;
                    var confirmMasterPassword =
                        _confirmMasterPassController.text;
                    var email = _emailController.text;
                    _submitDetails(
                      _email,
                      email,
                      masterPassword,
                      confirmMasterPassword,
                      newMasterPassController,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Obx(
                        () => Text(
                          "${newMasterPassController.buttonText.value}",
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

_submitDetails(
    storageMail, email, password, confirmPassword, controller) async {
  controller.setButtonText("Creating...");
  // print(email + "1");
  if (storageMail == null) {
    if (!email.contains(RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))) {
      controller.setError("Invalid Email");
      controller.setButtonText("Continue");
    } else {
      _verificationandSubmission(email, password, confirmPassword, controller);
    }
  } else {
    _verificationandSubmission(email, password, confirmPassword, controller);
  }
}

_verificationandSubmission(email, password, confirmPassword, controller) async {
  if (password.length < 6) {
    controller.setButtonText("Continue");
    controller.setError("Password must be greater than 6 charecters.");
  } else if (!password.contains(RegExp(
      r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"))) {
    controller.setError("Choose a stronger password.");
    controller.setButtonText("Continue");
  } else if (password != confirmPassword) {
    controller.setButtonText("Continue");
    controller.setError("Passwords are not matching.");
  } else {
    var response = await RegisterServices().createMaster(password, email);
    if (response.statusCode == 400) {
      controller.setError("${response.body["message"]}");
      controller.setButtonText("Continue");
    } else if (response.statusCode == 200) {
      controller.setButtonText("Created");
      controller.success();
      Get.offAllNamed('/success');
    } else if (response.statusCode == 500) {
      controller.setError("Internal Server Error");
      controller.setButtonText("Continue");
    } else {
      controller.setError("Some Unknown Error Occured");
      controller.setButtonText("Continue");
    }
  }
}
