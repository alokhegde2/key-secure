//for creating new master password
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/auth_controller/new_master_controller.dart';
import 'package:key_secure_v2/main.dart';
import 'package:key_secure_v2/services/auth_services/register_services.dart';
import 'package:key_secure_v2/views/error_screens/server_down.dart';
import 'package:key_secure_v2/widgets/snack_bar.dart';

import '../../constants.dart';

class MasterPassword extends StatelessWidget {
  MasterPassword({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
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
      child: Obx(
        () => Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                key: _formKey,
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
                          validator: (value) {
                            if (!value!.contains(
                                RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))) {
                              return "Invalid Email";
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
                        );
                      } else {
                        return SizedBox();
                      }
                    }()),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      controller: _masterPassController,
                      obscureText:
                          (newMasterPassController.isMasterPassVisible.value)
                              ? false
                              : true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (!value!.contains(RegExp(
                            r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"))) {
                          return "Choose a stronger password.";
                        }
                      },
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
                          icon: Icon((newMasterPassController
                                  .isMasterPassVisible.value)
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    TextFormField(
                      controller: _confirmMasterPassController,
                      obscureText: (newMasterPassController
                              .isConfirmMasterPasswordVisible.value)
                          ? false
                          : true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (_masterPassController.text !=
                            _confirmMasterPassController.text) {
                          return "Passwords are not matching.";
                        }
                      },
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
                    SizedBox(
                      height: 40.0,
                    ),
                    InkWell(
                      onTap: () {
                        var masterPassword = _masterPassController.text;
                        var confirmMasterPassword =
                            _confirmMasterPassController.text;
                        var email = _emailController.text;
                        if (newMasterPassController.isButtonEnabled.value) {
                          if (_formKey.currentState!.validate()) {
                            _submitDetails(
                              _email,
                              email,
                              masterPassword,
                              confirmMasterPassword,
                              newMasterPassController,
                              context,
                            );
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            "${newMasterPassController.buttonText.value}",
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
        ),
      ),
    );
  }
}

_submitDetails(
    storageMail, email, password, confirmPassword, controller, context) async {
  controller.setButtonText("Creating...");
  controller.toggleButton(false);
  _verificationandSubmission(
      email, password, confirmPassword, controller, context);
}

_verificationandSubmission(
    email, password, confirmPassword, controller, context) async {
  var response = await RegisterServices().createMaster(password, email);
  if (response.statusCode == 400) {
    errorSnack("${response.body["message"]}", context);
    controller.toggleButton(true);
    controller.setButtonText("Continue");
  } else if (response.statusCode == 200) {
    controller.setButtonText("Created");
    controller.toggleButton(true);
    Get.offAllNamed('/success');
  } else if (response.statusCode == 500) {
    errorSnack("Internal Server Error", context);
    controller.toggleButton(true);
    controller.setButtonText("Continue");
  } else {
    Get.off(ServerDown());
  }
}
