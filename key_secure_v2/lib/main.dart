import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/services/theme_services.dart';
import 'package:key_secure_v2/themes/themes.dart';
import 'package:key_secure_v2/views/auth_screens/loginpage.dart';
import 'package:key_secure_v2/views/homepage.dart';
import 'package:key_secure_v2/views/searchpage.dart';
import 'package:key_secure_v2/views/settings.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Key Secure',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeServices().getThemeMode(),
      home: AnimatedSplashScreen(
        splash: "assets/logo/logo.png",
        backgroundColor: kMainColor,
        nextScreen: LoginPage(),
        animationDuration: Duration(seconds: 4),
        splashTransition: SplashTransition.fadeTransition,
      ),
      // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      // initialRoute: '/',
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/settings',
          page: () => Settings(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/search',
          page: () => SearchPage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          transition: Transition.rightToLeft,
        ),
      ],
    );
  }
}
