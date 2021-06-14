import 'package:get/get.dart';

class LoginController extends GetxController{
  var isPasswordVisibile = false.obs;

  togglePassword(){
    if(isPasswordVisibile.value){
      isPasswordVisibile(false);
    } else {
      isPasswordVisibile(true);
    }
  }
  
}