import 'package:flutter/material.dart';
import 'package:hospital_management_app/models/appointment_model.dart';
import 'package:intl/intl.dart';

///
///Map<String, List<AppointmentModel>>
///

class Test extends StatelessWidget {

    List<AppointmentModel> appointmentList = [];
  Map<String, List<AppointmentModel>> appointmentsMap;
  String date;
      
  @override
  Widget build(BuildContext context) {
    appointmentList.sort((a, b) => a.appointmentDate.compareTo(b.appointmentDate));

      appointmentList.forEach((element) {
        date = DateFormat('dd MMM yyyy').format(element.appointmentDate);
        if (appointmentsMap[date] == null) {
          appointmentsMap[date] = [];
          appointmentsMap[date].add(element);
        } else {
          appointmentsMap[date].add(element);
        }
      });

    return Container(
      
    );
  }
}