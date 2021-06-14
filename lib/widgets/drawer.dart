import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_app/provider/auth.dart';
import 'package:hospital_management_app/screens/appointments_screen.dart';
import 'package:hospital_management_app/screens/auth/login.dart';
import 'package:hospital_management_app/screens/patients_screen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "User",
              style: GoogleFonts.openSans(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              "accountEmail",
              style: GoogleFonts.openSans(
                fontSize: 15,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 40,
              ),
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            title: Text("Dashboard",
                style: GoogleFonts.openSans(
                  fontSize: 15,
                )),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.book_rounded),
            title: Text("Book Appointment",
                style: GoogleFonts.openSans(
                  fontSize: 15,
                )),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AppointmentScreen.routeName);
            },
            leading: Icon(Icons.calendar_today_rounded),
            title: Text("Appointments",
                style: GoogleFonts.openSans(
                  fontSize: 15,
                )),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_search),
            onTap: () {
              Navigator.pushNamed(context, PatientScreen.routeName);
            },
            title: Text("Patients",
                style: GoogleFonts.openSans(
                  fontSize: 15,
                )),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            onTap: () {
              Navigator.pushReplacementNamed(context, Login.routeName);
              Future.delayed(Duration(seconds: 5), () {
                auth.logout();
              });
            },
            title: Text("Logout",
                style: GoogleFonts.openSans(
                  fontSize: 15,
                )),
          ),
        ],
      ),
    );
  }
}
