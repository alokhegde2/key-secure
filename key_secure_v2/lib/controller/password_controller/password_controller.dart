import 'package:get/get.dart';
import 'package:key_secure_v2/services/network_services/network_service.dart';
import 'package:key_secure_v2/services/password_service/password_service.dart';

import '../../main.dart';

class PasswordController extends GetxController {
  // var passwordList = List<Password>().obs;
  var isLogedIn = false.obs;
  var isLoading = true.obs;
  var isAutherized = false.obs;

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
          print(response.body);
        } else {
          print(response.statusCode);
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
