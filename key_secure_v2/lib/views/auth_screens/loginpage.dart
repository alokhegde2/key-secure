import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/auth_controller/login_controller.dart';
import 'package:key_secure_v2/main.dart';
import 'package:key_secure_v2/services/auth_services/login_services.dart';
import 'package:key_secure_v2/widgets/auth_widgets/error.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  //email controller get email of user
  final _emailController = TextEditingController();
  //password controller to get password from user
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed("/welcome");
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                Obx(
                  () => TextFormField(
                    controller: _passwordController,
                    obscureText: (loginController.isPasswordVisibile.value)
                        ? false
                        : true,
                    keyboardType: TextInputType.visiblePassword,
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
                ),
                SizedBox(
                  height: 20.0,
                ),
                Obx(
                  () => Container(
                    child: (loginController.isError.value)
                        ? Center(
                            child: ErrorMessage(
                                error: loginController.error.value),
                          )
                        : null,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    // Get.toNamed('/master-pass');
                    // print(box.read("email"));
                    var email = _emailController.text;
                    var password = _passwordController.text;
                    submitDetails(email, password, loginController, context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Obx(
                        () => Text(
                          "${loginController.buttonText.value}",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
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
    );
  }
}

submitDetails(email, password, controller, context) async {
  controller.setButtonText("Verifying...");
  if (!email.contains(RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))) {
    controller.setError("Invalid Email");
    controller.setButtonText("Sign In");
    return;
  } else if (password.length < 6) {
    controller.setError("Invaid Password");
    controller.setButtonText("Sign In");
    return;
  }
  var response = await LoginServices().loginUser(email, password);
  if (response.body["message"] == "User is not verified") {
    controller.setButtonText("Sign In");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Please verify mail to continue...",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Please create master to continue...",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
    Get.offAllNamed("/master");
  } else if (response.statusCode == 400) {
    controller.setError("${response.body["message"]}");
    controller.setButtonText("Sign In");
  } else if (response.statusCode == 200) {
    controller.setButtonText("Logged In");
    controller.success();
    var authToken = response.body["authToken"];
    box.write("auth-token", authToken);
    Get.offAllNamed('/master-pass');
  }
}
