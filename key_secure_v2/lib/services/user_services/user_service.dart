import 'package:get/get.dart';
import 'package:key_secure_v2/main.dart';

class UserService extends GetConnect {
  //Get user details
  Future<Response> getUser() {
    var id = box.read("id");
    var token = box.read("auth-token");

    return get(
      "http://192.168.43.173:3000/api/v2/user/get-user/$id",
      headers: {"auth-token": token},
    );
  }

  //To update the Master password
  Future<Response> updateMasterPassword(masterPass, newMasterPass) {
    var id = box.read("id");
    var token = box.read("auth-token");
    var data = {
      "masterPassword": masterPass,
      "newMasterPassword": newMasterPass,
    };

    return put(
      "http://192.168.43.173:3000/api/v2/user/change-master-pass/$id",
      data,
      headers: {"auth-token": token},
    );
  }

  //To update the password
  Future<Response> updatePassword(password, newPassword) {
    var id = box.read("id");
    var token = box.read("auth-token");
    var data = {
      "password": password,
      "newPassword": newPassword,
    };

    return put(
      "http://192.168.43.173:3000/api/v2/user/change-pass/$id",
      data,
      headers: {"auth-token": token},
    );
  }
}
