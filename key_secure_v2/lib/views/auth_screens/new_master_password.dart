//for creating new master password
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/auth_controller/new_master_controller.dart';

import '../../constants.dart';

class MasterPassword extends StatelessWidget {
  MasterPassword({Key? key}) : super(key: key);
  final _masterPassController = TextEditingController();
  final _confirmMasterPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //importing master pass controller
    final newMasterPassController = Get.put(NewMasterController());
    return Scaffold(
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
                height: 50.0,
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
                height: 40.0,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/success');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: GoogleFonts.poppins(
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
    );
  }
}
