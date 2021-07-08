import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_secure_v2/controller/password_controller/password_controller.dart';
import 'package:key_secure_v2/widgets/password_widgets/password_tile.dart';

class PasswordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    return Obx(() => Container(
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: getCount(passwordController),
            itemBuilder: (context, index) {
              return PasswordTile(
                index: index,
              );
            },
          ),
        ));
  }
}

getCount(controller) {
  int len = controller.passwordData["Passwords"]!.results.length;
  if (len < 5) {
    return len;
  } else {
    return 5;
  }
}
