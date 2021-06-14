// To parse this JSON data, do
//
//     final appointmentModel = appointmentModelFromJson(jsonString);

import 'dart:convert';

AppointmentModel appointmentModelFromJson(String str) =>
    AppointmentModel.fromJson(json.decode(str));

String appointmentModelToJson(AppointmentModel data) =>
    json.encode(data.toJson());

class AppointmentModel {
  AppointmentModel({
    this.ailment,
    this.date,
    this.amount,
    this.doctorName,
    this.doctorid,
    this.id,
    this.patientName,
    this.patientid,
  });

  DateTime date;
  String ailment;
  int amount;
  String doctorName;
  String doctorid;
  String id;
  String patientName;
  String patientid;
  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        ailment: json["ailment"],
        amount: json["amount"],
        doctorName: json["doctor name"],
        doctorid: json["doctorid"],
        id: json["id"],
        patientName: json["patient name"],
        patientid: json["patientid"],
        date: json["date"] == null
            ? null
            : DateTime.parse(json['date'] as String),
      );

  Map<String, dynamic> toJson() => {
        "ailment": ailment,
        "amount": amount,
        "doctor name": doctorName,
        "doctorid": doctorid,
        "id": id,
        "patient name": patientName,
        "patientid": patientid,
        "date": date?.toIso8601String(),
      };
}
