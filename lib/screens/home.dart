import 'package:flutter/material.dart';
import 'package:hospital_management_app/provider/auth.dart';
import 'package:hospital_management_app/screens/auth/login.dart';
import 'package:provider/provider.dart';
// import 'auth/auth.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/homescreen';
  const HomeScreen({Key key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signed in'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(auth.userId),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
                // Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacementNamed(context, Login.routeName);
                Future.delayed(Duration(seconds: 5), () {
                  auth.logout();
                });
              },
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
