import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/password_controller/password_controller.dart';
import 'package:key_secure_v2/services/password_service/password_service.dart';
import 'package:key_secure_v2/widgets/categories/category_pass_tile.dart';

import '../snack_bar.dart';

class CategoryPassList extends StatelessWidget {
  final catName;
  const CategoryPassList({Key? key, required this.catName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    final catItemList = passwordController.passwordData["Passwords"]!.results
        .where((element) => element.category
            .toLowerCase()
            .startsWith(catName.toString().toLowerCase()))
        .toList();
    return Container(
      child: (catItemList.length <= 0)
          ? Center(
              child: Text(
                "No Passwords Found",
                style: GoogleFonts.poppins(
                    fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: catItemList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(passwordController
                      .passwordData["Passwords"]!.results[index].id),
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) {
                    return _showDialog(
                      context,
                      direction,
                      catItemList[index].title,
                      catItemList[index].id,
                      passwordController,
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 20.0),
                    alignment: AlignmentDirectional.centerStart,
                    child: Icon(
                      Icons.delete,
                      size: 30.0,
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(right: 20.0),
                    alignment: AlignmentDirectional.centerEnd,
                    child: Icon(
                      Icons.delete,
                      size: 30.0,
                    ),
                  ),
                  child: CategoryPassTile(
                    index: index,
                    catList: catItemList,
                  ),
                );
              },
            ),
    );
  }
}

Future<bool?> _showDialog(
    context, DismissDirection direction, title, id, controller) async {
  return Get.defaultDialog(
      title: "Confirm Delete",
      middleText: "Do you want to delete $title",
      actions: [
        TextButton(
          onPressed: () {
            Get.back(result: true);
            _deletePassword(id, controller, context);
          },
          child: Text("Delete"),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: false);
          },
          child: Text("Cancel"),
        ),
      ]);
}

_deletePassword(id, controller, context) async {
  var response = await PasswordService().deletePassword(id);
  if (response.statusCode == 200) {
    successSnack("Password Deleted !", context);
    controller.onInit();
    Get.back();
  } else if (response.statusCode == 400) {
    errorSnack("${response.body.message}", context);
  } else if (response.statusCode == 401) {
    errorSnack("${response.body.message}", context);
  } else {
    controller.toggleButton();
    errorSnack("Some Unknown Error Occured !", context);
  }
}
