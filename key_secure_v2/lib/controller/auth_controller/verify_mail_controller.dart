import 'package:get/get.dart';

class VerifyMailController extends GetxController {
  var buttonText = "Continue".obs;

  setButtonText(text) {
    buttonText(text);
  }
}
