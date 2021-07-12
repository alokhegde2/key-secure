import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/password_controller/password_controller.dart';
import 'package:key_secure_v2/services/password_service/password_service.dart';
import 'package:key_secure_v2/widgets/snack_bar.dart';
import 'package:key_secure_v2/widgets/user_widgets/unauthorized_widget.dart';

class PasswordDetails extends StatelessWidget {
  final title = Get.parameters["title"].toString();
  final emailId = Get.parameters["emailId"].toString();
  final username = Get.parameters["username"].toString();
  final category = Get.parameters["category"].toString();
  final password = Get.parameters["password"].toString();
  final image = Get.parameters["image"].toString();
  final note = Get.parameters["note"].toString();
  final id = Get.parameters["id"].toString();
  final index = Get.parameters["index"];
  @override
  Widget build(BuildContext context) {
    var passwordController = Get.put(PasswordController());
    return Obx(
      () => (passwordController.isLogedIn.value)
          ? Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              body: SafeArea(
                child: Stack(
                  children: [
                    ListView(
                      padding: EdgeInsets.only(
                          bottom: 150.0, left: 10.0, right: 10.0, top: 20.0),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Hero(
                              tag: id,
                              child: Container(
                                height: 90.0,
                                width: 90.0,
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    image: NetworkImage(image, scale: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: Text(
                                    title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: Text(
                                    username,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                var value;
                                (passwordController.passwordData["Passwords"]!
                                        .results[int.parse(index!)].isImportant)
                                    ? value = false
                                    : value = true;
                                if (passwordController
                                    .isImportantButtonEnabled.value) {
                                  _togleImportant(
                                      context, passwordController, id, value);
                                }
                              },
                              icon: (!passwordController
                                      .passwordData["Passwords"]!
                                      .results[int.parse(index!)]
                                      .isImportant)
                                  ? Icon(
                                      Icons.star_border,
                                      size: 35.0,
                                    )
                                  : Icon(
                                      Icons.star,
                                      size: 35.0,
                                      color: Colors.amber,
                                    ),
                            )
                          ],
                        ),
                        Divider(
                          height: 50.0,
                          thickness: 1,
                        ),
                        Text(
                          "Username :",
                          style: GoogleFonts.poppins(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "   " + username,
                          style: GoogleFonts.poppins(
                            fontSize: 19.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Email :",
                          style: GoogleFonts.poppins(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "   " + emailId,
                          style: GoogleFonts.poppins(
                            fontSize: 19.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Password :",
                          style: GoogleFonts.poppins(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (passwordController.isPasswordVisible.value)
                                ? SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                    child: Text(
                                      "   " + password,
                                      style: GoogleFonts.poppins(
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                    child: Text(
                                      "   " + ".  " * password.length,
                                      style: GoogleFonts.poppins(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    passwordController.togglePassword();
                                  },
                                  icon: Icon(
                                    (passwordController.isPasswordVisible.value)
                                        ? CupertinoIcons.eye
                                        : CupertinoIcons.eye_slash,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    FlutterClipboard.copy(password).then(
                                      (value) => print('copied'),
                                    );
                                    successSnack("Password Copied !", context);
                                  },
                                  icon: Icon(CupertinoIcons.doc_on_clipboard),
                                ),
                              ],
                            )
                          ],
                        ),
                        Divider(
                          height: 50.0,
                          thickness: 1,
                        ),
                        Text(
                          "Note :",
                          style: GoogleFonts.poppins(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "   " + note,
                          style: GoogleFonts.poppins(
                            fontSize: 19.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.4),
                              Theme.of(context).scaffoldBackgroundColor,
                            ],
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(20.0),
                              onTap: () {
                                if (passwordController.isButtonEnabled.value) {
                                  _deletePassword(
                                      id, passwordController, context);
                                }
                              },
                              child: Container(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color: kSecondaryColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Text(
                                    passwordController.deleteButtonText.value,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(20.0),
                              onTap: () {
                                Get.toNamed("/password/update", parameters: {
                                  "title": title,
                                  "emailId": emailId,
                                  "username": username,
                                  "category": category,
                                  "password": password,
                                  "note": note,
                                  "id": id,
                                });
                              },
                              child: Container(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Text(
                                    "Update",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Unauthorized(),
    );
  }
}

_deletePassword(id, controller, context) async {
  controller.toggleButton();
  controller.changeDeleteText("Deleting...");
  var response = await PasswordService().deletePassword(id);
  if (response.statusCode == 200) {
    controller.toggleButton();
    successSnack("Password Deleted !", context);
    controller.onInit();
    controller.changeDeleteText("Delete");
    Get.back();
  } else if (response.statusCode == 400) {
    controller.toggleButton();
    controller.changeDeleteText("Delete");

    errorSnack("${response.body.message}", context);
  } else if (response.statusCode == 401) {
    controller.toggleButton();
    controller.changeDeleteText("Delete");

    errorSnack("${response.body.message}", context);
  } else {
    controller.toggleButton();
    controller.changeDeleteText("Delete");

    errorSnack("Some Unknown Error Occured !", context);
  }
}

_togleImportant(context, controller, id, value) async {
  controller.toggleImportantButtonEnable(false);
  var response = await PasswordService().toggleImportant(value, id);

  if (response.statusCode == 200) {
    controller.toggleImportantButtonEnable(true);
    successSnack("Added/Removed From Important !", context);
    controller.onInit();
  } else if (response.statusCode == 400) {
    controller.toggleImportantButtonEnable(true);
    errorSnack("${response.body.message}", context);
  } else if (response.statusCode == 401) {
    controller.toggleImportantButtonEnable(true);
    errorSnack("${response.body.message}", context);
  } else {
    controller.toggleImportantButtonEnable(true);
    errorSnack("Some Unknown Error Occured !", context);
  }
}
