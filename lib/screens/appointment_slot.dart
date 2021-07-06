import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/patient_model.dart';

class AppointmentSlot extends StatefulWidget {
  const AppointmentSlot({Key key, @required this.patient}) : super(key: key);
  final Patient patient;

  @override
  _AppointmentSlotState createState() => _AppointmentSlotState();
}

class _AppointmentSlotState extends State<AppointmentSlot> {
  DateTime pickedDate;
  TimeOfDay pickedTime;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now().add(Duration(days: 1));
    pickedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Appointment Booking",
            style: GoogleFonts.openSans(color: Colors.white, fontSize: 20)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Patient Name:',
                      style: GoogleFonts.openSans(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.patient.name.toUpperCase(),
                      style: GoogleFonts.openSans(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Schedule Appointment :',
                  style: GoogleFonts.openSans(fontSize: 16),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     'Date ',
              //     style: GoogleFonts.openSans(fontSize: 16),
              //   ),
              // ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ListTile(
                  onTap: _pickDate,
                  title: Text(
                      "Date : ${pickedDate.day} . ${pickedDate.month} . ${pickedDate.year}"),
                  leading: Icon(Icons.calendar_today_rounded),
                  trailing: Icon(Icons.keyboard_arrow_down_rounded),
                ),
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ListTile(
                  onTap: _pickTime,
                  title:
                      Text("Time : ${pickedTime.hour} : ${pickedTime.minute} "),
                  leading: Icon(Icons.access_time, size: 30),
                  trailing: Icon(Icons.keyboard_arrow_down_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Date Picker
  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime(DateTime.now().day - 1),
        lastDate: DateTime(DateTime.now().year + 1),
        selectableDayPredicate: (DateTime val) {
          if (val.isAfter(DateTime.now()) &&
              val.isBefore(DateTime.now().add(Duration(days: 15)))) {
            return true;
          }
          return false;
        });

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  // Time Picker
  _pickTime() async {
    TimeOfDay time = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 9, minute: 0));
    if (time != null && time.hour > 9 && time.hour < 17) {
      setState(() {
        pickedTime = time;
      });
    } else {
      Fluttertoast.showToast(
          msg: "Select time between 9 AM - 5 PM",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.grey.shade100,
          textColor: Colors.red,
          fontSize: 16.0);
    }
  }
}
