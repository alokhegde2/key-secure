import 'package:get/get.dart';
import 'package:key_secure_v2/models/password_model.dart';
import 'package:key_secure_v2/services/network_services/network_service.dart';
import 'package:key_secure_v2/services/password_service/password_service.dart';
import 'package:key_secure_v2/views/error_screens/server_down.dart';
import 'package:key_secure_v2/widgets/user_widgets/unauthorized_widget.dart';

import '../../main.dart';

class PasswordController extends GetxController {
  var passwordData = Map<String, Password>().obs;
  var isLogedIn = false.obs;
  var isLoading = true.obs;
  var isAutherized = false.obs;
  var isPasswordVisible = false.obs;
  var isButtonEnabled = true.obs;
  var deleteButtonText = "Delete".obs;

  late bool isConnected1;

  @override
  void onInit() {
    checkLogged();
    fetchPassword();
    super.onInit();
  }

  checkLogged() {
    var token = box.read("auth-token");

    if (token == null) {
      isLogedIn(false);
    } else if (token == "") {
      isLogedIn(false);
    } else {
      isLogedIn(true);
    }
  }

  fetchPassword() async {
    isConnected1 = await isConnected();

    if (isConnected1) {
      isLoading(true);
      try {
        var response = await PasswordService().getMainPassword();
        if (response.statusCode == 200) {
          isLoading(false);
          var data = passwordFromJson(response.bodyString.toString());
          passwordData({"Passwords": data});
        } else if (response.statusCode == 401) {
          isLoading(false);
          Get.off(Unauthorized());
        } else {
          isLoading(false);
          Get.to(ServerDown());
        }
      } catch (e) {
        print(e);
      }
    }
  }

  togglePassword() {
    (isPasswordVisible.value)
        ? isPasswordVisible(false)
        : isPasswordVisible(true);
  }

  toggleButton() {
    (isButtonEnabled.value) ? isButtonEnabled(false) : isButtonEnabled(true);
  }

  changeDeleteText(text) {
    deleteButtonText(text);
  }
}
