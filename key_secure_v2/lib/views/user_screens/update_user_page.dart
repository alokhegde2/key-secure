import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:key_secure_v2/constants.dart';
import 'package:key_secure_v2/controller/user_controller/update_user_controller.dart';
import 'package:key_secure_v2/controller/user_controller/user_controller.dart';
import 'package:key_secure_v2/widgets/user_widgets/unauthorized_widget.dart';

class UpdateUser extends StatelessWidget {
  UpdateUser({Key? key}) : super(key: key);
  final name = Get.parameters["name"];
  final avatar = Get.parameters["avatar"];
  String imgUrl =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png";
  String _image =
      "/data/user/0/com.example.key_secure_v2/cache/image_picker813416379886721302.jpg";
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
                    onPressed: () {
                      print(_image);
                    },
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
                                    getImage(picker, updateUserController);
                                    print(_image);
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
                      Text("$name"),
                      Text("$avatar"),
                    ],
                  ),
                ),
              ),
            )
          : Unauthorized(),
    );
  }
}

Future getImage(picker, controller) async {
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
