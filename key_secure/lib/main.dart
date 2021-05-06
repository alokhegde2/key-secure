import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:key_secure/views/auth/main_auth.dart';
import 'package:key_secure/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        nextScreen: MainAuth(),
        splashIconSize: 400.0,
        splash: Image.asset('assets/logo/logo1.png'),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
