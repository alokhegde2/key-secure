import 'package:get/get.dart';

class AuthController extends GetxController {
  var isPasswordVisible = false.obs;

  var isError = false.obs;
  
  var err  = "".obs;

  toggle(){
    if(isPasswordVisible.value == true){
      isPasswordVisible(false);
    } else {
      isPasswordVisible(true);
    }
  }

  error(){
    if(isError.value == false){
      isError(true);
    }
  }
  noerror(){
    if(isError.value == true){
      isError(false);
    }
  }

  seterror(var error){
    err(error);
  }
}