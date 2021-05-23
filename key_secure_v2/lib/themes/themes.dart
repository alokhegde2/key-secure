import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: GoogleFonts.poppins(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
      ),
      titleTextStyle: GoogleFonts.poppins(color: Colors.black),
      elevation: 0,
    ),
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      color: Colors.grey[900],
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
    ),
  );
}
