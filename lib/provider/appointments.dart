import 'package:flutter/material.dart';
import 'package:hospital_management_app/models/appointment_model.dart';
import 'package:hospital_management_app/services/networkEngine.dart';

class Appointments with ChangeNotifier {
  List _patients = [];

  List<AppointmentModel> get patients {
    return [..._patients];
  }

  AppointmentModel findbyId(String id) {
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
    List<AppointmentModel> loadedPatients = [];
    try {
      final response = await NetworkEngine().dio.get(url);
      List<dynamic> data = response.data;

      data.forEach((element) {
        loadedPatients.add(AppointmentModel.fromJson(element));
      });
      _patients = loadedPatients;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
