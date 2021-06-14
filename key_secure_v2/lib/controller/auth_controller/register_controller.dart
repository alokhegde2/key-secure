import 'package:get/get.dart';

class RegisterController extends GetxController{
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  //togglling password visible
  togglePassword(){
    if(isPasswordVisible.value){
      isPasswordVisible(false);
    } else {
      isPasswordVisible(true);
    }
  }

  //toggling confirmPassword
  toggleConfirmPassword(){
    if(isConfirmPasswordVisible.value){
      isConfirmPasswordVisible(false);
    } else {
      isConfirmPasswordVisible(true);
    }
  }
}