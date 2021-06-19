import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/user_controller/update_user_controller.dart';
import 'package:key_secure_v2/controller/user_controller/user_controller.dart';
import 'package:key_secure_v2/widgets/user_widgets/unauthorized_widget.dart';

class UpdateUser extends StatelessWidget {
  UpdateUser({Key? key}) : super(key: key);
  final name = Get.parameters["name"];
  final avatar = Get.parameters["avatar"];
  final String imgUrl =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png";
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var userController = Get.put(UserController());
    var updateUserController = Get.put(UpdateUserController());

    return Obx(
      () => (userController.isLogedIn.value)
          ? Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close),
                ),
                title: Text("Edit Profile"),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.check,
                      color: kMainColor,
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                minimum: EdgeInsets.symmetric(horizontal: 5.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding,
                  ),
                  child: ListView(
                    children: [
                      Center(
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            image: DecorationImage(
                              image:
                                  (updateUserController.uploadedImage.value ==
                                          "")
                                      ? NetworkImage(
                                          (userController.userData["user"]!
                                                      .avatar ==
                                                  "")
                                              ? imgUrl
                                              : userController
                                                  .userData["user"]!.avatar,
                                        )
                                      : FileImage(
                                          File(updateUserController
                                              .uploadedImage.value),
                                        ) as ImageProvider,
                              fit: BoxFit.fill,
                            ),
                            color: Colors.amber,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    _showModel(
                                        context, picker, updateUserController);
                                  },
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: kMainColor,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.camera_outlined,
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Unauthorized(),
    );
  }
}

Future _getFileImage(picker, controller) async {
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    File image = File(pickedFile.path);
    // print(pickedFile.path);
    controller.uploadImage(image.path);
    print(image.path);
  } else {
    print('No image selected.');
  }
}

Future _getCameraImage(picker, controller) async {
  final pickedFile = await picker.getImage(source: ImageSource.camera);

  if (pickedFile != null) {
    File image = File(pickedFile.path);
    // print(pickedFile.path);
    controller.uploadImage(image.path);
    print(image.path);
  } else {
    print('No image selected.');
  }
}

_showModel(
  BuildContext context,
  picker,
  controller,
) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200.0,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "Select avatar from",
                style: GoogleFonts.poppins(
                    fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: IconButton(
                          onPressed: () {
                            _getCameraImage(picker, controller);
                            Get.back();
                          },
                          icon: Icon(
                            Icons.camera_outlined,
                            size: 50.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Camera",
                        style: GoogleFonts.poppins(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: IconButton(
                          onPressed: () {
                            _getFileImage(picker, controller);
                            Get.back();
                          },
                          icon: Icon(
                            CupertinoIcons.folder_badge_plus,
                            size: 50.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "File",
                        style: GoogleFonts.poppins(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
