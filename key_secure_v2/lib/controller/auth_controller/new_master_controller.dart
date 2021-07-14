import 'package:get/get.dart';

class NewMasterController extends GetxController {
  var isMasterPassVisible = false.obs;

  var isConfirmMasterPasswordVisible = false.obs;

  var buttonText = "Continue".obs;

  var isButtonEnabled = true.obs;

  //toggle master pass visibility
  toggleMasterPass() {
    if (isMasterPassVisible.value) {
      isMasterPassVisible(false);
    } else {
      isMasterPassVisible(true);
    }
  }

  //toggle confirm master pass visibility
  toggleConfirmMasterPass() {
    if (isConfirmMasterPasswordVisible.value) {
      isConfirmMasterPasswordVisible(false);
    } else {
      isConfirmMasterPasswordVisible(true);
    }
  }

  //check for email available

  setButtonText(text) {
    buttonText(text);
  }

  toggleButton(bool value) {
    isButtonEnabled(value);
  }
}
