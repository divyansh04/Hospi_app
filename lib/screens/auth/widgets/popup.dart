import 'package:flutter/material.dart';
import 'package:hospital_management_app/screens/Admin_Dashboard_Screens/book_appointment.dart';

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
                // margin: EdgeInsets.all(20.0),
                // padding: EdgeInsets.all(15.0),
                // height: 470.0,
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
                      color: Colors.blue,
                      child: Center(
                          child: Text(
                        'Patient added.',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FlatButton(
                      color: Colors.blue,
                      splashColor: Colors.white.withAlpha(40),
                      child: Text(
                        'Back',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, BookAppointment.routeName);
                      },
                    ),
                    // Container(
                    //   height: 40,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       Container(
                    //         height: 40,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.only(
                    //                 bottomRight: Radius.circular(5)),
                    //             border:
                    //                 Border.all(color: Colors.orange, width: 1),
                    //             color: Colors.white),
                    //         width: MediaQuery.of(context).size.width / 2,
                    //         child: FlatButton(
                    //           color: Colors.orange,
                    //           splashColor: Colors.white.withAlpha(40),
                    //           child: Text(
                    //             'Logout',
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 13.0),
                    //           ),
                    //           onPressed: () {},
                    //         ),
                    //       ),
                    //       Container(
                    //         height: 40,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.only(
                    //                 bottomLeft: Radius.circular(5)),
                    //             border:
                    //                 Border.all(color: Colors.orange, width: 1),
                    //             color: Colors.white),
                    //         width: MediaQuery.of(context).size.width / 2,
                    //         child: FlatButton(
                    //           color: Colors.white,
                    //           splashColor: Colors.white.withAlpha(40),
                    //           child: Text(
                    //             'Cancel',
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(
                    //                 color: Colors.orange,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 13.0),
                    //           ),
                    //           onPressed: () {},
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
