import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/user_controller/change_passwords_controller.dart';
import 'package:key_secure_v2/controller/user_controller/user_controller.dart';
import 'package:key_secure_v2/services/user_services/user_service.dart';
import 'package:key_secure_v2/widgets/snack_bar.dart';
import 'package:key_secure_v2/widgets/user_widgets/unauthorized_widget.dart';

import '../../constants.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userController = Get.put(UserController());
    var changePasswordController = Get.put(ChangePasswords());
    return Obx(
      () => (userController.isLogedIn.value)
          ? Scaffold(
              appBar: AppBar(
                title: Text("Change Password"),
              ),
              body: SafeArea(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.0),
                        Text(
                          "Change password",
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Enter the new password , please choose the stronger password for your passwords security",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF556274),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                  onChanged: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password can not be empty";
                                    } else if (value.length < 6) {
                                      return "Password can not less than 6 characters";
                                    }
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: (changePasswordController
                                          .isMasterPasswordVisible.value)
                                      ? false
                                      : true,
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
                                        changePasswordController
                                            .toggleMasterPassword();
                                      },
                                      icon: Icon((changePasswordController
                                              .isMasterPasswordVisible.value)
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
                                "New Password",
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
                                  controller: _newPasswordController,
                                  onChanged: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password can not be empty";
                                    } else if (value.length < 6) {
                                      return "Password can not less than 6 characters";
                                    } else if (!_newPasswordController.text
                                        .contains(RegExp(
                                            r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"))) {
                                      return "Choose a stronger password";
                                    }
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: (changePasswordController
                                          .isNewMasterPasswordVisible.value)
                                      ? false
                                      : true,
                                  decoration: InputDecoration(
                                    labelText: "New Password",
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
                                        changePasswordController
                                            .toggleNewMasterPassword();
                                      },
                                      icon: Icon((changePasswordController
                                              .isNewMasterPasswordVisible.value)
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
                                "Confirm Password",
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
                                  controller: _confirmNewPasswordController,
                                  onChanged: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password can not be empty";
                                    } else if (value.length < 6) {
                                      return "Password can not less than";
                                    } else if (_newPasswordController.text !=
                                        _confirmNewPasswordController.text) {
                                      return "Password are not matching";
                                    }
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: (changePasswordController
                                          .isConfirmMasterPasswordVisible.value)
                                      ? false
                                      : true,
                                  decoration: InputDecoration(
                                    labelText: "Confirm Password",
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
                                        changePasswordController
                                            .toggleConfirmMasterPassword();
                                      },
                                      icon: Icon((changePasswordController
                                              .isConfirmMasterPasswordVisible
                                              .value)
                                          ? CupertinoIcons.eye_slash
                                          : CupertinoIcons.eye),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Obx(
                                () => InkWell(
                                  borderRadius: BorderRadius.circular(10.0),
                                  onTap: () {
                                    if (changePasswordController
                                        .buttonEnabled.value) {
                                      if (_formKey.currentState!.validate()) {
                                        var password = _passwordController.text;
                                        var newPassword =
                                            _newPasswordController.text;
                                        _submitPassword(
                                          password,
                                          newPassword,
                                          context,
                                          changePasswordController,
                                        );
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
                                        "${changePasswordController.passwordButtonText.value}",
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Unauthorized(),
    );
  }
}

_submitPassword(password, newPassword, context, controller) async {
  controller.changePassButtonText("Changing . . .");
  controller.toggleButton();
  var response = await UserService().updatePassword(password, newPassword);
  if (response.statusCode == 200) {
    controller.changePassButtonText("Changed");
    controller.toggleButton();
    successSnack("${response.body["message"]}", context);
  } else if (response.statusCode == 400) {
    controller.changePassButtonText("Change Password");
    controller.toggleButton();
    errorSnack("${response.body["message"]}", context);
  } else if (response.statusCode == 401) {
    controller.changePassButtonText("Change Password");
    controller.toggleButton();
    errorSnack("${response.body["message"]}", context);
  } else if (response.statusCode == 401) {
    controller.changePassButtonText("Change Password");
    controller.toggleButton();
    errorSnack("Internal Server Error", context);
  }
}
