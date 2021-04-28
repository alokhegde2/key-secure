// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    Welcome({
        this.name,
        this.id,
        this.email,
        this.masterPassword,
        this.date,
        this.v,
        this.welcomeId,
    });

    String name;
    String id;
    String email;
    String masterPassword;
    DateTime date;
    int v;
    String welcomeId;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        name: json["name"],
        id: json["_id"],
        email: json["email"],
        masterPassword: json["masterPassword"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
        welcomeId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "_id": id,
        "email": email,
        "masterPassword": masterPassword,
        "date": date.toIso8601String(),
        "__v": v,
        "id": welcomeId,
    };
}
