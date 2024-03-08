import 'dart:convert';

import 'package:address_24/models/picture.dart';

class Person {
  Person({
    this.gender,
    this.firstName,
    this.lastName,
    this.email,
    this.cell,
    this.id,
    this.picture,
  });

  final String? gender;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? cell;
  final String? id;
  final Picture? picture;

  Person copyWith({
    String? gender,
    String? firstName,
    String? lastName,
    String? email,
    String? cell,
    String? id,
    Picture? picture,
  }) =>
      Person(
        gender: gender ?? this.gender,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        cell: cell ?? this.cell,
        id: id ?? this.id,
        picture: picture ?? this.picture,
      );

  factory Person.fromRawJson(String str) => Person.fromJson(json.decode(str));

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        gender: json["gender"],
        firstName: json["name"] == null ? null : json['name']['first'],
        lastName: json["name"] == null ? null : json['name']['last'],
        email: json["email"],
        cell: json["cell"],
        id: json["id"] == null ? null : json['id']['value'],
        picture:
            json["picture"] == null ? null : Picture.fromJson(json["picture"]),
      );
}
