import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/controllers/password_controller.dart';
import 'package:key_secure/controllers/user_controller.dart';
import 'package:key_secure/models/images.dart';
import 'package:key_secure/services/generate_password.dart';
import 'package:key_secure/services/id_generator.dart';
import 'package:key_secure/services/remote_servces.dart';
import 'package:key_secure/views/home_page.dart';

class AddPassword extends StatefulWidget {
  @override
  _AddPasswordState createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  bool isPasswordVisible = false;
  final passwordController = Get.put(PasswordController());

  var tag = "";

  final TextEditingController _appNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _notesController = TextEditingController();

  final TextEditingController _dropdownController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final passwordController = Get.put(PasswordController());
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
              var userId = userController.userList[0].id;
              var passwordId = uniqueId().toString();

              if (_emailController.text.length == 0 ||
                  _appNameController.text.length == 0 ||
                  _passwordController.text.length == 0 ||
                  _usernameController.text.length == 0 ||
                  _dropdownController.text.length == 0 ||
                  _notesController.text.length == 0) {
                print("Error");
              } else {
                var res = await RemoteServices.attemptSignUp(appName, appMailId,
                    appPassword, appUserId, appType, note, userId);
                if (res == 200) {
                  passwordController.addNewPass(appName, appMailId, appPassword,
                      appUserId, appType, note, userId, passwordId);
                  passwordController.onInit();
                  Get.off(HomePage());
                }
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
