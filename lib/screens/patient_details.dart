import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/patient_model.dart';
import 'package:provider/provider.dart';

class PatientDetails extends StatefulWidget {
  static const routeName = '/PatientDetails';
  const PatientDetails({Key key, @required this.patient}) : super(key: key);
  final Patient patient;

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('${widget.patient.name}',
            style: GoogleFonts.openSans(color: Colors.white, fontSize: 20)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Patient ID : ',
                          style: GoogleFonts.openSans(fontSize: 14)),
                      Text(widget.patient.id,
                          style: GoogleFonts.openSans(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text('Patient Name : ',
                          style: GoogleFonts.openSans(fontSize: 18)),
                      Spacer(),
                      Text(widget.patient.name.toUpperCase(),
                          style: GoogleFonts.openSans(
                              fontSize: 20, fontWeight: FontWeight.w600))
                    ],
                  ),
                  Row(
                    children: [
                      Text('Gender : ',
                          style: GoogleFonts.openSans(fontSize: 18)),
                      Spacer(),
                      Text(widget.patient.gender,
                          style: GoogleFonts.openSans(
                              fontSize: 20, fontWeight: FontWeight.w600))
                    ],
                  ),
                  Row(
                    children: [
                      Text('Age : ', style: GoogleFonts.openSans(fontSize: 18)),
                      Spacer(),
                      Text(widget.patient.age.toString(),
                          style: GoogleFonts.openSans(
                              fontSize: 20, fontWeight: FontWeight.w600))
                    ],
                  ),
                  Row(
                    children: [
                      Text('Address : ',
                          style: GoogleFonts.openSans(fontSize: 18)),
                      Spacer(),
                      Text(widget.patient.address,
                          style: GoogleFonts.openSans(
                              fontSize: 20, fontWeight: FontWeight.w600))
                    ],
                  ),
                  Row(
                    children: [
                      Text('Contact : ',
                          style: GoogleFonts.openSans(fontSize: 18)),
                      Spacer(),
                      Text(widget.patient.phone.toString(),
                          style: GoogleFonts.openSans(
                              fontSize: 20, fontWeight: FontWeight.w600))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
