import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/network_controller.dart';
import 'package:key_secure_v2/controller/password_controller/password_controller.dart';
import 'package:key_secure_v2/widgets/categories/category_list.dart';
import 'package:key_secure_v2/widgets/header.dart';
import 'package:key_secure_v2/widgets/password_widgets/password_list.dart';
import 'package:key_secure_v2/widgets/password_widgets/password_shimmer.dart';
import 'package:key_secure_v2/widgets/search_widgets/search.dart';
import 'package:key_secure_v2/widgets/search_widgets/search_bar.dart';
import 'package:key_secure_v2/widgets/user_widgets/unauthorized_widget.dart';

import 'error_screens/no_connection.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    var networkController = Get.put(NetworkConnectivityController());

    return Obx(
      () => DoubleBack(
        message: "Press back again to close",
        child: (passwordController.isLogedIn.value)
            ? (networkController.connectionStatus.value != 0)
                ? (passwordController.isLoading.value)
                    ? PasswordShimmer()
                    : Scaffold(
                        floatingActionButton: FloatingActionButton(
                          onPressed: () {
                            Get.toNamed('/password/new');
                          },
                          child: Icon(CupertinoIcons.add),
                          backgroundColor: Colors.redAccent,
                        ),
                        body: SafeArea(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: RefreshIndicator(
                              onRefresh: () {
                                return reLoadPage(passwordController);
                              },
                              child: ListView(
                                children: [
                                  Header(),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(10.0),
                                    onTap: () {
                                      showSearch(
                                        context: context,
                                        delegate: SearchBar(),
                                      );
                                    },
                                    child: Search(
                                        width:
                                            MediaQuery.of(context).size.width),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "All Passwords :",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.toNamed('/password/all');
                                        },
                                        child: Text("View All"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  PasswordList(
                                    count: 5,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                : Scaffold(
                    body: SafeArea(
                      child: NoConnection(
                        controller: "passwordController",
                        fromRoute: "/home",
                      ),
                    ),
                  )
            : Unauthorized(),
      ),
    );
  }
}

reLoadPage(controller) {
  return controller.fetchPassword();
}
