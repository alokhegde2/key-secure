import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/password_controller/new_password_controller.dart';
import 'package:key_secure_v2/controller/password_controller/select_app_controller.dart';

class NewPassword extends StatelessWidget {
  NewPassword({Key? key}) : super(key: key);
  final _appNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final newPassController = Get.put(NewPasswordController());
    final selectAppController = Get.put(SelectAppController());
    return Scaffold(
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
            onPressed: () {},
            icon: Icon(Icons.check),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: _appNameController,
                decoration: InputDecoration(
                  labelText: "App Name",
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: "Key Secure",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: "example@gmail.com",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: "johndoe",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: "password",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {},
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
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
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
                        isSelected: (newPassController.selectedCategory.value ==
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
                        isSelected: (newPassController.selectedCategory.value ==
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
                        isSelected: (newPassController.selectedCategory.value ==
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
                        isSelected: (newPassController.selectedCategory.value ==
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
                        isSelected: (newPassController.selectedCategory.value ==
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
                        isSelected: (newPassController.selectedCategory.value ==
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
                        isSelected: (newPassController.selectedCategory.value ==
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
                        isSelected: (newPassController.selectedCategory.value ==
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
                        isSelected: (newPassController.selectedCategory.value ==
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
                        isSelected: (newPassController.selectedCategory.value ==
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
                        isSelected: (newPassController.selectedCategory.value ==
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
              Text(
                "Select Application :",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  _showModal(context, selectAppController, _searchController);
                  // ShowModal();
                },
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  height: 60.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              )
            ],
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

_showModal(BuildContext context, controller, searchController) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: searchController,
              onChanged: (value) {
                controller.searchQuery(value);
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey),
                hintText: "Type App Name",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
