import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_management_app/models/patient_model.dart';
import 'package:hospital_management_app/services/networkEngine.dart';
// import 'package:http/http.dart' as http;
// import '../models/http_exception.dart';

class Patients with ChangeNotifier {
  List _patients = [];

  List<Patient> get patients {
    return [..._patients];
  }

  Patient findbyId(String id) {
    return _patients.firstWhere((element) => element.id == id);
  }

  Future<void> fetchPatients() async {
    // List<Patient> mockPatients = [
    //   new Patient(
    //       address: "Near Madhu Hotel",
    //       age: 78,
    //       gender: "MALE",
    //       id: "ill man1622744854",
    //       name: "ill man",
    //       phone: "7458963210"),
    //   new Patient(
    //       address: "Yamuna Nagar",
    //       age: 41,
    //       gender: "Male",
    //       id: "first",
    //       name: "someone",
    //       phone: "4125638549")
    // ];
    // _patients = mockPatients;

    final url = "patients/";
    List<Patient> loadedPatients = [];
    try {
      final response = await NetworkEngine().dio.get(url);
      List<dynamic> data = response.data;

      data.forEach((element) {
        loadedPatients.add(Patient.fromJson(element));
      });
      _patients = loadedPatients;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<bool> addPatient({
    @required String name,
    @required String gender,
    @required String age,
    @required String phone,
    @required String address,
    @required String ailment,
    @required int amount,
  }) async {
    const url = "patientappointment/";

    try {
      final response = await NetworkEngine().dio.post(url, data: {
        "doctorid": 455,
        "doctor name": "makmak",
        "name": name,
        "gender": gender,
        "age": int.parse(age),
        "phone number": int.parse(phone),
        "address": address,
        "ailment": ailment,
        "amount": amount,
      });

      notifyListeners();
      if (response.data['mssg'] == "appointment data saved successfully") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw (e);
    }
  }
}

// var data = await FirebaseFirestore.instance.collection('airline').get();
//       data.docs.forEach((element) {
//         AirlineTileObject tileObject =
//             AirlineTileObject.fromJson(element.data());
//         if (tileObject.active) airlineObject.add(tileObject);
//       });

//  Reference reference = (FirebaseStorage.instance)
//             .ref()
//             .child("flyzyGoApp")
//             .child("passengerDocs")
//             .child("boardingPass")
//             .child(name);
//         UploadTask uploadTask = reference.putData(asset);
//         uploadTask.snapshotEvents.listen((event) {
//           if (event.state == TaskState.running) {
//             // print('listener: file at $i  ${event.snapshot.bytesTransferred / event.snapshot.totalByteCount}');
//             onProgressChanged(
//                 i,
//                 event.bytesTransferred / event.totalBytes * 100,
//                 flight.flightId);
//           }
//         });
