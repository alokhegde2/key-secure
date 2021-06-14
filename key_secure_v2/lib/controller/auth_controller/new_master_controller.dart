import 'package:get/get.dart';

class NewMasterController extends GetxController{
  var isMasterPassVisible = false.obs;

  var isConfirmMasterPasswordVisible = false.obs;

  //toggle master pass visibility
  toggleMasterPass(){
    if(isMasterPassVisible.value){
      isMasterPassVisible(false);
    } else {
      isMasterPassVisible(true);
    }
  }

  //toggle confirm master pass visibility
  toggleConfirmMasterPass(){
    if(isConfirmMasterPasswordVisible.value){
      isConfirmMasterPasswordVisible(false);
    } else {
      isConfirmMasterPasswordVisible(true);
    }
  }
}