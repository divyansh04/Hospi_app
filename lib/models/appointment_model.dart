// To parse this JSON data, do
//
//     final appointmentModel = appointmentModelFromJson(jsonString);

import 'dart:convert';

AppointmentModel appointmentModelFromJson(String str) =>
    AppointmentModel.fromJson(json.decode(str));

String appointmentModelToJson(AppointmentModel data) =>
    json.encode(data.toJson());

class AppointmentModel {
  AppointmentModel(
      {this.id, this.name, this.age, this.gender, this.date});

  String id;
  String name;
  String age;
  String gender;
  DateTime date;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        date: json["date"] == null
            ? null
            : DateTime.parse(json['time'] as String),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "gender": gender,
        "date": date?.toIso8601String(),
      };
}
