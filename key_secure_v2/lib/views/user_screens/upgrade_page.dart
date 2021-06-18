import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/user_controller/user_controller.dart';
import 'package:key_secure_v2/widgets/user_widgets/unauthorized_widget.dart';

class UpgradePage extends StatelessWidget {
  const UpgradePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userController = Get.put(UserController());

    return Obx(
      () => (userController.isLogedIn.value)
          ? Scaffold(
              appBar: AppBar(
                title: Text("Upgrade to Pro"),
              ),
              body: Center(
                child: Text(
                  "Coming Soon . . .",
                  style: GoogleFonts.poppins(
                      fontSize: 30.0, fontWeight: FontWeight.w700),
                ),
              ),
            )
          : Unauthorized(),
    );
  }
}
