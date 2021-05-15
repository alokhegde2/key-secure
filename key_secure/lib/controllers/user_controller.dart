import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:key_secure/models/user.dart';
import 'package:key_secure/services/remote_services.dart';

import '../main.dart';

class UserController extends GetxController {
  var userList = List<User>().obs;

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  getUserDetails() async {
    var jwttoken = box.read('jwt');

    Map<String, dynamic> decodedToken = JwtDecoder.decode(box.read('jwt'));
    var user = await RemoteServices.fetchUser(decodedToken["id"], jwttoken);
    // print(decodedToken["id"]);
    try {
      if (user != null) {
        userList.value = user;
        // print(userList[0].email);
      }
    } catch (e) {
      print(e);
    }
  }
}
