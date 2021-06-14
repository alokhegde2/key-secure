import 'package:get/get.dart';

class VerifyAndForgotMasterPass extends GetxController {
  var isMasterPasswordVisible = false.obs;

  var isPasswordVisible = false.obs;

  var isNewMasterPassVisible = false.obs;

  var isConfirmNewMasterPassVisible = false.obs;

  //TOggle master password
  toggleMasterPass(){
    if(isMasterPasswordVisible.value){
      isMasterPasswordVisible(false);
    } else {
      isMasterPasswordVisible(true);
    }
  }

  //Toggle Password
  togglePassword(){
    if(isPasswordVisible.value){
      isPasswordVisible(false);
    } else {
      isPasswordVisible(true);
    }
  }

  //Toggle new master Password
  toggleNewMasterPassword(){
    if(isNewMasterPassVisible.value){
      isNewMasterPassVisible(false);
    } else {
      isNewMasterPassVisible(true);
    }
  }

  //Toggle confirm new master Password
  toggleConfirmNewMasterPassword(){
    if(isConfirmNewMasterPassVisible.value){
      isConfirmNewMasterPassVisible(false);
    } else {
      isConfirmNewMasterPassVisible(true);
    }
  }
}