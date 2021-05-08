import 'package:get/get.dart';

class AuthController extends GetxController {
  var isPasswordVisible = false.obs;

  toggle(){
    if(isPasswordVisible.value == true){
      isPasswordVisible(false);
    } else {
      isPasswordVisible(true);
    }
  }

}