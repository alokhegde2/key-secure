import 'dart:io';

import 'package:get/get.dart';
import 'package:key_secure_v2/main.dart';

class UserService extends GetConnect {
  var baseUrl = "http://192.168.43.173:3000/api/v2";
  //Get user details
  Future<Response> getUser() {
    var id = box.read("id");
    var token = box.read("auth-token");

    return get(
      "$baseUrl/user/get-user/$id",
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
      "$baseUrl/user/change-master-pass/$id",
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
      "$baseUrl/user/change-pass/$id",
      data,
      headers: {"auth-token": token},
    );
  }

  //Updating user profile
  Future<Response> updateUser(image, name) {
    var id = box.read("id");
    var token = box.read("auth-token");
    final form = FormData({
      'avatar': MultipartFile(
        image,
        filename: image.split("/").last,
        contentType: 'image/jpg',
      ),
      'name': name.toString(),
      // 'otherFile': MultipartFile(image, filename: 'cover.png'),
    });
    return put(
      '$baseUrl/user/update/$id',
      form,
      headers: {"auth-token": token},
    );
  }

  //Removing profile picture
  Future<Response> removeAvatar() {
    var id = box.read("id");
    var token = box.read("auth-token");
    var data = {"avatar": ""};
    return put(
      "$baseUrl/user/remove-avatar/$id",
      data,
      headers: {"auth-token": token},
    );
  }
}
