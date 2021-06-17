import 'package:get/get.dart';
import 'package:key_secure_v2/services/user_services/get_user_service.dart';

class UserController extends GetxController {
  var isloggedIn = "".obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  getUser() async {
    isLoading(true);
    try {
      var response = await UserService().getUser();
      if (response.statusCode == 200) {
        isloggedIn("200");
      } else if (response.statusCode == 401) {
        isloggedIn("401");
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
