import 'package:get/get.dart';
import 'package:key_secure_v2/main.dart';

class UserService extends GetConnect {
  //Get user details
  Future<Response> getUser() {
    var id = box.read("id");

    return get("http://192.168.43.173:3000/api/v2/user/get-user/$id");
  }
}
