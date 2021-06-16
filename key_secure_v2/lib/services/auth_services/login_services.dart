import 'package:get/get.dart';

class LoginServices extends GetConnect {
  //Loging in the user
  Future<Response> loginUser(email, password) {
    var data = {
      "email": email,
      "password": password,
    };

    return post("http://192.168.43.173:3000/api/v2/user/login", data);
  }
}
