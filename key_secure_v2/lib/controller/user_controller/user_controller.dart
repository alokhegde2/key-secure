import 'package:get/get.dart';
import 'package:key_secure_v2/models/user_model.dart';
import 'package:key_secure_v2/services/network_services/network_service.dart';
import 'package:key_secure_v2/services/user_services/user_service.dart';
import 'package:key_secure_v2/views/error_screens/server_down.dart';

import '../../main.dart';

class UserController extends GetxController {
  var userData = Map<String, User>().obs;
  var isAutherized = false.obs;
  var isLoading = true.obs;
  var isLogedIn = false.obs;

  late bool isConnected1;

  @override
  void onInit() async {
    getUser();
    checkLogged();
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

  getUser() async {
    isConnected1 = await isConnected();
    if (isConnected1) {
      isLoading(true);
      try {
        var response = await UserService().getUser();
        if (response.statusCode == 200) {
          var data = userFromJson(response.bodyString.toString());
          userData({"user": data});
          isAutherized(true);
        } else if (response.statusCode == 401) {
          isAutherized(false);
        } else {
          Get.off(ServerDown());
        }
      } catch (e) {
        // Get.to(Unauthorized());
        print(e);
      } finally {
        isLoading(false);
      }
    }
  }
}
