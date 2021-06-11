import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import '../models/http_exception.dart';

class Patient {
  final String id;
  final String name;
  final String gender;
  final int age;
  final int phone;
  final String address;

  Patient({
    @required this.id,
    @required this.name,
    @required this.gender,
    @required this.age,
    @required this.phone,
    @required this.address,
  });
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

    final url = "http://hospiti.pythonanywhere.com/api/patients/";
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return;
      }
      print(extractedData);
      List loadedPatients = [];
      extractedData.forEach((patientData) {
        loadedPatients.add(Patient(
            id: patientData['id'],
            name: patientData['name'],
            gender: patientData['gender'],
            age: patientData['age'],
            phone: patientData['phone number'],
            address: patientData['address']));
      });
      _patients = loadedPatients;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
