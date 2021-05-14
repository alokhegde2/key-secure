import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:key_secure/models/user.dart';
import 'package:key_secure/services/remote_services.dart';

import '../main.dart';

class UserController extends GetxController {
  var userList = List<User>().obs;
  var jwt = box.read('jwt');
  
  Map<String, dynamic> decodedToken = JwtDecoder.decode(box.read('jwt'));

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  getUserDetails() async {
    var user = await RemoteServices.fetchUser(decodedToken["id"],jwt);
    try {
      if (user != null) {
      userList.value = user;
    }
    } catch (e) {
      print(e);
    }
  }

}
