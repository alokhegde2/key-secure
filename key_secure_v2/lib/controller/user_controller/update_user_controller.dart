import 'package:get/get.dart';

class UpdateUserController extends GetxController {
  var uploadedImage = "".obs;
  var buttonEnabled = true.obs;
  var isLoading = false.obs;
  var removeText = "Remove Avatar".obs;
  var isDeleteButtonEnabled = true.obs;
  var deleteText = "Delete Account".obs;

  uploadImage(image) {
    uploadedImage(image);
    // print(uploadedImage.value);
  }

  toggleButton(bool value) {
    buttonEnabled(value);
  }

  toggleLoading() {
    (isLoading.value) ? isLoading(false) : isLoading(true);
  }

  toggleRemoveText(String value) {
    removeText(value);
  }

  toggleDeleteButton(bool value) {
    isDeleteButtonEnabled(value);
  }

  toggleDeleteText(String value) {
    deleteText(value);
  }
}
