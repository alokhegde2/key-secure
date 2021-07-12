import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/password_controller/password_controller.dart';
import 'package:key_secure_v2/widgets/categories/category_grid.dart';
import 'package:key_secure_v2/widgets/search_widgets/search.dart';
import 'package:key_secure_v2/widgets/search_widgets/search_bar.dart';
import 'package:key_secure_v2/widgets/user_widgets/unauthorized_widget.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final passwordCotroller = Get.put(PasswordController());
    return Obx(
      () => (passwordCotroller.isLogedIn.value)
          ? Scaffold(
              body: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(10.0),
                            onTap: () {
                              showSearch(
                                  context: context, delegate: SearchBar());
                            },
                            child: Search(
                              width: MediaQuery.of(context).size.width * 0.75,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Categories :",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CategoryGrid()
                    ],
                  ),
                ),
              ),
            )
          : Unauthorized(),
    );
  }
}
