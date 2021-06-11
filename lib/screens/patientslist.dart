import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_app/widgets/patientlistbuilder.dart';
import '../provider/patients.dart';
import '../widgets/drawer.dart';
import 'package:provider/provider.dart';

class PatientList extends StatefulWidget {
  static const routeName = '/PatientsList';
  const PatientList({Key key}) : super(key: key);

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  TextEditingController _search;
  var _isInit = true;
  var _isLoading = false;
  List<Patient> displayPatients = [];

  @override
  void initState() {
    super.initState();
    _search = TextEditingController(text: "");
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Patients>(context).fetchPatients().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final patients = Provider.of<Patients>(context).patients;
    return Scaffold(
        appBar: AppBar(
          title: Text('Patients',
              style: GoogleFonts.openSans(color: Colors.white, fontSize: 20)),
        ),
        drawer: AppDrawer(),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _search,
                // TODO: implement searching in PatientList and display search results through PatientListBuilder
                onChanged: (searchKey) {},
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 24,
                      top: 16,
                      bottom: 15,
                    ),
                    hintText: "Search Patient",
                    hintStyle: GoogleFonts.openSans(
                        color: Color(0XFFA0A0A0), fontSize: 16),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFF6F6F6), width: 1.0),
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            SizedBox(height: 5.0),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor))
                : PatientListBuilder(patients)
          ],
        ));
  }
}
