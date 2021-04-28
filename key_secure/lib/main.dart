import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
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
        colorScheme: ColorScheme(
            primary: Colors.redAccent,
            primaryVariant: Colors.blueAccent,
            secondary: Colors.grey.shade900,
            secondaryVariant: Colors.grey.shade600,
            surface: Colors.grey,
            background: Colors.grey.shade900,
            error: Colors.redAccent,
            onPrimary: Colors.amberAccent,
            onSecondary: Colors.amberAccent,
            onSurface: Colors.redAccent,
            onBackground: Colors.grey.shade900,
            onError: Colors.redAccent,
            brightness: Brightness.dark),
        scaffoldBackgroundColor: Colors.grey.shade900,
        appBarTheme: AppBarTheme(color: Colors.grey.shade900),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
