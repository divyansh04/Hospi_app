import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../provider/auth.dart';
import '../provider/patients.dart';
import 'package:hospital_management_app/screens/auth/login.dart';
import 'package:hospital_management_app/widgets/drawer.dart';
import 'package:provider/provider.dart';
// import 'auth/auth.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homescreen';

  const HomeScreen({Key key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard',
            style: GoogleFonts.openSans(color: Colors.white, fontSize: 20)),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: [
            // Text(auth.userId),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
                // Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacementNamed(context, Login.routeName);
                Future.delayed(Duration(seconds: 5), () {
                  auth.logout();
                });
              },
              child: Text('Sign out',
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
