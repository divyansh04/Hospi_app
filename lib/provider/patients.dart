import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_management_app/services/networkEngine.dart';
import 'package:http/http.dart' as http;
// import '../models/http_exception.dart';

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
  });

  String id;
  String name;
  String gender;
  int age;
  int phone;
  String address;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        name: json["name"],
        gender: json["gender"],
        age: json["age"],
        phone: json["phone"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
        "age": age,
        "phone": phone,
        "address": address,
      };
}

class Patients with ChangeNotifier {
  List _patients = [];

  List<Patient> get patients {
    return [..._patients];
  }

  Patient findbyId(String id) {
    return _patients.firstWhere((element) => element.id == id);
  }

  Future<void> fetchPatients() async {
    // List<Patient> mockPatients = [
    //   new Patient(
    //       address: "Near Madhu Hotel",
    //       age: 78,
    //       gender: "MALE",
    //       id: "ill man1622744854",
    //       name: "ill man",
    //       phone: "7458963210"),
    //   new Patient(
    //       address: "Yamuna Nagar",
    //       age: 41,
    //       gender: "Male",
    //       id: "first",
    //       name: "someone",
    //       phone: "4125638549")
    // ];
    // _patients = mockPatients;

    final url = "https://hospiti.pythonanywhere.com/api/patients/";
    List<Patient> loadedPatients = [];
    try {
      final response = await NetworkEngine().dio.get(url);
      List<dynamic> data = response.data;

      data.forEach((element) {
        loadedPatients.add(Patient.fromJson(element));
      });
      _patients = loadedPatients;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
