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
    appointmentList
        .sort((a, b) => a.appointmentDate.compareTo(b.appointmentDate));

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
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(8.0),
          itemCount: appointmentsMap.length,
          itemBuilder: (_, int dateIndex) {
            String date = appointmentsMap.keys.toList()[dateIndex];
            List<AppointmentModel> appointment = appointmentsMap[date];

            return ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Center(
                  child: Container(
                    child: Text(date),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    // controller: _dateScrollController,
                    padding: EdgeInsets.all(8.0),
                    // reverse: true,
                    itemCount: appointment.length,
                    itemBuilder: (_, int index2) {
                      AppointmentModel appointmentDetail = appointment[index2];
                      return Text(appointmentDetail.name);
                    }),
              ],
            );
          }),
    );
  }
}
