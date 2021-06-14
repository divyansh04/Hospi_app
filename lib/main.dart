import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_app/provider/auth.dart';
import 'package:hospital_management_app/provider/patients.dart';
// import 'package:hospital_management_app/screens/auth/auth.dart';
import 'package:hospital_management_app/screens/auth/login.dart';
import 'package:hospital_management_app/screens/auth/signup.dart';
import 'package:hospital_management_app/screens/home.dart';
import 'package:hospital_management_app/screens/patients_screen.dart';
// import 'package:hospital_management_app/screens/auth/signup.dart';
// import 'package:hospital_management_app/screens/splash.dart';
import 'package:hospital_management_app/services/networkEngine.dart';
import 'package:provider/provider.dart';

import 'provider/appointments.dart';
import 'screens/appointments_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Set rotation
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  NetworkEngine.baseUrl = ""; //TODO

  // await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Auth(),
          ),
          ChangeNotifierProvider<Patients>(
            create: (context) => Patients(),
          ),
          ChangeNotifierProvider<Appointments>(
            create: (context) => Appointments(),
          )
        ],
        child: Consumer<Auth>(
          builder: (context, Auth auth, _) => MaterialApp(
              title: 'Material App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                primarySwatch: Colors.blue,
                primaryColor: Color(0xFF2684fe),
                textTheme: GoogleFonts.muliTextTheme(),
              ),
              home: HomeScreen(),
              routes: {
                Login.routeName: (context) => Login(),
                SignUp.routeName: (context) => SignUp(),
                HomeScreen.routeName: (context) => HomeScreen(),
                PatientScreen.routeName: (context) => PatientScreen(),
                AppointmentScreen.routeName: (context) => AppointmentScreen(),
              }
              // TODO : Add Routes
              ),
        ));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
