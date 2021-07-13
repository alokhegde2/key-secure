import 'package:get/get.dart';

class LoginController extends GetxController {
  var isPasswordVisibile = false.obs;
  var buttonText = "Sign In".obs;
  var isButtonEnabled = true.obs;

  togglePassword() {
    if (isPasswordVisibile.value) {
      isPasswordVisibile(false);
    } else {
      isPasswordVisibile(true);
    }
  }

  toggleButton(bool value) {
    isButtonEnabled(value);
  }

  setButtonText(text) {
    buttonText(text);
  }
}
