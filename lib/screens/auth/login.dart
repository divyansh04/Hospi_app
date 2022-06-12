import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management_app/models/http_exception.dart';
import 'package:hospital_management_app/provider/auth.dart';
import 'package:hospital_management_app/screens/Admin_Dashboard_Screens/home.dart';
import 'package:hospital_management_app/screens/Patients_Dashboard_Screens/screens/patient_home_screen.dart';
import 'package:hospital_management_app/screens/auth/signup.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email;
  TextEditingController _password;
  bool obscure = true;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Form(
          key: _formKey,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height - 500,
                  color: Colors.blue.shade200,
                  child: SvgPicture.asset('assets/doc.svg')),
              Positioned.fill(
                top: 350,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              new Positioned.fill(
                top: 300.0,
                left: 20,
                right: 19,
                bottom: 40,
                child: Card(
                  semanticContainer: false,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 5,
                  child: ListView(
                    // mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(28.0, 30, 0, 0),
                          child: Text(
                            "Welcome back !",
                            style: GoogleFonts.openSans(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(28.0, 15, 0, 0),
                          child: Text(
                            "Sign in using your email and password",
                            style: GoogleFonts.openSans(
                                color: Color(0xFF575563),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          controller: _email,

                          // ignore: missing_return
                          validator: (value) {
                            if (!(value.contains("@")) && value.isNotEmpty) {
                              return 'please enter a valid email address';
                            }
                            if (value == null || value.isEmpty) {
                              return 'please enter email address';
                            }
                          },
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 24,
                                top: 16,
                                bottom: 15,
                              ),
                              hintText: "Email Address",
                              hintStyle: GoogleFonts.openSans(
                                  color: Color(0XFFA0A0A0), fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFF6F6F6)),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFF6F6F6)),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFF6F6F6)),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      SizedBox(height: 33),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          controller: _password,
                          obscureText: obscure,
                          validator: (value) =>
                              (value.isEmpty) ? "Please Enter Password" : null,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscure = !obscure;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  size: 20,
                                  color: Color(0xFFB1B1B1),
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                left: 24,
                                top: 16,
                                bottom: 15,
                              ),
                              hintText: "Password",
                              hintStyle: GoogleFonts.openSans(
                                  color: Color(0XFFA0A0A0), fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFF6F6F6)),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFF6F6F6)),
                                  borderRadius: BorderRadius.circular(8)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFF6F6F6), width: 1.0),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 16, right: 15),
                          child: _isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      // color: Theme.of(context).primaryColor
                                      ))
                              : MaterialButton(
                                  color: Theme.of(context).primaryColor,
                                  height: 55,
                                  minWidth:
                                      MediaQuery.of(context).size.width - 75,
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      if (_email.text.contains("doctor") ||
                                          _email.text.contains("reception")) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreenAnalytics(),
                                          ),
                                        );
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PatientHomeScreen(),
                                          ),
                                        );
                                      }
                                      // _submit();
                                    }
                                  },
                                  child: Text(
                                    "Sign in",
                                    style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                )),
                      SizedBox(
                        height: 32,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Forgot Password ?",
                              style: GoogleFonts.openSans(
                                  color: Color(0xFF575563),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 17),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don’t have an account?",
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.white,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, SignUp.routeName);
                                },
                                child: Text(" Sign Up!",
                                    style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Theme.of(context).primaryColor)),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          MaterialButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context).login(
        _email.text,
        _password.text,
      );
      Navigator.of(context).pushReplacementNamed('/');
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Could not authenticate . Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
