// To parse this JSON data, do
//
//     final password = passwordFromJson(jsonString);

import 'dart:convert';

List<Password> passwordFromJson(String str) => List<Password>.from(json.decode(str).map((x) => Password.fromJson(x)));

String passwordToJson(List<Password> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Password {
    Password({
        this.isFavourite,
        this.note,
        this.id,
        this.appName,
        this.appUserId,
        this.appPassword,
        this.appMailId,
        this.passwordUserId,
        this.appType,
        this.date,
        this.v,
        this.passwordId,
        this.userId,
    });

    bool isFavourite;
    String note;
    String id;
    String appName;
    String appUserId;
    String appPassword;
    String appMailId;
    String passwordUserId;
    String appType;
    DateTime date;
    int v;
    String passwordId;
    String userId;

    factory Password.fromJson(Map<String, dynamic> json) => Password(
        isFavourite: json["isFavourite"],
        note: json["note"],
        id: json["_id"],
        appName: json["appName"],
        appUserId: json["appUserId"],
        appPassword: json["appPassword"],
        appMailId: json["appMailId"],
        passwordUserId: json["userId"],
        appType: json["appType"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
        passwordId: json["id"],
        userId: json["userID"],
    );

    Map<String, dynamic> toJson() => {
        "isFavourite": isFavourite,
        "note": note,
        "_id": id,
        "appName": appName,
        "appUserId": appUserId,
        "appPassword": appPassword,
        "appMailId": appMailId,
        "userId": passwordUserId,
        "appType": appType,
        "date": date.toIso8601String(),
        "__v": v,
        "id": passwordId,
        "userID": userId,
    };
    bool isPasswordVisible = false;
}
