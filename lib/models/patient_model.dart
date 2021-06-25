import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
  Patient({
    this.id,
    this.name,
    this.gender,
    this.age,
    this.phone,
    this.address,
    // this.ailment,
    // this.amount
  });

  String id;
  String name;
  String gender;
  int age;
  int phone;
  // String ailment;
  // String amount;
  String address;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        name: json["name"],
        gender: json["gender"],
        age: json["age"],
        phone: json["phone number"],
        address: json["address"],
        // ailment: json["ailment"] ?? null,
        // amount: json["amount"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
        "age": age,
        "phone number": phone,
        "address": address,
        // "ailment": ailment,
        // "amount": amount,
      };
}
