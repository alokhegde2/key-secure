import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/services/theme_services.dart';
import 'package:key_secure_v2/themes/themes.dart';
import 'package:key_secure_v2/views/auth_screens/forgot_master_pass.dart';
import 'package:key_secure_v2/views/auth_screens/forgot_passwordpage.dart';
import 'package:key_secure_v2/views/auth_screens/loginpage.dart';
import 'package:key_secure_v2/views/auth_screens/mail_sentpage.dart';
import 'package:key_secure_v2/views/auth_screens/new_master_password.dart';
import 'package:key_secure_v2/views/auth_screens/verify_master_pass.dart';
import 'package:key_secure_v2/views/auth_screens/registerpage.dart';
import 'package:key_secure_v2/views/auth_screens/success.dart';
import 'package:key_secure_v2/views/auth_screens/welcomepage.dart';
import 'package:key_secure_v2/views/homepage.dart';
import 'package:key_secure_v2/views/searchpage.dart';
import 'package:key_secure_v2/views/settings.dart';
import 'package:key_secure_v2/views/user_screens/change_master_pass_page.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

final box = GetStorage();

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
        duration: 3000,
        splash: "assets/logo/logo.png",
        backgroundColor: kMainColor,
        nextScreen: verify(),
        animationDuration: Duration(seconds: 3),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.rightToLeft,
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
        GetPage(
          name: '/register',
          page: () => RegisterPage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/forgot-pass',
          page: () => ForgotPassword(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/mail-sent',
          page: () => MailSent(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/welcome',
          page: () => WelcomePage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/master-pass',
          page: () => MasterPass(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/forgot-master-pass',
          page: () => ForgotMasterPass(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/master',
          page: () => MasterPassword(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/success',
          page: () => Success(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/user/change-master',
          page: () => ChangeMasterPass(),
          transition: Transition.rightToLeft,
        ),
      ],
    );
  }
}

verify() {
  var token = box.read("auth-token");

  if (token == null) {
    return WelcomePage();
  }

  /* decode() method will decode your token's payload */
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

  /* isExpired() - you can use this method to know if your token is already expired or not.
  An useful method when you have to handle sessions and you want the user
  to authenticate if has an expired token */
  bool isTokenExpired = JwtDecoder.isExpired(token);

  if (isTokenExpired) {
    return WelcomePage();
  } else {
    //Storing id and email to the storage
    box.write("id", decodedToken["id"]);
    box.write("email", decodedToken["email"]);
    return MasterPass();
  }
}
