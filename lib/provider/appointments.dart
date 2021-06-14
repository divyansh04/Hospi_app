import 'package:flutter/material.dart';
import 'package:hospital_management_app/models/appointment_model.dart';
import 'package:hospital_management_app/services/networkEngine.dart';

import 'package:intl/intl.dart';

class Appointments with ChangeNotifier {
  List _appointments = [];

  List<AppointmentModel> get appointments {
    return [..._appointments];
  }

  AppointmentModel findbyId(String id) {
    return _appointments.firstWhere((element) => element.id == id);
  }

  Future<void> fetchAppointments() async {
    final url = "https://hospiti.pythonanywhere.com/api/patients/";
    List<AppointmentModel> loadedAppointments = [];
    try {
      final response = await NetworkEngine().dio.get(url);
      List<dynamic> data = response.data;

      data.forEach((element) {
        loadedAppointments.add(AppointmentModel.fromJson(element));
      });
      _appointments = loadedAppointments;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Map<String, List<AppointmentModel>> fetchAppointmentsMap(
      ) {
    Map<String, List<AppointmentModel>> _appointmentsMap = {};
    String date;
    this.appointments.sort((a, b) => a.date.compareTo(b.date));

    this.appointments.forEach((element) {
      date = DateFormat('dd MMM yyyy').format(element.date);
      if (_appointmentsMap[date] == null) {
        _appointmentsMap[date] = [];
        _appointmentsMap[date].add(element);
      } else {
        _appointmentsMap[date].add(element);
      }
    });
    return _appointmentsMap;
  }
}
