import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/controllers/password_controller.dart';
import 'package:key_secure/views/add_password.dart';
import 'package:key_secure/views/all_items.dart';
import 'package:key_secure/views/auth/login/master_pass.dart';
import 'package:key_secure/views/settings.dart';
import 'package:key_secure/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.gear_alt),
          onPressed: () {
            Get.to(
              Settings(),
            );
          },
        ),
        title: InkWell(
          onTap: () {
            Get.to(MasterPass());
          },
          child: Text(
            "Key Secure",
            style: GoogleFonts.ubuntu(color: Colors.white),
          ),
        ),
        // centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBar());
            },
          ),
          IconButton(
              icon: Icon(CupertinoIcons.add),
              onPressed: () {
                Get.to(AddPassword());
              }),
          PopupMenuButton(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(CupertinoIcons.ellipsis_vertical),
            )),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Refresh"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Settings"),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 1:
                  passwordController.onInit();
                  break;
                case 2:
                  print("Value 2");
                  break;
                default:
              }
            },
          ),
        ],
      ),
      body: Obx(
        () => (passwordController.passwordList.length != 0)
            ? AllItems()
            : Center(
                child: Text("Nothing Found"),
              ),
      ),
    );
  }
}
