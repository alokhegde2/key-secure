import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_secure/controllers/password_controller.dart';
import 'package:key_secure/models/password.dart';
import 'package:key_secure/views/password_details.dart';

class SearchBar extends SearchDelegate<Password> {
  final passwordController = Get.put(PasswordController());

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
      icon: Icon(CupertinoIcons.chevron_left),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty
        ? passwordController.passwordList
        : passwordController.passwordList
            .where(
              (element) => element.appName.toLowerCase().startsWith(
                    query.toLowerCase(),
                  ),
            )
            .toList();
    return mylist.isEmpty
        ? Center(
            child: Text(
              "No Result Found",
            ),
          )
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              final Password password = mylist[index];
              return ListTile(
                onTap: () {
                  Get.to(
                    PasswordDeails(password),
                  );
                },
                title: Text(password.appName),
              );
            },
          );
  }
}
