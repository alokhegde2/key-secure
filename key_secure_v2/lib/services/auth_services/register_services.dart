import 'package:get/get.dart';
import 'package:key_secure_v2/main.dart';

class RegisterServices extends GetConnect {
  //Registering the user
  Future<Response> registerUser(name, email, password) {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
      "authType": "normal"
    };
    return post(
        "https://joli-vin-42673.herokuapp.com/api/v2/user/register", data);
  }

  //Checking if mail is verified
  Future<Response> verifyMail() {
    var mail = box.read("email");
    return get(
      "https://joli-vin-42673.herokuapp.com/api/v2/user/register/verify-mail/$mail",
    );
  }

  //Creating new master password
  Future<Response> createMaster(password, email) {
    var data = {
      "masterPassword": password,
    };
    var mail = box.read("email");
    if (mail == null) {
      mail = email;
    }
    return put(
      "https://joli-vin-42673.herokuapp.com/api/v2/user/register/new-master-pass/$mail",
      data,
    );
  }
}
