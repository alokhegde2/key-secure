// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        this.name,
        this.id,
        this.email,
        this.masterPassword,
        this.date,
        this.v,
        this.userId,
    });

    String name;
    String id;
    String email;
    String masterPassword;
    DateTime date;
    int v;
    String userId;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        id: json["_id"],
        email: json["email"],
        masterPassword: json["masterPassword"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
        userId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "_id": id,
        "email": email,
        "masterPassword": masterPassword,
        "date": date.toIso8601String(),
        "__v": v,
        "id": userId,
    };
}
