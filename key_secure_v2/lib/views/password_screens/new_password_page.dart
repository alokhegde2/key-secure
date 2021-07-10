import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/password_controller/new_password_controller.dart';
import 'package:key_secure_v2/controller/password_controller/password_controller.dart';
import 'package:key_secure_v2/services/password_service/password_generator.dart';
import 'package:key_secure_v2/services/password_service/password_service.dart';
import 'package:key_secure_v2/widgets/snack_bar.dart';

class NewPassword extends StatelessWidget {
  NewPassword({Key? key}) : super(key: key);
  final _appNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _notesController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final newPassController = Get.put(NewPasswordController());
    final passwordController = Get.put(PasswordController());
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("Add Password"),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close),
          ),
          actions: [
            IconButton(
              onPressed: () {
                var title = _appNameController.text;
                var email = _emailController.text;
                var username = _usernameController.text;
                var password = _passwordController.text;
                var note = _notesController.text;
                var category = newPassController.selectedCategory.value;
                if (newPassController.isButtonEnabled.value) {
                  if (_formKey.currentState!.validate()) {
                    _submitPassword(
                        title,
                        email,
                        username,
                        password,
                        note,
                        category,
                        newPassController,
                        passwordController,
                        context);
                  }
                }
              },
              icon: Icon(Icons.check),
            ),
          ],
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _appNameController,
                  validator: (value) {
                    if (value!.length < 2) {
                      return "App Name should be geater than 2 character ";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "App Name",
                    labelStyle: GoogleFonts.poppins(color: Colors.grey),
                    hintText: "Key Secure",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: GoogleFonts.poppins(color: Colors.grey),
                    hintText: "example@gmail.com",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: GoogleFonts.poppins(color: Colors.grey),
                    hintText: "johndoe",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: (newPassController.isPasswordVisible.value)
                      ? false
                      : true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: GoogleFonts.poppins(color: Colors.grey),
                    hintText: "password",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () {
                        newPassController.togglePasswordVisibility();
                      },
                      icon: Icon((newPassController.isPasswordVisible.value)
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    _passwordController.text = generatePassword();
                  },
                  child: Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        "Generate Password",
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Select Category :",
                  style: GoogleFonts.poppins(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Obx(
                  () => Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      InkWell(
                        onTap: () {
                          newPassController.changeSelectedCategory("Social");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Social",
                          isSelected:
                              (newPassController.selectedCategory.value ==
                                      "Social")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          newPassController.changeSelectedCategory("Finance");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Finance",
                          isSelected:
                              (newPassController.selectedCategory.value ==
                                      "Finance")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          newPassController
                              .changeSelectedCategory("Entertainment");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Entertainment",
                          isSelected:
                              (newPassController.selectedCategory.value ==
                                      "Entertainment")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          newPassController
                              .changeSelectedCategory("Food & Drink");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Food & Drink",
                          isSelected:
                              (newPassController.selectedCategory.value ==
                                      "Food & Drink")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          newPassController.changeSelectedCategory("Education");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Education",
                          isSelected:
                              (newPassController.selectedCategory.value ==
                                      "Education")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          newPassController.changeSelectedCategory("Dating");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Dating",
                          isSelected:
                              (newPassController.selectedCategory.value ==
                                      "Dating")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          newPassController.changeSelectedCategory("Design");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Design",
                          isSelected:
                              (newPassController.selectedCategory.value ==
                                      "Design")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          newPassController.changeSelectedCategory("Business");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Business",
                          isSelected:
                              (newPassController.selectedCategory.value ==
                                      "Business")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          newPassController.changeSelectedCategory("Games");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Games",
                          isSelected:
                              (newPassController.selectedCategory.value ==
                                      "Games")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          newPassController.changeSelectedCategory("Shopping");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Shopping",
                          isSelected:
                              (newPassController.selectedCategory.value ==
                                      "Shopping")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          newPassController.changeSelectedCategory("Others");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Others",
                          isSelected:
                              (newPassController.selectedCategory.value ==
                                      "Others")
                                  ? true
                                  : false,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _notesController,
                  decoration: InputDecoration(
                    labelText: "Note",
                    labelStyle: GoogleFonts.poppins(color: Colors.grey),
                    hintText: "Write some note",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final title;
  final bool isSelected;
  const CategoryButton(
      {Key? key, required this.title, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: (isSelected) ? Colors.green.withOpacity(0.5) : null,
        border: Border.all(color: kMainColor, width: (isSelected) ? 0 : 2.0),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Text(title),
    );
  }
}

_submitPassword(title, email, username, password, note, category, controller,
    passController, context) async {
  controller.toggleButton();
  var response = await PasswordService().createPassword(
    title,
    username,
    password,
    category,
    note,
    email,
  );

  if (response.statusCode == 200) {
    controller.toggleButton();
    successSnack("Password Created Successfully", context);
    passController.onInit();
    Get.back();
  } else if (response.statusCode == 400) {
    controller.toggleButton();
    errorSnack("${response.body.message}", context);
  } else if (response.statusCode == 401) {
    controller.toggleButton();
    errorSnack("${response.body.message}", context);
  } else {
    controller.toggleButton();
    errorSnack("Some unknown error occured", context);
  }
}
