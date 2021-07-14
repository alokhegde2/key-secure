import 'package:get/get.dart';

class VerifyAndForgotMasterPass extends GetxController {
  var isMasterPasswordVisible = false.obs;

  var isPasswordVisible = false.obs;

  var isNewMasterPassVisible = false.obs;

  var isConfirmNewMasterPassVisible = false.obs;

  var buttonText = "Continue".obs;

  var forgotButtonText = "Send Instructions".obs;

  var forgotMasterButtonText = "Reset Master Password".obs;

  var isButtonEnabled = true.obs;

  var isMasterButtonEnabled = true.obs;

  var isResetMasterButtonEnabled = true.obs;

  //TOggle master password
  toggleMasterPass() {
    if (isMasterPasswordVisible.value) {
      isMasterPasswordVisible(false);
    } else {
      isMasterPasswordVisible(true);
    }
  }

  //Toggle Password
  togglePassword() {
    if (isPasswordVisible.value) {
      isPasswordVisible(false);
    } else {
      isPasswordVisible(true);
    }
  }

  //Toggle new master Password
  toggleNewMasterPassword() {
    if (isNewMasterPassVisible.value) {
      isNewMasterPassVisible(false);
    } else {
      isNewMasterPassVisible(true);
    }
  }

  //Toggle confirm new master Password
  toggleConfirmNewMasterPassword() {
    if (isConfirmNewMasterPassVisible.value) {
      isConfirmNewMasterPassVisible(false);
    } else {
      isConfirmNewMasterPassVisible(true);
    }
  }

  setButtonText(text) {
    buttonText(text);
  }

  setForgotButtonText(text) {
    forgotButtonText(text);
  }

  setForgotMasterButtonText(text) {
    forgotMasterButtonText(text);
  }

  toggleButton(bool value) {
    isButtonEnabled(value);
  }

  toggleMasterButton(value) {
    isMasterButtonEnabled(value);
  }

  toggleResetButton(value) {
    isResetMasterButtonEnabled(value);
  }
}
