import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_secure_v2/controller/password_controller/password_controller.dart';
import 'package:key_secure_v2/models/password_model.dart';

class SearchBar extends SearchDelegate<Password> {
  final passwordController = Get.put(PasswordController());
  SearchBar()
      : super(
          searchFieldLabel: "Enter name of application",
          searchFieldStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
        );
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(CupertinoIcons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final passList = query.isEmpty
        ? passwordController.passwordData["Passwords"]!.results
        : passwordController.passwordData["Passwords"]!.results
            .where(
              (element) => element.title.toLowerCase().startsWith(
                    query.toLowerCase(),
                  ),
            )
            .toList();

    return passList.isEmpty
        ? Center(
            child: Text(
              "No Result Found",
            ),
          )
        : ListView.builder(
            itemCount: passList.length,
            itemBuilder: (context, index) {
              final password = passList[index];
              return ListTile(
                onTap: () {
                  Get.toNamed('/password/details', parameters: {
                    "title": password.title,
                    "emailId": password.emailId,
                    "username": password.username,
                    "category": password.category,
                    "password": password.password,
                    "image": password.image,
                    "note": password.note,
                    "id": password.id,
                  });
                },
                title: Text(password.title),
              );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final passList = query.isEmpty
        ? passwordController.passwordData["Passwords"]!.results
        : passwordController.passwordData["Passwords"]!.results
            .where(
              (element) => element.title.toLowerCase().startsWith(
                    query.toLowerCase(),
                  ),
            )
            .toList();

    return passList.isEmpty
        ? Center(
            child: Text(
              "No Result Found",
            ),
          )
        : ListView.builder(
            itemCount: passList.length,
            itemBuilder: (context, index) {
              final password = passList[index];
              return ListTile(
                onTap: () {
                  Get.toNamed('/password/details', parameters: {
                    "title": password.title,
                    "emailId": password.emailId,
                    "username": password.username,
                    "category": password.category,
                    "password": password.password,
                    "image": password.image,
                    "note": password.note,
                    "id": password.id,
                  });
                },
                title: Text(password.title),
              );
            },
          );
  }
}
