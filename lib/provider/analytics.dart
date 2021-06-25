// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Analytics with ChangeNotifier {
//   static const ADMITTED_TABLE = "admitted table";
//   static const APPOINTMENT_TABLE = "appointment table";
//   static const PATIENT_TABLE = "patient";
//   static const STAFF_TABLE = "staff";

// ///TODO show total appointments, patient, funds count
// ///chow weekly, monthly appointment graph
// ///total doctors, staff count



//   Future<void> getAppointmentAnalytics() async {
//     DocumentReference documentReference =
//         FirebaseFirestore.instance.collection(ADMITTED_TABLE).doc(); //. get();
//     documentReference.snapshots().listen((event) {
//       event.data().forEach((key, value) {});
//     });
//   }
// }
