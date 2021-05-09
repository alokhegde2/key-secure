import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/controllers/auth_controller.dart';
import 'package:key_secure/controllers/master_pass_controller.dart';
import 'package:key_secure/widgets/error.dart';

import '../../home_page.dart';

class MasterPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final masterPass = Get.put(MasterPassControler());
    final authController = Get.put(AuthController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text(
                      "Master Password",
                      style: GoogleFonts.ubuntu(
                          fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Obx(() => Text(
                        "Please Enter your master password",
                        // masterPass.pass.toString(),
                        style: GoogleFonts.ubuntu(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFE0E0E0).withOpacity(0.7),
                        ),
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 60, right: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Obx(
                        () => Center(
                          child: (masterPass.pass.value.length >= 1)
                              ? Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF12E17F),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Obx(
                        () => Center(
                          child: (masterPass.pass.value.length >= 2)
                              ? Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF12E17F),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Obx(
                        () => Center(
                          child: (masterPass.pass.value.length >= 3)
                              ? Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF12E17F),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Obx(
                        () => Center(
                          child: (masterPass.pass.value.length >= 4)
                              ? Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF12E17F),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Center(
                  child: Container(
                    child: (authController.isError.value)
                        ? ErrorMessage(error: authController.err.toString())
                        : null,
                  ),
                ),
              ),
              Container(
                color: Colors.grey.shade800,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            masterPass.onKeyTap("1");
                          },
                          child: NumberButton(
                            number: 1,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            masterPass.onKeyTap("2");
                          },
                          child: NumberButton(
                            number: 2,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            masterPass.onKeyTap("3");
                          },
                          child: NumberButton(
                            number: 3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            masterPass.onKeyTap("4");
                          },
                          child: NumberButton(
                            number: 4,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            masterPass.onKeyTap("5");
                          },
                          child: NumberButton(
                            number: 5,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            masterPass.onKeyTap("6");
                          },
                          child: NumberButton(
                            number: 6,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            masterPass.onKeyTap("7");
                          },
                          child: NumberButton(
                            number: 7,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            masterPass.onKeyTap("8");
                          },
                          child: NumberButton(
                            number: 8,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            masterPass.onKeyTap("9");
                          },
                          child: NumberButton(
                            number: 9,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            if (masterPass.pass.value.length < 4) {
                              authController.error();
                              authController
                                  .seterror("Fields should not be empty");
                            } else {
                              authController.noerror();
                              Get.to(HomePage());
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(child: Icon(Icons.check)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            masterPass.onKeyTap("0");
                          },
                          child: NumberButton(
                            number: 0,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            masterPass.onClear();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(25)),
                            child:
                                Center(child: Icon(CupertinoIcons.delete_left)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final int number;

  const NumberButton({Key key, this.number}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: Colors.orangeAccent, borderRadius: BorderRadius.circular(35)),
      child: Center(
          child: Text(
        "$number",
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(fontSize: 30.0),
      )),
    );
  }
}
