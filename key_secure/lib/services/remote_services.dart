import 'dart:convert';

import 'package:get/get.dart';
import 'package:key_secure/models/password.dart';
import 'package:http/http.dart' as http;
import 'package:key_secure/models/user.dart';

import '../main.dart';

class RemoteServices extends GetConnect {
  static var client = http.Client();

  static Future<List<Password>> fetchPasswords(id) async {
    var response = await client
        .get(Uri.parse("http://192.168.43.173:3000/api/v1/password/$id"));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return passwordFromJson(
          jsonString); //this is ceated in models/product.dart for json parsing

    } else {
      print(response.statusCode);
      //show error message
      return null;
    }
  }

  static Future<int> attemptNewPass(
      String appName,
      String appMailId,
      String appPassword,
      String appUserId,
      String appType,
      String note,
      String userId) async {
    Map data = {
      "appName": appName,
      "appMailId": appMailId,
      "appPassword": appPassword,
      "appUserId": appUserId,
      "appType": appType,
      "note": note,
      "userId": userId
    };

    String body = json.encode(data);

    var res = await http.post(
      Uri.parse('http://192.168.43.173:3000/api/v1/password/newPass'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    return res.statusCode;
  }

  static Future<int> attemptLogin(String email, String password) async {
    Map data = {'email': email, 'password': password};

    String body = json.encode(data);

    var res = await http.post(
      Uri.parse('http://192.168.43.173:3000/api/v1/users/login'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (res.statusCode == 200) {
      String jwt = res.body;
      if (jwt != null) {
        box.write('jwt', jwt);
        return res.statusCode;
      }
    } else if (res.statusCode == 400) {
      return res.statusCode;
    }
  }

  static Future<int> attemptMasterPass(String email, String masterPass) async {
    Map data = {'email': email, 'masterPassword': masterPass};

    String body = json.encode(data);

    var res = await http.post(
      Uri.parse('http://192.168.43.173:3000/api/v1/users/master'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    return res.statusCode;
  }

  static Future<List<User>> fetchUser(String id, String jwt) async {
    var response = await client.get(
        Uri.parse("http://192.168.43.173:3000/api/v1/users/$id"),
        headers: {"auth-token": jwt});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userFromJson(
          jsonString); //this is ceated in models/product.dart for json parsing

    } else {
      print(response.statusCode);
      //show error message
      return null;
    }
  }

  static Future<int> attemptSignUp(
      String name, String email, String password, String masterPassword) async {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
      "masterPassword": masterPassword
    };

    String body = json.encode(data);

    var res = await http.post(
      Uri.parse('http://192.168.43.173:3000/api/v1/users/register'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    return res.statusCode;
  }

  static Future<int> attemptDelete(String id) async {
    var res = await http.delete(Uri.parse('http://192.168.43.173:3000/api/v1/password/$id'));
    return res.statusCode;
  }

  static Future<int> attemptUpdatePass(
      String appName,
      String appMailId,
      String appPassword,
      String appUserId,
      String appType,
      String note,
      String userId,
      String id,
      bool isFavourite) async {
    Map data = {
      "appName": appName,
      "appMailId": appMailId,
      "appPassword": appPassword,
      "appUserId": appUserId,
      "appType": appType,
      "note": note,
      "userId": userId,
      "isFavourite":isFavourite,
    };

    String body = json.encode(data);

    var res = await http.put(
      Uri.parse('http://192.168.43.173:3000/api/v1/password/$id'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    return res.statusCode;
  }
}
