import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:key_secure_v2/widgets/header.dart';
import 'package:key_secure_v2/widgets/search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 30.0,
              ),
              Search(),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// RaisedButton(
//   onPressed: () {
//     ThemeServices().changeThemeMode();
//   },
//   child: Text("Change theme"),
// ),
