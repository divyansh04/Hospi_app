import 'package:flutter/material.dart';
import '../../book_appointment.dart';

class SubmittedPopUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SubmittedPopUpState();
}

class SubmittedPopUpState extends State<SubmittedPopUp>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(15.0),
                height: 200,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      width: double.infinity,
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        'Submitted',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Text(
                        "Patient Saved Successfully. Select the patient from Registered Patients to book appointment",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    MaterialButton(
                      color: Colors.blue.shade600,
                      splashColor: Colors.white.withAlpha(40),
                      child: Text(
                        'Continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context)
                            .pushReplacementNamed(BookAppointment.routeName);
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
