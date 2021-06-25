import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../provider/patients.dart';
import '../widgets/patientlistbuilder.dart';
import '../models/patient_model.dart';
import '../widgets/drawer.dart';
import 'package:provider/provider.dart';

import 'auth/widgets/custom_radio.dart';
import 'auth/widgets/popup.dart';

class BookAppointment extends StatefulWidget {
  static const routeName = '/BookAppointment';
  const BookAppointment({Key key}) : super(key: key);

  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  bool newAppointment = false;
  var _isInit = true;
  var _isLoading = false;
  List<Patient> patientsList = [];
  List<Patient> displayPatients = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _amount = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _ailment = TextEditingController();

  final FocusScopeNode _node = FocusScopeNode();
  String gender;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Patients>(context).fetchPatients().then((_) {
        setState(() {
          _isLoading = false;
          patientsList = Provider.of<Patients>(context).patients;
          displayPatients = patientsList;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            title: Text('Book Appointment',
                style: GoogleFonts.openSans(fontSize: 20))),
        drawer: AppDrawer(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    'Patient Type:',
                    style: GoogleFonts.openSans(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: false,
                          groupValue: newAppointment,
                          onChanged: (value) {
                            setState(() {
                              newAppointment = value;
                            });
                          },
                        ),
                        Text(
                          'Registered Patient',
                          style: GoogleFonts.openSans(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: true,
                          groupValue: newAppointment,
                          onChanged: (value) {
                            setState(() {
                              newAppointment = value;
                            });
                          },
                        ),
                        Text(
                          'New Patient',
                          style: GoogleFonts.openSans(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              // Text(newAppointment.toString()),
              newAppointment ? newPatientForm() : displayRegPatients()
            ],
          ),
        ));
  }

  displayRegPatients() {
    return ListView(
      primary: false,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Text(
            "Select Patient:",
            style: GoogleFonts.openSans(fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: TextField(
            onChanged: (searchKey) {
              setState(() {
                displayPatients = patientsList.where((element) {
                  String patientName = element.name.toLowerCase();
                  return patientName.contains(searchKey.toLowerCase());
                }).toList();
              });
            },
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
        // SizedBox(height: 5.0),
        _isLoading
            ? Center(
                child: Column(
                children: [
                  SizedBox(height: 20),
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Fetching Patients from Server ..'),
                ],
              ))
            : PatientListBuilder(displayPatients, false)
      ],
    );
  }

  newPatientForm() {
    return Form(
      key: _formKey,
      child: FocusScope(
        node: _node,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text('Enter Patient Details',
                            style: GoogleFonts.openSans(
                                fontSize: 14, fontWeight: FontWeight.w600))),
                    SizedBox(height: 10),
                    // Name
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Name of the Patient : ',
                        style: GoogleFonts.openSans(fontSize: 14),
                      ),
                    ),
                    TextFormField(
                      controller: _name,
                      validator: (value) => (value.isEmpty) ? "Required" : null,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                      ),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: _node.nextFocus,
                      decoration: InputDecoration(
                          // labelText: 'Full Name',
                          contentPadding: EdgeInsets.only(
                            left: 24,
                            top: 16,
                            bottom: 15,
                          ),
                          hintText: "Full Name",
                          hintStyle: GoogleFonts.openSans(
                              color: Color(0XFFA0A0A0), fontSize: 14),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFF6F6F6), width: 1.0),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    //Age
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Age : ',
                        style: GoogleFonts.openSans(fontSize: 14),
                      ),
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onEditingComplete: _node.nextFocus,
                      controller: _age,
                      validator: (value) => (value.isEmpty) ? "Required" : null,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 24,
                            top: 16,
                            bottom: 15,
                          ),
                          hintText: "age",
                          hintStyle: GoogleFonts.openSans(
                              color: Color(0XFFA0A0A0), fontSize: 14),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFF6F6F6), width: 1.0),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    Container(
                      height: 100,
                      child: Center(child: GenderSelector(
                        onSelected: (genderSelected) {
                          gender = genderSelected;
                        },
                      )),
                    ),
                    //Phone Number
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Phone Number : ',
                        style: GoogleFonts.openSans(fontSize: 14),
                      ),
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onEditingComplete: _node.nextFocus,
                      controller: _phone,
                      validator: (value) => (value.isEmpty) ? "Required" : null,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                      ),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 24,
                            top: 16,
                            bottom: 15,
                          ),
                          hintText: "Phone Number",
                          hintStyle: GoogleFonts.openSans(
                              color: Color(0XFFA0A0A0), fontSize: 14),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFF6F6F6), width: 1.0),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    // Address
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Address : ',
                        style: GoogleFonts.openSans(fontSize: 14),
                      ),
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onEditingComplete: _node.nextFocus,
                      controller: _address,
                      validator: (value) => (value.isEmpty) ? "Required" : null,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 24,
                            top: 16,
                            bottom: 15,
                          ),
                          hintText: "Address",
                          hintStyle: GoogleFonts.openSans(
                              color: Color(0XFFA0A0A0), fontSize: 14),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFF6F6F6), width: 1.0),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    //Amount
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Amount : ',
                        style: GoogleFonts.openSans(fontSize: 14),
                      ),
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onEditingComplete: _node.nextFocus,
                      controller: _amount,
                      validator: (value) => (value.isEmpty) ? "Required" : null,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 24,
                            top: 16,
                            bottom: 15,
                          ),
                          hintText: "amount",
                          hintStyle: GoogleFonts.openSans(
                              color: Color(0XFFA0A0A0), fontSize: 14),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFF6F6F6), width: 1.0),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    //Ailment
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Ailment : ',
                        style: GoogleFonts.openSans(fontSize: 14),
                      ),
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      onEditingComplete: _node.nextFocus,
                      controller: _ailment,
                      validator: (value) =>
                          (value.isEmpty) ? "Enter Full Name" : null,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                          // labelText: 'Full Name',
                          contentPadding: EdgeInsets.only(
                            left: 24,
                            top: 16,
                            bottom: 15,
                          ),
                          hintText: "Ailment / Treatment Condition",
                          hintStyle: GoogleFonts.openSans(
                              color: Color(0XFFA0A0A0), fontSize: 14),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFF6F6F6), width: 1.0),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    // Spacer(),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Center(
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('Submit',
                        style: GoogleFonts.openSans(
                            color: Colors.white, fontSize: 18)),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        if (gender == null || gender.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Select Gender')));
                        } else {
                          Provider.of<Patients>(context)
                              .fetchPatients()
                              .then((_) {
                            setState(() {
                              _isLoading = false;
                              patientsList =
                                  Provider.of<Patients>(context).patients;
                              displayPatients = patientsList;
                            });
                          });
                          bool response = await Provider.of<Patients>(context,
                                  listen: false)
                              .addPatient(
                                  address: _address.text,
                                  age: _age.text,
                                  ailment: _ailment.text,
                                  amount: _amount.text,
                                  gender: gender.toUpperCase(),
                                  name: _name.text,
                                  phone: _phone.text);

                          if (response) {
                            showDialog(
                              context: context,
                              builder: (_) => SubmittedPopUp(),
                            );
                          } else {}
                        }
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
