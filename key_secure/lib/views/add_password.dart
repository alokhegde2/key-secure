import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/models/images.dart';
import 'package:key_secure/models/password.dart';
import 'package:key_secure/services/generate_password.dart';
import 'package:http/http.dart' as http;
import 'package:key_secure/views/home_page.dart';

class AddPassword extends StatefulWidget {
  @override
  _AddPasswordState createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  bool isPasswordVisible = false;

  var tag = "";

  final TextEditingController _appNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _notesController = TextEditingController();

  final TextEditingController _dropdownController = TextEditingController();


  Future<int> attemptSignUp(
      String appName,
      String appMailId,
      String appPassword,
      String appUserId,
      String appType,
      String note,
      String userId) async {
    Map data = {
      "appName": appName,
      "appMailId": appMailId,
      "appPassword": appPassword,
      "appUserId": appUserId,
      "appType": appType,
      "note": note,
      "userId": userId
    };

    String body = json.encode(data);

    var res = await http.post(
      Uri.parse('http://192.168.43.173:3000/api/v1/password/newPass'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    return res.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add a Password",
          style: GoogleFonts.ubuntu(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(CupertinoIcons.multiply_circle),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.checkmark_alt_circle),
            onPressed: () async {
              var appName = _appNameController.text;
              var appMailId = _emailController.text;
              var appPassword = _passwordController.text;
              var appUserId = _usernameController.text;
              var appType = _dropdownController.text;
              var note = _notesController.text;
              var userId = "6086f087adf8bf3424919baa";

              var res = await attemptSignUp(appName, appMailId, appPassword,
                  appUserId, appType, note, userId);
              if (res == 200) {
                Get.off(HomePage());
              }
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              controller: _appNameController,
              decoration: InputDecoration(
                labelText: "App Name",
                labelStyle: TextStyle(color: Colors.grey),
                hintText: "Facebook",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.grey),
                hintText: "example@gmail.com",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(color: Colors.grey),
                hintText: "johndoe",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: _passwordController,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.grey),
                hintText: "password",
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(
                      (isPasswordVisible)
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                      color: Colors.grey),
                  onPressed: () {
                    setState(
                      () {
                        (isPasswordVisible)
                            ? isPasswordVisible = false
                            : isPasswordVisible = true;
                      },
                    );
                  },
                ),
              ),
              obscureText: (isPasswordVisible) ? false : true,
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _passwordController.text = generatePassword();
                });
              },
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text("Generate Password"),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(
                labelText: "Notes",
                labelStyle: TextStyle(color: Colors.grey),
                hintText: "This is the some...",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "Tags",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: _dropdownController,
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: PopupMenuButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  onSelected: (String value) {
                    _dropdownController.text = value;
                  },
                  itemBuilder: (BuildContext context) {
                    return tags.map<PopupMenuItem<String>>(
                      (String value) {
                        return new PopupMenuItem(
                          child: new Text(value),
                          value: value,
                        );
                      },
                    ).toList();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "* Select with the help of dropdown icon .",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
