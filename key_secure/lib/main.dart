import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:key_secure/views/auth/login/master_pass.dart';
import 'package:key_secure/views/auth/main_auth.dart';
import 'package:key_secure/views/home_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

final box = GetStorage();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Future<String> get jwtOrEmpty async {
    var jwt = await box.read("jwt");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade900,
        primaryColor: Colors.grey,
        accentColor: Colors.tealAccent,
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.white),
            color: Colors.grey.shade800),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade800,
        ),
        snackBarTheme: SnackBarThemeData(
            backgroundColor: Colors.grey.shade800,
            contentTextStyle: TextStyle(color: Colors.white)),
        primaryIconTheme: IconThemeData(color: Colors.white),
        cardTheme: CardTheme(color: Colors.grey.shade800),
        brightness: Brightness.dark,
      ),
      home: AnimatedSplashScreen(
        duration: 4000,
        backgroundColor: Colors.grey.shade900,
        nextScreen: FutureBuilder(
        future: jwtOrEmpty,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.data != "") {
            var str = snapshot.data;
            var jwt = str.split(".");

            if (jwt.length != 3) {
              return MainAuth();
            } else {
              var payload = json.decode(
                ascii.decode(
                  base64.decode(
                    base64.normalize(jwt[1]),
                  ),
                ),
              );
              if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000)
                  .isAfter(DateTime.now())) {
                return MasterPass();
              } else {
                return MainAuth();
              }
            }
          } else {
            return MainAuth();
          }
        }),
        splashIconSize: 200.0,
        splash: Hero(
          tag: "logo1",
          child: Image.asset('assets/logo/logo.png'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
