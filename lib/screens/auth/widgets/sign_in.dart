import 'package:flutter/material.dart';
import 'decoration_functions.dart';
import 'sign_in_up_bar.dart';
import 'title.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key key,
    @required this.onRegisterClicked,
  }) : super(key: key);

  final VoidCallback onRegisterClicked;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    // final isSubmitting = context.isSubmitting();
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'Welcome\nBack',
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextFormField(
                        decoration: signInInputDecoration(hintText: 'Email'),
                        onChanged: (value) {
                          _email = value;
                        },
                        // ignore: missing_return
                        validator: (value) {
                          if (!(value.contains("@")) && value.isNotEmpty) {
                            return 'please enter a valid email address';
                          }
                          if (value == null || value.isEmpty) {
                            return 'please enter email address';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextFormField(
                        decoration: signInInputDecoration(hintText: 'Password'),
                        onChanged: (value) {
                          _password = value;
                        },
                        // ignore: missing_return
                        validator: (value) {
                          if (!(value.length > 5) && value.isNotEmpty) {
                            return 'Password should contain more than 5 characters';
                          }
                          if (value == null || value.isEmpty) {
                            return 'please enter password';
                          }
                        },
                      ),
                    ),
                    SignInBar(
                      label: 'Sign in',
                      isLoading: loading, // isSubmitting,
                      onPressed: () {
                        // context.signInWithEmailAndPassword();
                        if (formKey.currentState.validate()) {}
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    const Text(
                      "or sign in with",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [],
                    ),
                    const Spacer(),
                    InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          widget.onRegisterClicked?.call();
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'SIGN UP',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
