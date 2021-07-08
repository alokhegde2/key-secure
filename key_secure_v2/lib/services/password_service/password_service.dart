import 'package:get/get.dart';
import 'package:key_secure_v2/main.dart';

class PasswordService extends GetConnect {
  Future<Response> getMainPassword() {
    var id = box.read("id");
    var token = box.read("auth-token");

    return get(
      "http://192.168.43.173:3000/api/v2/password/get-password/$id?page=1&limit=2",
      headers: {"auth-token": token},
    );
  }
}
