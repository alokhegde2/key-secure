import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure/controllers/password_controller.dart';
import 'package:key_secure/models/images.dart';
import 'package:key_secure/models/password.dart';
import 'package:key_secure/services/generate_password.dart';
import 'package:key_secure/services/remote_services.dart';
import 'package:key_secure/views/home_page.dart';

class UpdatePassword extends StatefulWidget {
  final Password passwordList;

  const UpdatePassword(this.passwordList);
  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  bool isPasswordVisible = false;

  var tag = "";

  TextEditingController _appNameController;

  TextEditingController _emailController;

  TextEditingController _usernameController;

  TextEditingController _passwordController;

  TextEditingController _notesController;

  TextEditingController _dropdownController;

  @override
  void initState() {
    _appNameController =
        TextEditingController(text: widget.passwordList.appName);
    _emailController =
        TextEditingController(text: widget.passwordList.appMailId);
    _usernameController =
        TextEditingController(text: widget.passwordList.appUserId);
    _passwordController =
        TextEditingController(text: widget.passwordList.appPassword);
    _notesController = TextEditingController(text: widget.passwordList.note);
    _dropdownController =
        TextEditingController(text: widget.passwordList.appType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update a Password",
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
              if (_emailController.text.length == 0 ||
                  _appNameController.text.length == 0 ||
                  _passwordController.text.length == 0 ||
                  _usernameController.text.length == 0 ||
                  _dropdownController.text.length == 0 ||
                  _notesController.text.length == 0) {
                print("Error");
              } else{
              int response = await RemoteServices.attemptUpdatePass(
                  _appNameController.text,
                  _emailController.text,
                  _passwordController.text,
                  _usernameController.text,
                  _dropdownController.text,
                  _notesController.text,
                  widget.passwordList.userId,
                  widget.passwordList.id,
                  false);
               if (response == 400) {
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                  content: Text(
                    'The password cannot be updated!',
                    textAlign: TextAlign.center,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else if (response == 200) {
                passwordController.onInit();
                Get.off(HomePage());
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.green,
                  content: Text(
                    'Password updated!',
                    textAlign: TextAlign.center,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }}
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextFormField(
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
            TextField(
              controller: _passwordController,
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
