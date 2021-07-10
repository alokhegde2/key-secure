import 'package:get/get.dart';
import 'package:key_secure_v2/main.dart';

class PasswordService extends GetConnect {
  Future<Response> getMainPassword() {
    var id = box.read("id");
    var token = box.read("auth-token");

    return get(
      "http://192.168.43.173:3000/api/v2/password/get-password/$id?page=1&limit",
      headers: {"auth-token": token},
    );
  }

  Future<Response> getIcons() {
    var token = box.read("auth-token");

    return get(
      "http://192.168.43.173:3000/api/v2/password/get-icons",
      headers: {"auth-token": token},
    );
  }

  Future<Response> createPassword(
      title, username, password, category, note, emailid) {
    var id = box.read("id");
    var token = box.read("auth-token");
    var data = {
      "title": title,
      "username": username,
      "password": password,
      "category": category,
      "note": note,
      "userId": id,
      "emailId": emailid
    };

    return post(
      "http://192.168.43.173:3000/api/v2/password/new-password",
      data,
      headers: {"auth-token": token},
    );
  }
}
