//Verifing master password
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/auth_controller/verify_and_forgot_master_pass_controller.dart';
import 'package:key_secure_v2/services/auth_services/login_services.dart';
import 'package:key_secure_v2/views/error_screens/server_down.dart';
import 'package:key_secure_v2/widgets/snack_bar.dart';

class MasterPass extends StatelessWidget {
  MasterPass({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _masterPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final verifyMasterPassController = Get.put(VerifyAndForgotMasterPass());

    return DoubleBack(
      message: "Press back again to close",
      child: Obx(
        () => Scaffold(
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.0),
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
                        "Enter the master password associated with your account to continue.",
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
                        controller: _masterPassController,
                        obscureText: (verifyMasterPassController
                                .isMasterPasswordVisible.value)
                            ? false
                            : true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (!value!.contains(RegExp(
                              r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"))) {
                            return "Invalid master password";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Master Password",
                          hintText: "****************",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          focusColor: Colors.white,
                          prefixIcon: Icon(Icons.vpn_key),
                          suffixIcon: IconButton(
                            onPressed: () {
                              verifyMasterPassController.toggleMasterPass();
                            },
                            icon: Icon((verifyMasterPassController
                                    .isMasterPasswordVisible.value)
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
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
                          var masterPassword = _masterPassController.text;
                          if (verifyMasterPassController
                              .isMasterButtonEnabled.value) {
                            if (_formKey.currentState!.validate()) {
                              _submitMasterPass(
                                masterPassword,
                                verifyMasterPassController,
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
                              "${verifyMasterPassController.buttonText.value}",
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
      ),
    );
  }
}

_submitMasterPass(masterPassword, controller, context) async {
  controller.setButtonText("Verifying...");
  controller.toggleMasterButton(false);
  var response = await LoginServices().verifyMaster(masterPassword);
  if (response.statusCode == 400) {
    errorSnack("${response.body["message"]}", context);
    controller.toggleMasterButton(true);
    controller.setButtonText("Continue");
  } else if (response.statusCode == 200) {
    controller.toggleMasterButton(true);
    controller.setButtonText("Success");
    Get.offAllNamed("/home");
  } else if (response.statusCode == 500) {
    errorSnack("Internal Server Error", context);
    controller.toggleMasterButton(true);
    controller.setButtonText("Continue");
  } else {
    Get.to(ServerDown());
  }
}
