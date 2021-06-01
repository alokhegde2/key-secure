import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/password_controller.dart';
import 'package:key_secure_v2/widgets/categories/category_list.dart';
import 'package:key_secure_v2/widgets/header.dart';
import 'package:key_secure_v2/widgets/passwords/password_list.dart';
import 'package:key_secure_v2/widgets/search.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(CupertinoIcons.add),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: RefreshIndicator(
            onRefresh: () {
              return passwordController.fetchPassword();
            },
            child: ListView(
              children: [
                Header(),
                SizedBox(
                  height: 30.0,
                ),
                Search(width: MediaQuery.of(context).size.width),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories :",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/search');
                      },
                      child: Text("View All"),
                    ),
                  ],
                ),
                CategoryList(),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "All Passwords :",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                PasswordList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// RaisedButton(
//   onPressed: () {
//     ThemeServices().changeThemeMode();
//   },
//   child: Text("Change theme"),
// ),
