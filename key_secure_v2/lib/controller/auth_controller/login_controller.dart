import 'package:get/get.dart';

class LoginController extends GetxController {
  var isPasswordVisibile = false.obs;
  var isError = false.obs;
  var error = "".obs;
  var buttonText = "Sign In".obs;

  togglePassword() {
    if (isPasswordVisibile.value) {
      isPasswordVisibile(false);
    } else {
      isPasswordVisibile(true);
    }
  }

  setError(err) {
    isError(true);
    error(err);
  }

  success() {
    isError(false);
  }

  setButtonText(text) {
    buttonText(text);
  }
}
