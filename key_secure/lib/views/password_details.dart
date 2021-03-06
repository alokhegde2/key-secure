import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/controllers/password_controller.dart';
import 'package:key_secure/models/images.dart';
import 'package:key_secure/models/password.dart';
import 'package:key_secure/services/remote_services.dart';
import 'package:key_secure/views/home_page.dart';
import 'package:key_secure/views/update_password.dart';

class PasswordDeails extends StatefulWidget {
  final Password passwordList;

  PasswordDeails(this.passwordList);

  @override
  _PasswordDeailsState createState() => _PasswordDeailsState();
}

class _PasswordDeailsState extends State<PasswordDeails> {
  bool isPasswordVisible = false;
  final passwordController = Get.put(PasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(CupertinoIcons.chevron_left),
        ),
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.pencil),
              onPressed: () {
                Get.to(UpdatePassword(widget.passwordList));
              }),
          IconButton(
              icon: Icon(CupertinoIcons.delete),
              onPressed: () async {
                int response =
                    await RemoteServices.attemptDelete(widget.passwordList.id);
                if (response == 404) {
                  final snackBar = SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.red,
                    content: Text(
                      'Error Occured',
                      textAlign: TextAlign.center,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (response == 200) {
                  passwordController.onInit();
                  Get.off(HomePage());
                }
              }),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: widget.passwordList.passwordId,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                imageUrl[widget.passwordList.appType]),
                            fit: BoxFit.fill)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.passwordList.appName,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700, fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      widget.passwordList.appUserId,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: 15.0),
                    ),
                  ],
                ),
                IconButton(
                    icon: (widget.passwordList.isFavourite)
                        ? Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.yellow,
                          )
                        : Icon(
                            CupertinoIcons.star,
                          ),
                    onPressed: () async {
                      int response;
                      if (widget.passwordList.isFavourite) {
                        response = await RemoteServices.attemptUpdatePass(
                            widget.passwordList.appName,
                            widget.passwordList.appMailId,
                            widget.passwordList.appPassword,
                            widget.passwordList.appUserId,
                            widget.passwordList.appType,
                            widget.passwordList.note,
                            widget.passwordList.userId,
                            widget.passwordList.id,
                            false);
                      } else {
                        response = await RemoteServices.attemptUpdatePass(
                            widget.passwordList.appName,
                            widget.passwordList.appMailId,
                            widget.passwordList.appPassword,
                            widget.passwordList.appUserId,
                            widget.passwordList.appType,
                            widget.passwordList.note,
                            widget.passwordList.userId,
                            widget.passwordList.id,
                            true);
                      }
                      if (response == 400) {
                        final snackBar = SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.red,
                          content: Text(
                            'Error Occured',
                            textAlign: TextAlign.center,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (response == 200) {
                        passwordController.onInit();
                        Get.off(HomePage());
                        final snackBar = SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.green,
                          content: Text(
                            (widget.passwordList.isFavourite)
                                ? 'Removed from favourite'
                                : 'Added to favourite',
                            textAlign: TextAlign.center,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    })
              ],
            ),
            Divider(
              height: 40.0,
              thickness: 1,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Username",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.passwordList.appUserId,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300, fontSize: 20.0),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Email",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.passwordList.appMailId,
              style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w300, fontSize: 20.0),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Password",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (isPasswordVisible)
                    ? SizedBox(
                        width: 130,
                        child: Text(
                          widget.passwordList.appPassword,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300, fontSize: 20.0),
                        ),
                      )
                    : SizedBox(
                        width: 130,
                        child: Text(
                          ".  " * widget.passwordList.appPassword.length,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w900, fontSize: 20.0),
                        ),
                      ),
                Row(
                  children: [
                    IconButton(
                        icon: (isPasswordVisible)
                            ? Icon(CupertinoIcons.eye_slash)
                            : Icon(CupertinoIcons.eye),
                        onPressed: () {
                          setState(() {
                            (isPasswordVisible)
                                ? isPasswordVisible = false
                                : isPasswordVisible = true;
                          });
                        }),
                    IconButton(
                      icon: Icon(CupertinoIcons.doc_on_clipboard),
                      onPressed: () {
                        final snackBar = SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            'Password Copied!',
                            textAlign: TextAlign.center,
                          ),
                        );
                        FlutterClipboard.copy(widget.passwordList.appPassword)
                            .then(
                          (value) => print(
                              'copied ' + widget.passwordList.appPassword),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              height: 40.0,
              thickness: 1,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Notes",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              (widget.passwordList.note == null)
                  ? "No notes"
                  : widget.passwordList.note,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
