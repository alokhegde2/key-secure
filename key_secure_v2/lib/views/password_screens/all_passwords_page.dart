import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_secure_v2/controller/password_controller/password_controller.dart';
import 'package:key_secure_v2/widgets/password_widgets/password_list.dart';
import 'package:key_secure_v2/widgets/user_widgets/unauthorized_widget.dart';

class AllPasswords extends StatelessWidget {
  const AllPasswords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());

    return Obx(
      () => (passwordController.isLogedIn.value)
          ? Scaffold(
              appBar: AppBar(
                title: Text("All Passwords"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PasswordList(
                  count: passwordController
                      .passwordData["Passwords"]!.results.length,
                ),
              ),
            )
          : Unauthorized(),
    );
  }
}
