import 'package:get/get.dart';

class NewMasterController extends GetxController {
  var isMasterPassVisible = false.obs;

  var isConfirmMasterPasswordVisible = false.obs;

  var buttonText = "Continue".obs;

  var isError = false.obs;

  var error = "".obs;

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
