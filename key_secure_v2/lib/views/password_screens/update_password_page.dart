import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/controller/password_controller/password_controller.dart';
import 'package:key_secure_v2/controller/password_controller/update_password_controller.dart';
import 'package:key_secure_v2/services/password_service/password_generator.dart';
import 'package:key_secure_v2/services/password_service/password_service.dart';
import 'package:key_secure_v2/widgets/snack_bar.dart';

import '../../constants.dart';

class UpdatePasswordPage extends StatelessWidget {
  UpdatePasswordPage({Key? key}) : super(key: key);
  final title = Get.parameters["title"].toString();
  final emailId = Get.parameters["emailId"].toString();
  final username = Get.parameters["username"].toString();
  final category = Get.parameters["category"].toString();
  final password = Get.parameters["password"].toString();
  final note = Get.parameters["note"].toString();
  final id = Get.parameters["id"].toString();
  final _appNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _notesController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _appNameController.text = title;
    _emailController.text = emailId;
    _usernameController.text = username;
    _passwordController.text = password;
    _notesController.text = note;
    final updatePassController = Get.put(UpdatePassController());
    final passwordController = Get.put(PasswordController());
    updatePassController.changeSelectedCategory(category);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("Update Password"),
          actions: [
            IconButton(
              onPressed: () {
                var title = _appNameController.text;
                var email = _emailController.text;
                var username = _usernameController.text;
                var password = _passwordController.text;
                var note = _notesController.text;
                var category = updatePassController.selectedCategory.value;
                if (updatePassController.isButtonEnabled.value) {
                  if (_formKey.currentState!.validate()) {
                    _updatePassword(
                      title,
                      email,
                      username,
                      password,
                      note,
                      category,
                      id,
                      updatePassController,
                      passwordController,
                      context,
                    );
                  }
                }
              },
              icon: Icon((updatePassController.isLoading.value)
                  ? CupertinoIcons.hourglass
                  : Icons.check),
            ),
          ],
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
                  obscureText: (updatePassController.isPasswordVisible.value)
                      ? false
                      : true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: GoogleFonts.poppins(color: Colors.grey),
                    hintText: "password",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () {
                        updatePassController.togglePasswordVisibility();
                      },
                      icon: Icon((updatePassController.isPasswordVisible.value)
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
                          updatePassController.changeSelectedCategory("Social");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Social",
                          isSelected:
                              (updatePassController.selectedCategory.value ==
                                      "Social")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          updatePassController
                              .changeSelectedCategory("Finance");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Finance",
                          isSelected:
                              (updatePassController.selectedCategory.value ==
                                      "Finance")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          updatePassController
                              .changeSelectedCategory("Entertainment");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Entertainment",
                          isSelected:
                              (updatePassController.selectedCategory.value ==
                                      "Entertainment")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          updatePassController
                              .changeSelectedCategory("Food & Drink");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Food & Drink",
                          isSelected:
                              (updatePassController.selectedCategory.value ==
                                      "Food & Drink")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          updatePassController
                              .changeSelectedCategory("Education");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Education",
                          isSelected:
                              (updatePassController.selectedCategory.value ==
                                      "Education")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          updatePassController.changeSelectedCategory("Dating");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Dating",
                          isSelected:
                              (updatePassController.selectedCategory.value ==
                                      "Dating")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          updatePassController.changeSelectedCategory("Design");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Design",
                          isSelected:
                              (updatePassController.selectedCategory.value ==
                                      "Design")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          updatePassController
                              .changeSelectedCategory("Business");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Business",
                          isSelected:
                              (updatePassController.selectedCategory.value ==
                                      "Business")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          updatePassController.changeSelectedCategory("Games");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Games",
                          isSelected:
                              (updatePassController.selectedCategory.value ==
                                      "Games")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          updatePassController
                              .changeSelectedCategory("Shopping");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Shopping",
                          isSelected:
                              (updatePassController.selectedCategory.value ==
                                      "Shopping")
                                  ? true
                                  : false,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          updatePassController.changeSelectedCategory("Others");
                        },
                        borderRadius: BorderRadius.circular(100.0),
                        child: CategoryButton(
                          title: "Others",
                          isSelected:
                              (updatePassController.selectedCategory.value ==
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

_updatePassword(title, email, username, password, note, category, id,
    controller, passController, context) async {
  controller.toggleButton();
  controller.toggleLoading();
  var response = await PasswordService().updatePassword(
    title,
    username,
    password,
    category,
    note,
    email,
    id,
  );

  if (response.statusCode == 200) {
    controller.toggleButton();
    controller.toggleLoading();
    successSnack("Password Updated Successfully", context);
    passController.onInit();
    Get.offNamed("/home");
  } else if (response.statusCode == 400) {
    controller.toggleLoading();
    controller.toggleButton();
    errorSnack("${response.body["message"]}", context);
  } else if (response.statusCode == 401) {
    controller.toggleLoading();
    controller.toggleButton();
    errorSnack("${response.body["message"]}", context);
  } else {
    controller.toggleLoading();
    controller.toggleButton();
    errorSnack("Some unknown error occured", context);
  }
}
