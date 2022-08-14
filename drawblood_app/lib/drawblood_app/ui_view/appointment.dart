import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawblood_app/drawblood_app/models/user_appointment_list_data.dart';
import 'package:drawblood_app/drawblood_app/ui_view/appointment_history_view.dart';
import 'package:drawblood_app/firebase_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../models/user_data.dart';
import 'appointment_info.dart';

List<clinic_list> clinic = [];
final uid = useruid();
DateTime now = new DateTime.now();
DateTime today = DateTime(now.year, now.month, now.day);
DateTime date = DateTime(now.year, now.month, now.day);
String vanue = "Venue";
List testing = [];
String? name = "";
String? gender = "";
String? height = "";
String? weight = "";
String? bloodtypes = "";

void initState() {
  getclinic();
}

popout(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true,
            title: Text('Appointment'),
            content: StatefulBuilder(builder: (context, setState) {
              child:
              return FutureBuilder<UserModel?>(
                  future: FirestoreQuery.readUserInfo(uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 0.18,
                          ),
                        ),
                      );
                    }

                    if (snapshot.hasData) {
                      getclinic();
                      final userData = snapshot.data;
                      return Form(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add_location),
                                  onPressed: () {},
                                ),
                                SizedBox(width: 15),
                                DropdownButton<String>(
                                  items: testing
                                      .map((value) => DropdownMenuItem<String>(
                                          value: value, child: Text(value)))
                                      .toList(),
                                  hint: Text(
                                    vanue,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onChanged: (value) async {
                                    setState(() => vanue = value!);
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.calendar_month),
                                  onPressed: () {},
                                ),
                                SizedBox(width: 5),
                                TextButton(
                                    style: ButtonStyle(),
                                    onPressed: () async {
                                      DateTime? Newdate = await showDatePicker(
                                          context: context,
                                          initialDate: date,
                                          firstDate: DateTime(2021),
                                          lastDate: DateTime(2050));

                                      if (Newdate == null) return;
                                      setState(() => date = Newdate);
                                    },
                                    child: Text(
                                      date.toString().substring(0, 10),
                                      style: TextStyle(color: Colors.black),
                                    ))
                              ],
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      DateTime? lastapp = userData?.lastapp;
                                      final difference =
                                          date.difference(lastapp!).inDays;
                                      if (userData?.status == "Ongoing") {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Currently you are in the appointment. Please cancel the appoinment to make a need appointment.",
                                            timeInSecForIosWeb: 25);
                                      } else if (vanue == 'Venue' ||
                                          date == null) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Please fill in the venue and date",
                                            timeInSecForIosWeb: 25);
                                      } else if (difference < 60) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Your last appoinment is ${lastapp.toString().substring(0, 10)}, please make appointment 3 month after the last date",
                                            timeInSecForIosWeb: 25);
                                      } else {
                                        name = userData?.name;
                                        weight = userData?.weight;
                                        height = userData?.height;
                                        gender = userData?.gender;
                                        bloodtypes = userData?.bloodtype;
                                        inputData();
                                        Navigator.pop(context);

                                        Fluttertoast.showToast(
                                            msg: "Appointment Successfull",
                                            timeInSecForIosWeb: 25);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const qrcode(),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.black),
                                    ))
                              ],
                            )
                          ],
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  });
            }));
      });
}

Future<void> inputData() async {
  final docUser = FirebaseFirestore.instance.collection('user').doc(uid);
  final createappointment = FirebaseFirestore.instance
      .collection('user')
      .doc(uid)
      .collection('appointment')
      .doc('appoit');

  final listappointment =
      FirebaseFirestore.instance.collection('appoinment').doc("${uid}${date}");

  final json = {
    'vanue': vanue,
    'date': date,
    'status': 'Ongoing',
    'createdate': today,
    'appointmentid': "${uid}${date}",
  };
  final json2 = {
    'vanue': vanue,
    'date': date,
    'user_id': uid,
    'name': name,
    'bloodtype': bloodtypes,
    'weight': weight,
    'height': height,
    'gender': gender,
    'status': "Ongoing",
  };
  final json3 = {
    'status': "Ongoing",
  };

  await createappointment.set(json);
  await listappointment.set(json2);
  await docUser.update(json3);
}

Future<void> getclinic() async {
  print('successful');
  final db = FirebaseFirestore.instance;
  final docRef = db.collection("user").where('type', isEqualTo: 'medical');
  var snapshot = await docRef.get();
  if (clinic.isNotEmpty) {
    clinic.clear();
  }
  if (testing.isNotEmpty) {
    testing.clear();
  }
  if (snapshot.docs.isNotEmpty) {
    for (DocumentSnapshot results in snapshot.docs) {
      Map<String, dynamic> data = results.data() as Map<String, dynamic>;

      clinic.add(clinic_list(
        name: data['name'],
      ));
      testing.insert(0, data['name']);
    }
  }
}
