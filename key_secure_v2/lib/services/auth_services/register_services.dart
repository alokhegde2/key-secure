import 'package:get/get.dart';

class RegisterServices extends GetConnect {
  //Registering the user
  Future<Response> registerUser(name, email, password) {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
      "authType": "normal"
    };
    return post("http://192.168.43.173:3000/api/v2/user/register", data);
  }
}
