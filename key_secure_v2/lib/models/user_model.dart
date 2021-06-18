// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.status,
    required this.avatar,
    required this.authType,
    required this.createdDate,
    required this.id,
    required this.name,
    required this.email,
    required this.v,
    required this.userId,
  });

  String status;
  String avatar;
  String authType;
  DateTime createdDate;
  String id;
  String name;
  String email;
  int v;
  String userId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        avatar: json["avatar"],
        authType: json["authType"],
        createdDate: DateTime.parse(json["createdDate"]),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        v: json["__v"],
        userId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "avatar": avatar,
        "authType": authType,
        "createdDate": createdDate.toIso8601String(),
        "_id": id,
        "name": name,
        "email": email,
        "__v": v,
        "id": userId,
      };
}
