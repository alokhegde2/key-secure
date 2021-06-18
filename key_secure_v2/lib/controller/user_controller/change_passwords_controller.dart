import 'package:get/get.dart';

class ChangePasswords extends GetxController {
  var isMasterPasswordVisible = false.obs;

  var isConfirmMasterPasswordVisible = false.obs;

  var isNewMasterPasswordVisible = false.obs;

  var buttonText = "Change Master Password".obs;

  var buttonEnabled = true.obs;

  //toggle master password visibility
  toggleMasterPassword() {
    if (isMasterPasswordVisible.value) {
      isMasterPasswordVisible(false);
    } else {
      isMasterPasswordVisible(true);
    }
  }

  //toggle new master password visibility
  toggleNewMasterPassword() {
    if (isNewMasterPasswordVisible.value) {
      isNewMasterPasswordVisible(false);
    } else {
      isNewMasterPasswordVisible(true);
    }
  }

  //toggle confirm master password visibility
  toggleConfirmMasterPassword() {
    if (isConfirmMasterPasswordVisible.value) {
      isConfirmMasterPasswordVisible(false);
    } else {
      isConfirmMasterPasswordVisible(true);
    }
  }

  //toggle button visibility
  toggleButton() {
    if (buttonEnabled.value) {
      buttonEnabled(false);
    } else {
      buttonEnabled(true);
    }
  }

  //change button text
  changeButtonText(text) {
    buttonText(text);
  }
}
