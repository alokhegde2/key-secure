import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
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
            headline1: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.grey.shade800,
          ),
          snackBarTheme: SnackBarThemeData(backgroundColor: Colors.grey.shade800,contentTextStyle: TextStyle(color: Colors.white)),
          primaryIconTheme: IconThemeData(color: Colors.white),
          cardTheme: CardTheme(color: Colors.grey.shade800),
          brightness: Brightness.dark),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
