import 'package:flutter/material.dart';
import '../models/patient_model.dart';
import '../services/networkEngine.dart';

class Staff with ChangeNotifier {
  List _staff = [];
  List _doctors = [];

  List<Staff> get staff {
    return [..._staff];
  }

  List<Staff> get doctors {
    return [..._doctors];
  }

  Staff findbyId(String id) {
    return _staff.firstWhere((element) => element.id == id);
  }

  Staff findDocbyId(String id) {
    return _doctors.firstWhere((element) => element.id == id);
  }

  Future<void> fetchStaff() async {
    final url = "staff/";
    List<Patient> loadedStaff = [];
    try {
      final response = await NetworkEngine().dio.get(url);
      List<dynamic> data = response.data;

      data.forEach((element) {
        loadedStaff.add(Patient.fromJson(element));
      });
      _staff = loadedStaff;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  // TODO: sort out doctors into separate list
  Future<void> fetchDoctors() async {
    try {
      await fetchStaff();
      List<Staff> loadedDoctors = [];
      _staff.forEach((element) {
        if (element["category"] == "doctor") {
          loadedDoctors.add(element);
        }
      });
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
