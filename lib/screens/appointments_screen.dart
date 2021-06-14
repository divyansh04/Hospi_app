import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_app/models/appointment_model.dart';
import 'package:hospital_management_app/provider/appointments.dart';
import 'package:hospital_management_app/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
          // Add Filter Widget
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
        reverse: true,
        padding: EdgeInsets.all(8.0),
        itemCount: appointmentsMap.length,
        itemBuilder: (_, int dateIndex) {
          String date = appointmentsMap.keys.toList()[dateIndex];
          List<AppointmentModel> appointment = appointmentsMap[date];

          return ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                child: Text(date,
                    style: GoogleFonts.openSans(
                        fontSize: 20, fontWeight: FontWeight.w600)),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.all(8.0),
                  itemCount: appointment.length,
                  itemBuilder: (_, int index2) {
                    AppointmentModel appointmentDetail = appointment[index2];
                    return Card(
                      elevation: 2.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        onTap: () {
                          print('###TAPPED: ${appointmentDetail.id}###');
                        },
                        leading: Icon(
                          Icons.person,
                          size: 30,
                        ),
                        title: Text(appointmentDetail.patientName,
                            style: GoogleFonts.openSans(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        subtitle: Row(
                          children: [
                            Text("Time: "),
                            Text(
                                DateFormat.Hm().format(appointmentDetail.date)),
                            Spacer(),
                            Text("Amount :  "),
                            Text(appointmentDetail.amount.toString()),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          );
        });
  }
}
