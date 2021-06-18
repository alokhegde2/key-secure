import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/user_controller/change_passwords_controller.dart';
import 'package:key_secure_v2/controller/user_controller/user_controller.dart';
import 'package:key_secure_v2/services/user_services/user_service.dart';
import 'package:key_secure_v2/widgets/user_widgets/unauthorized_widget.dart';

import '../../constants.dart';

class ChangeMasterPass extends StatelessWidget {
  ChangeMasterPass({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final _masterPasswordController = TextEditingController();

  final _newMasterPasswordController = TextEditingController();

  final _confirmMasterPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userController = Get.put(UserController());
    var changeMasterController = Get.put(ChangePasswords());

    return Obx(
      () => (userController.isLogedIn.value)
          ? Scaffold(
              appBar: AppBar(
                title: Text("Change Master Password"),
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
                          "Change master password",
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Enter the new master password , please choose the stronger password for you passwords security",
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
                                  controller: _masterPasswordController,
                                  onChanged: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Master Password can not be empty";
                                    } else if (value.length < 6) {
                                      return "Master Password can not less than 6 characters";
                                    }
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: (changeMasterController
                                          .isMasterPasswordVisible.value)
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
                                        changeMasterController
                                            .toggleMasterPassword();
                                      },
                                      icon: Icon((changeMasterController
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
                                  controller: _newMasterPasswordController,
                                  onChanged: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Master Password can not be empty";
                                    } else if (value.length < 6) {
                                      return "Master Password can not less than 6 characters";
                                    } else if (!_newMasterPasswordController
                                        .text
                                        .contains(RegExp(
                                            r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"))) {
                                      return "Choose a stronger password";
                                    }
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: (changeMasterController
                                          .isNewMasterPasswordVisible.value)
                                      ? false
                                      : true,
                                  decoration: InputDecoration(
                                    labelText: "New Master Password",
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
                                        changeMasterController
                                            .toggleNewMasterPassword();
                                      },
                                      icon: Icon((changeMasterController
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
                                  controller: _confirmMasterPasswordController,
                                  onChanged: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Master Password can not be empty";
                                    } else if (value.length < 6) {
                                      return "Master Password can not less than";
                                    } else if (_newMasterPasswordController
                                            .text !=
                                        _confirmMasterPasswordController.text) {
                                      return "Master Password are not matching";
                                    }
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: (changeMasterController
                                          .isConfirmMasterPasswordVisible.value)
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
                                        changeMasterController
                                            .toggleConfirmMasterPassword();
                                      },
                                      icon: Icon((changeMasterController
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
                                    if (changeMasterController
                                        .buttonEnabled.value) {
                                      if (_formKey.currentState!.validate()) {
                                        var masterPass =
                                            _masterPasswordController.text;
                                        var newMasterPass =
                                            _newMasterPasswordController.text;
                                        _submitMasterPassword(
                                          masterPass,
                                          newMasterPass,
                                          context,
                                          changeMasterController,
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
                                        "${changeMasterController.buttonText.value}",
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

_submitMasterPassword(masterPass, newMasterPass, context, controller) async {
  controller.changeButtonText("Changing . . .");
  controller.toggleButton();
  var response =
      await UserService().updateMasterPassword(masterPass, newMasterPass);
  if (response.statusCode == 200) {
    controller.changeButtonText("Changed");
    controller.toggleButton();
    _successSnack("${response.body["message"]}", context);
  } else if (response.statusCode == 400) {
    controller.changeButtonText("Change Master Password");
    controller.toggleButton();
    _errorSnack("${response.body["message"]}", context);
  } else if (response.statusCode == 401) {
    controller.changeButtonText("Change Master Password");
    controller.toggleButton();
    _errorSnack("${response.body["message"]}", context);
  } else if (response.statusCode == 401) {
    controller.changeButtonText("Change Master Password");
    controller.toggleButton();
    _errorSnack("Internal Server Error", context);
  }
}

_successSnack(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        "$message",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.greenAccent,
    ),
  );
}

_errorSnack(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        "$message",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.red,
    ),
  );
}
