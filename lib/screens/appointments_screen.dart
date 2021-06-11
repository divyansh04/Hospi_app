import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_app/models/appointment_model.dart';
import 'package:hospital_management_app/widgets/drawer.dart';
import 'package:intl/intl.dart';

class AppointmentScreen extends StatefulWidget {
  static const routeName = '/AppointmentsList';
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  List<AppointmentModel> appointmentList = [];

  Map<String, List<AppointmentModel>> appointmentsMap ={};

  String date;

  @override
  Widget build(BuildContext context) {
    appointmentList.sort((a, b) => a.date.compareTo(b.date));

    appointmentList.forEach((element) {
      date = DateFormat('dd MMM yyyy').format(element.date);
      if (appointmentsMap[date] == null) {
        appointmentsMap[date] = [];
        appointmentsMap[date].add(element);
      } else {
        appointmentsMap[date].add(element);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments',
            style: GoogleFonts.openSans(color: Colors.white, fontSize: 20)),
      ),
      drawer: AppDrawer(),
      body: Container(
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
                      padding: EdgeInsets.all(8.0),
                      itemCount: appointment.length,
                      itemBuilder: (_, int index2) {
                        AppointmentModel appointmentDetail =
                            appointment[index2];
                        return Text(appointmentDetail.name);
                      }),
                ],
              );
            }),
      ),
    );
  }
}
