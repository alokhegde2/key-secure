import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPassword extends StatelessWidget {
  final TextEditingController _appNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Password",style: GoogleFonts.ubuntu(color:Colors.white),),
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
            )
          ],
        ),
      ),
    );
  }
}
