import 'package:get/get.dart';

class UpdateUserController extends GetxController {
  var uploadedImage = "".obs;
  var buttonEnabled = true.obs;
  var isLoading = false.obs;

  uploadImage(image) {
    uploadedImage(image);
    print(uploadedImage.value);
  }

  toggleButton() {
    (buttonEnabled.value) ? buttonEnabled(false) : buttonEnabled(true);
  }

  toggleLoading() {
    (isLoading.value) ? isLoading(false) : isLoading(true);
  }
}
