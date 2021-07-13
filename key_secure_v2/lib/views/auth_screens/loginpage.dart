import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/auth_controller/login_controller.dart';
import 'package:key_secure_v2/main.dart';
import 'package:key_secure_v2/services/auth_services/login_services.dart';
import 'package:key_secure_v2/views/error_screens/server_down.dart';
import 'package:key_secure_v2/widgets/snack_bar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  //email controller get email of user
  final _emailController = TextEditingController();
  //password controller to get password from user
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed("/welcome");
        return false;
      },
      child: Obx(
        () => Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Image.asset(
                        "assets/logo/logo.png",
                        height: 80,
                        width: 80.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Text(
                          "Key Secure",
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: kMainColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Text(
                        "Sign In with your email and password",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (!value!.contains(
                            RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))) {
                          return "Invalid Email";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "johndoe@gmail.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          focusColor: Colors.white,
                          prefixIcon: Icon(CupertinoIcons.mail)),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: (loginController.isPasswordVisibile.value)
                          ? false
                          : true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Enter proper password";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "*************",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        focusColor: Colors.white,
                        prefixIcon: Icon(CupertinoIcons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            loginController.togglePassword();
                          },
                          icon: Icon((loginController.isPasswordVisibile.value)
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    InkWell(
                      onTap: () {
                        var email = _emailController.text;
                        var password = _passwordController.text;
                        if (loginController.isButtonEnabled.value) {
                          if (_formKey.currentState!.validate()) {
                            _submitDetails(
                                email, password, loginController, context);
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            "${loginController.buttonText.value}",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        height: 50.0,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/forgot-pass');
                      },
                      child: Text(
                        "Forgot Password",
                        style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont't have an account?",
                          style: GoogleFonts.poppins(),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('/register');
                          },
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.poppins(
                              color: kMainColor,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_submitDetails(email, password, controller, context) async {
  controller.toggleButton(false);
  controller.setButtonText("Verifying...");
  var response = await LoginServices().loginUser(email, password);
  if (response.body["message"] == "User is not verified") {
    controller.setButtonText("Sign In");
    controller.toggleButton(true);
    errorSnack("You are not verified !", context);
    Get.offAllNamed(
      '/mail-sent',
      arguments: {
        "type": "mail confirmation",
        "button": "Try again with proper mail",
        "nextRoute": "/master",
        "sentRoute": "/register"
      },
    );
  } else if (response.body["message"] == "Master Password is not created.") {
    controller.setButtonText("Sign In");
    controller.toggleButton(true);
    errorSnack("Master Password is not created.", context);
    Get.offAllNamed("/master");
  } else if (response.statusCode == 400) {
    errorSnack("${response.body["message"]}", context);
    controller.toggleButton(true);
    controller.setButtonText("Sign In");
  } else if (response.statusCode == 200) {
    controller.setButtonText("Logged In");
    var authToken = response.body["authToken"];
    controller.toggleButton(true);
    /* decode() method will decode your token's payload */
    Map<String, dynamic> decodedToken = JwtDecoder.decode(authToken);
    box.write("id", decodedToken["id"]);
    box.write("auth-token", authToken);
    Get.offAllNamed('/master-pass');
  } else if (response.statusCode == 500) {
    errorSnack("Internal Server Error", context);
    controller.toggleButton(true);
    controller.setButtonText("Sign In");
  } else {
    Get.off(ServerDown());
  }
}
