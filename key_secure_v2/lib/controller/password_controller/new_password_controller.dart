import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  var selectedCategory = "Others".obs;
  var isPasswordVisible = false.obs;
  var isButtonEnabled = true.obs;

  togglePasswordVisibility() {
    (isPasswordVisible.value)
        ? isPasswordVisible(false)
        : isPasswordVisible(true);
  }

  changeSelectedCategory(category) {
    selectedCategory(category);
  }

  toggleButton() {
    (isButtonEnabled.value) ? isButtonEnabled(false) : isButtonEnabled(true);
  }
}
