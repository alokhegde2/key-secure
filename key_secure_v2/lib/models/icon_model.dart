// To parse this JSON data, do
//
//     final icon = iconFromJson(jsonString);

import 'dart:convert';

Icon iconFromJson(String str) => Icon.fromJson(json.decode(str));

String iconToJson(Icon data) => json.encode(data.toJson());

class Icon {
  Icon({
    required this.affinity,
    required this.amazon,
    required this.applepay,
    required this.behance,
    required this.digitalocean,
    required this.docker,
    required this.dribbble,
    required this.dropbox,
    required this.facebook,
    required this.github,
    required this.google,
    required this.gpay,
    required this.instagram,
    required this.linkedin,
    required this.medium,
    required this.messenger,
    required this.microsoft,
    required this.netflix,
    required this.paypal,
    required this.pinterest,
    required this.prime,
    required this.sketch,
    required this.slack,
    required this.snapchat,
    required this.spotify,
    required this.stackoverflow,
    required this.tumbler,
    required this.twitch,
    required this.twitter,
    required this.whatsapp,
    required this.wordpress,
    required this.youtube,
    required this.other,
  });

  String affinity;
  String amazon;
  String applepay;
  String behance;
  String digitalocean;
  String docker;
  String dribbble;
  String dropbox;
  String facebook;
  String github;
  String google;
  String gpay;
  String instagram;
  String linkedin;
  String medium;
  String messenger;
  String microsoft;
  String netflix;
  String paypal;
  String pinterest;
  String prime;
  String sketch;
  String slack;
  String snapchat;
  String spotify;
  String stackoverflow;
  String tumbler;
  String twitch;
  String twitter;
  String whatsapp;
  String wordpress;
  String youtube;
  String other;

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        affinity: json["affinity"],
        amazon: json["amazon"],
        applepay: json["applepay"],
        behance: json["behance"],
        digitalocean: json["digitalocean"],
        docker: json["docker"],
        dribbble: json["dribbble"],
        dropbox: json["dropbox"],
        facebook: json["facebook"],
        github: json["github"],
        google: json["google"],
        gpay: json["gpay"],
        instagram: json["instagram"],
        linkedin: json["linkedin"],
        medium: json["medium"],
        messenger: json["messenger"],
        microsoft: json["microsoft"],
        netflix: json["netflix"],
        paypal: json["paypal"],
        pinterest: json["pinterest"],
        prime: json["prime"],
        sketch: json["sketch"],
        slack: json["slack"],
        snapchat: json["snapchat"],
        spotify: json["spotify"],
        stackoverflow: json["stackoverflow"],
        tumbler: json["tumbler"],
        twitch: json["twitch"],
        twitter: json["twitter"],
        whatsapp: json["whatsapp"],
        wordpress: json["wordpress"],
        youtube: json["youtube"],
        other: json["other"],
      );

  Map<String, dynamic> toJson() => {
        "affinity": affinity,
        "amazon": amazon,
        "applepay": applepay,
        "behance": behance,
        "digitalocean": digitalocean,
        "docker": docker,
        "dribbble": dribbble,
        "dropbox": dropbox,
        "facebook": facebook,
        "github": github,
        "google": google,
        "gpay": gpay,
        "instagram": instagram,
        "linkedin": linkedin,
        "medium": medium,
        "messenger": messenger,
        "microsoft": microsoft,
        "netflix": netflix,
        "paypal": paypal,
        "pinterest": pinterest,
        "prime": prime,
        "sketch": sketch,
        "slack": slack,
        "snapchat": snapchat,
        "spotify": spotify,
        "stackoverflow": stackoverflow,
        "tumbler": tumbler,
        "twitch": twitch,
        "twitter": twitter,
        "whatsapp": whatsapp,
        "wordpress": wordpress,
        "youtube": youtube,
      };
}
