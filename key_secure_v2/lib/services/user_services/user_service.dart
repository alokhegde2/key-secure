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

  //Updating user profile
  Future<Response> updateUser(image, name) {
    var id = box.read("id");
    var token = box.read("auth-token");
    //If only name is changed
    if (image == "" && name != "") {
      var data = {"name": name};
      return put(
        'http://192.168.43.173:3000/api/v2/user/update/name/$id',
        data,
        headers: {"auth-token": token},
      );
    } else if (image != "" && name == "") {
      //if only avatar is changed
      var contentType = image.split('/').last.split('.').last;
      final form = FormData({
        'avatar': MultipartFile(
          image,
          filename: image.split("/").last,
          contentType: 'image/$contentType',
        ),
      });
      return put(
        'http://192.168.43.173:3000/api/v2/user/update/avatar/$id',
        form,
        headers: {"auth-token": token},
      );
    } else {
      //If both avatar and name is changed
      var contentType = image.split('/').last.split('.').last;
      final form = FormData({
        'avatar': MultipartFile(
          image,
          filename: image.split("/").last,
          contentType: 'image/$contentType',
        ),
        'name': name.toString(),
      });
      return put(
        'http://192.168.43.173:3000/api/v2/user/update/avatar/$id',
        form,
        headers: {"auth-token": token},
      );
    }
  }

  //Removing profile picture
  Future<Response> removeAvatar() {
    var id = box.read("id");
    var token = box.read("auth-token");
    var data = {"avatar": ""};
    return put(
      "http://192.168.43.173:3000/api/v2/user/remove-avatar/$id",
      data,
      headers: {"auth-token": token},
    );
  }

  //To delete account
  Future<Response> deleteAccount() {
    var id = box.read("id");
    var token = box.read("auth-token");
    return delete(
      "http://192.168.43.173:3000/api/v2/user/delete-user/$id",
      headers: {"auth-token": token},
    );
  }
}
