import 'dart:io';

import 'package:get/get.dart';

class UpdateUserController extends GetxController {
  var uploadedImage = "".obs;

  uploadImage(image) {
    uploadedImage(image);
    print(uploadedImage.value);
  }
}
