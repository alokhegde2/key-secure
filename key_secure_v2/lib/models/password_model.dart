// To parse this JSON data, do
//
//     final password = passwordFromJson(jsonString);

import 'dart:convert';


Password passwordFromJson(String str) => Password.fromJson(json.decode(str));

String passwordToJson(Password data) => json.encode(data.toJson());

class Password {
  Password({
    required this.results,
  });

  List<Result> results;

  factory Password.fromJson(Map<String, dynamic> json) => Password(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.username,
    required this.image,
    required this.isImportant,
    required this.note,
    required this.date,
    required this.id,
    required this.title,
    required this.password,
    required this.emailId,
    required this.category,
    required this.userId,
    required this.v,
    required this.resultId,
    required this.resultUserId,
  });

  String username;
  String image;
  bool isImportant;
  String note;
  DateTime date;
  String id;
  String title;
  String password;
  String emailId;
  String category;
  String userId;
  int v;
  String resultId;
  String resultUserId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        username: json["username"],
        image: json["image"],
        isImportant: json["isImportant"],
        note: json["note"],
        date: DateTime.parse(json["date"]),
        id: json["_id"],
        title: json["title"],
        password: json["password"],
        emailId: json["emailId"],
        category: json["category"],
        userId: json["userId"],
        v: json["__v"],
        resultId: json["id"],
        resultUserId: json["user_Id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "image": image,
        "isImportant": isImportant,
        "note": note,
        "date": date.toIso8601String(),
        "_id": id,
        "title": title,
        "password": password,
        "emailId": emailId,
        "category": category,
        "userId": userId,
        "__v": v,
        "id": resultId,
        "user_Id": resultUserId,
      };
}
