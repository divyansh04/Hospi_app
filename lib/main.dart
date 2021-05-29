import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hospital_management_app/screens/auth/auth.dart';
import 'package:hospital_management_app/screens/auth/login.dart';
// import 'package:hospital_management_app/screens/auth/signup.dart';
// import 'package:hospital_management_app/screens/splash.dart';
import 'package:hospital_management_app/services/networkEngine.dart';

import 'services/serviceLocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Set rotation
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //Needs to be updated while changing flavours
  NetworkEngine.baseUrl = "  "; //TODO

  // await Firebase.initializeApp();
  // Instantiate Service Locator
  await servicesSetup();
  runApp(MyApp());
}

// TODO use api's like this
// await sl.get<UserService>().getAuthUser();
// await sl.get<GetDataService>().getData();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF2684fe),
        textTheme: GoogleFonts.muliTextTheme(),
      ),
      home: Login(),
      // TODO : Add Routes
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
