import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/patient_model.dart';
import '../screens/appointment_slot.dart';
import '../screens/patient_details.dart';

class PatientListBuilder extends StatelessWidget {
  @required
  final List<Patient> displayPatients;
  @required
  final bool details;

  PatientListBuilder(this.displayPatients, this.details);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        padding: EdgeInsets.all(15.0),
        itemCount: displayPatients.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              onTap: () {
                print('### TAPPED: ${displayPatients[index].id} ###');
                if (details == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PatientDetails(patient: displayPatients[index])));
                } else
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentSlot(
                              patient: displayPatients[index])));
              },
              leading: Icon(
                Icons.person,
                size: 30,
              ),
              title: Text(displayPatients[index].name,
                  style: GoogleFonts.openSans(
                      fontSize: 20, fontWeight: FontWeight.w600)),
              subtitle: Row(
                children: [
                  Text(displayPatients[index].gender),
                  Spacer(),
                  Text("Age :  "),
                  Text(displayPatients[index].age.toString()),
                ],
              ),
            ),
          );
        });
  }
}
