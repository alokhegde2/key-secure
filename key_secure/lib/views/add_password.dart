import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPassword extends StatefulWidget {
  @override
  _AddPasswordState createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  bool isPasswordVisible = false;

  bool _isSelected = false;

  var tag = "";

  final TextEditingController _appNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _notesController = TextEditingController();

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
            onPressed: () {},
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
                setState(() {});
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
            InputChip(
              padding: EdgeInsets.all(2.0),
              label: Text(
                'Flutter Devs',
                style:
                    TextStyle(color: _isSelected ? Colors.black : Colors.white),
              ),
              selected: _isSelected,
              selectedColor: Colors.tealAccent,
              onSelected: (bool selected) {
                setState(() {
                  _isSelected = selected;
                  tag = "Message";
                  print(tag);
                });
              },
            ),
            InputChip(
              padding: EdgeInsets.all(2.0),
              label: Text(
                'Facebook',
                style:
                    TextStyle(color: _isSelected ? Colors.black : Colors.white),
              ),
              selected: _isSelected,
              selectedColor: Colors.tealAccent,
              onSelected: (bool selected) {
                setState(() {
                  _isSelected = selected;
                  tag = "Message";
                  print(tag);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
