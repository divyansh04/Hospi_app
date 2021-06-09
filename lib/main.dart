import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_app/provider/auth.dart';
// import 'package:hospital_management_app/screens/auth/auth.dart';
import 'package:hospital_management_app/screens/auth/login.dart';
import 'package:hospital_management_app/screens/auth/signup.dart';
import 'package:hospital_management_app/screens/home.dart';
// import 'package:hospital_management_app/screens/auth/signup.dart';
// import 'package:hospital_management_app/screens/splash.dart';
import 'package:hospital_management_app/services/networkEngine.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Set rotation
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //Needs to be updated while changing flavours
  NetworkEngine.baseUrl = ""; //TODO

  // await Firebase.initializeApp();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => Auth())],
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
              home: auth.isAuth ? HomeScreen() : Login(),
              routes: {
                Login.routeName: (context) => Login(),
                SignUp.routeName: (context) => SignUp(),
                HomeScreen.routeName: (context) => HomeScreen(),
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
