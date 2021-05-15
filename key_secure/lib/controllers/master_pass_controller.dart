import 'package:get/get.dart';

class MasterPassControler extends GetxController {
  // var passCount = 0.obs;
  var pass = "".obs;

  onKeyTap(String number) {
    //  passCount.value++;
    if (pass.value.length <= 3) {
      //  pass.value += number;
      pass(pass.value + number);
    }
  }

  onClear() {
    //  pass = pass.value.substring(0,a.length-1);
    if (pass.value.length != 0) {
      pass(pass.value.substring(0, pass.value.length - 1));
    }
  }

  onSuccess(){
    pass("");
  }
}
