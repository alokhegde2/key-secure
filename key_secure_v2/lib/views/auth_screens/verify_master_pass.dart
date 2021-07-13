//Verifing master password
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/auth_controller/verify_and_forgot_master_pass_controller.dart';
import 'package:key_secure_v2/services/auth_services/login_services.dart';
import 'package:key_secure_v2/widgets/auth_widgets/error.dart';

class MasterPass extends StatelessWidget {
  MasterPass({Key? key}) : super(key: key);
  final _masterPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final verifyMasterPassController = Get.put(VerifyAndForgotMasterPass());

    return DoubleBack(
      message: "Press back again to close",
      child: Scaffold(
        body: SafeArea(
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
                  Obx(
                    () => TextFormField(
                      controller: _masterPassController,
                      obscureText: (verifyMasterPassController
                              .isMasterPasswordVisible.value)
                          ? false
                          : true,
                      keyboardType: TextInputType.visiblePassword,
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
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // Obx(
                  //   () => Container(
                  //     child: (verifyMasterPassController.isError.value)
                  //         ? Center(
                  //             child: ErrorMessage(
                  //                 error:
                  //                     verifyMasterPassController.error.value),
                  //           )
                  //         : null,
                  //   ),
                  // ),
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
                      // Get.toNamed('/home');
                      var masterPassword = _masterPassController.text;
                      submitMasterPass(
                          masterPassword, verifyMasterPassController);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Obx(
                          () => Text(
                            "${verifyMasterPassController.buttonText.value}",
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
      ),
    );
  }
}

submitMasterPass(masterPassword, controller) async {
  controller.setButtonText("Verifying...");

  if (!masterPassword.contains(RegExp(
      r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"))) {
    controller.setError("Invalid master password");
    controller.setButtonText("Continue");
  } else {
    var response = await LoginServices().verifyMaster(masterPassword);
    if (response.statusCode == 400) {
      controller.setError("${response.body["message"]}");
      controller.setButtonText("Continue");
    } else if (response.statusCode == 200) {
      controller.success();
      controller.setButtonText("Success");
      Get.offAllNamed("/home");
    } else if (response.statusCode == 500) {
      controller.setError("Internal Server Error");
      controller.setButtonText("Continue");
    } else {
      controller.setError("Some unknown error occured");
      controller.setButtonText("Continue");
    }
  }
}
