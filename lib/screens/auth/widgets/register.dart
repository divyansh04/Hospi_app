import 'package:flutter/material.dart';
import 'decoration_functions.dart';
import 'sign_in_up_bar.dart';
import 'title.dart';

class Register extends StatefulWidget {
  const Register({Key key, this.onSignInPressed}) : super(key: key);

  final VoidCallback onSignInPressed;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'Create\nAccount',
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
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          decoration:
                              registerInputDecoration(hintText: 'Email')),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextFormField(
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
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        decoration:
                            registerInputDecoration(hintText: 'Password'),
                      ),
                    ),
                    SignUpBar(
                      label: 'Sign up',
                      isLoading: loading, //isSubmitting,
                      onPressed: () {
                        if (formKey.currentState.validate()) {}
                        // context.registerWithEmailAndPassword();
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          widget.onSignInPressed?.call();
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
