import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_app/models/appointment_model.dart';
import 'package:hospital_management_app/provider/appointments.dart';
import 'package:hospital_management_app/widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AppointmentScreen extends StatefulWidget {
  static const routeName = '/AppointmentsList';
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  List<AppointmentModel> appointmentList = [];

  var _isInit = true;
  var _isLoading = false;

  Map<String, List<AppointmentModel>> appointmentsMap = {};

  String date;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Appointments>(context).fetchAppointments().then((_) {
        setState(() {
          _isLoading = false;
          appointmentsMap =
              Provider.of<Appointments>(context).fetchAppointmentsMap();
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments',
            style: GoogleFonts.openSans(color: Colors.white, fontSize: 20)),
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: TextField(
          //     onChanged: (searchKey) {
          //       setState(() {
          //         displayPatients = patientsList.where((element) {
          //           String patientName = element.name.toLowerCase();
          //           return patientName.contains(searchKey.toLowerCase());
          //         }).toList();
          //       });
          //     },
          //     decoration: InputDecoration(
          //         contentPadding: EdgeInsets.only(
          //           left: 24,
          //           top: 16,
          //           bottom: 15,
          //         ),
          //         hintText: "Search Patient",
          //         hintStyle: GoogleFonts.openSans(
          //             color: Color(0XFFA0A0A0), fontSize: 16),
          //         border: OutlineInputBorder(
          //             borderSide:
          //                 BorderSide(color: Color(0xFFF6F6F6), width: 1.0),
          //             borderRadius: BorderRadius.circular(20))),
          //   ),
          // ),
          // SizedBox(height: 5.0),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                      // color: Theme.of(context).primaryColor
                      ))
              : AppointmentsListBuilder(appointmentsMap: appointmentsMap),
        ],
      ),
    );
  }
}

class AppointmentsListBuilder extends StatelessWidget {
  const AppointmentsListBuilder({
    Key key,
    @required this.appointmentsMap,
  }) : super(key: key);

  final Map<String, List<AppointmentModel>> appointmentsMap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                    AppointmentModel appointmentDetail = appointment[index2];
                    return Text(appointmentDetail.patientName);
                  }),
            ],
          );
        });
  }
}
