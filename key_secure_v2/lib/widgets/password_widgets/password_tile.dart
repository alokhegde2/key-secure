import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/password_controller/password_controller.dart';

class PasswordTile extends StatelessWidget {
  final index;

  const PasswordTile({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {
            Get.toNamed("/password/details", parameters: {
              "title": passwordController
                  .passwordData["Passwords"]!.results[index].title,
              "emailId": passwordController
                  .passwordData["Passwords"]!.results[index].emailId,
              "username": passwordController
                  .passwordData["Passwords"]!.results[index].username,
              "category": passwordController
                  .passwordData["Passwords"]!.results[index].category,
              "password": passwordController
                  .passwordData["Passwords"]!.results[index].password,
              "image": passwordController
                  .passwordData["Passwords"]!.results[index].image,
              "note": passwordController
                  .passwordData["Passwords"]!.results[index].note,
              "id": passwordController
                  .passwordData["Passwords"]!.results[index].id,
            });
          },
          child: Container(
            height: 80.0,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            // margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: passwordController
                          .passwordData["Passwords"]!.results[index].id,
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(passwordController
                                  .passwordData["Passwords"]!
                                  .results[index]
                                  .image)),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          passwordController
                              .passwordData["Passwords"]!.results[index].title,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          passwordController.passwordData["Passwords"]!
                              .results[index].emailId,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.chevron_forward,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
