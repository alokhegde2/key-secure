import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_secure_v2/widgets/categories/category_pass_list.dart';

class CategoryPassPage extends StatelessWidget {
  CategoryPassPage({Key? key}) : super(key: key);

  final catName = Get.parameters["query"];
  final title = Get.parameters["title"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: CategoryPassList(
            catName: catName,
          ),
        ),
      ),
    );
  }
}
