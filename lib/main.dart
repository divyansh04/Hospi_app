import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../provider/auth.dart';
import '../provider/patients.dart';
import '../screens/auth/login.dart';
import '../screens/auth/signup.dart';
import '../services/networkEngine.dart';
import 'package:provider/provider.dart';

import 'provider/appointments.dart';
import 'screens/Admin_Dashboard_Screens/appointments_screen.dart';
import 'screens/Admin_Dashboard_Screens/book_appointment.dart';
import 'screens/Admin_Dashboard_Screens/home.dart';
import 'screens/Admin_Dashboard_Screens/patients_screen.dart';
import 'screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Set rotation
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  NetworkEngine.baseUrl = "https://hospiti.pythonanywhere.com/api/";

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
                textTheme: GoogleFonts.varelaRoundTextTheme(
                    Theme.of(context).textTheme),
                // textTheme: GoogleFonts.muliTextTheme(),
              ),
              home: OnboardingScreen(), //MyHomePage(), //HomeScreen(),
              routes: {
                // OnboardingScreen.routeName: (context) => OnboardingScreen(),
                Login.routeName: (context) => Login(),
                SignUp.routeName: (context) => SignUp(),
                HomeScreen.routeName: (context) => HomeScreen(),
                HomeScreenAnalytics.routeName: (context) => HomeScreenAnalytics(),
                BookAppointment.routeName: (context) => BookAppointment(),
                PatientScreen.routeName: (context) => PatientScreen(),
                AppointmentScreen.routeName: (context) => AppointmentScreen(),
              }),
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
