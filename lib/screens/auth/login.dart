import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email;
  TextEditingController _password;
  bool obscure = true;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

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
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 5,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: MaterialButton(
                          color: Theme.of(context).primaryColor,
                          height: 55,
                          minWidth: MediaQuery.of(context).size.width - 75,
                          onPressed: () async {
                            _formKey.currentState.validate();
                            // if (_formKey.currentState.validate()) {
                            //   if (!await user.signIn(
                            //       _email.text, _password.text))
                            //     _key.currentState.showSnackBar(SnackBar(
                            //       content: Text("Something went wrong"),
                            //     ));
                            // }
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
                        ),
                      ),
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
                                  // user.goToSignup();
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

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
