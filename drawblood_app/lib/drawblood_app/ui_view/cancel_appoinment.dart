import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawblood_app/drawblood_app/models/user_appointment_list_data.dart';
import 'package:drawblood_app/drawblood_app/ui_view/appointment_history_view.dart';
import 'package:drawblood_app/firebase_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../models/user_data.dart';

final uid = useruid();
String? appoinmentid = "";

popout_cancel(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true,
            title: Text('Cancel Appoinment'),
            content: StatefulBuilder(builder: (context, setState) {
              child:
              return FutureBuilder<appoint?>(
                  future: FirestoreQuery.readUserapp(uid),
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
                      final userData = snapshot.data;
                      if (userData?.status == 'Ongoing') {
                        return Form(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Are you sure u wanna to cancel',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'appoinment below?',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('${userData?.status}')],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('${userData?.vanue}')],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('${userData?.date}')],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        appoinmentid = userData?.appointmentid;
                                        cancelapp();

                                        Fluttertoast.showToast(
                                            msg:
                                                "Appointment Cancel Successfull",
                                            timeInSecForIosWeb: 25);
                                      },
                                      child: Text(
                                        "Yes",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "No",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Form(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text('No Appoinment On Going ')],
                              ),
                            ],
                          ),
                        );
                      }
                    }
                    return Center(child: CircularProgressIndicator());
                  });
            }));
      });
}

Future<void> cancelapp() async {
  final docUser = FirebaseFirestore.instance.collection('user').doc(uid);
  final createappointment = FirebaseFirestore.instance
      .collection('user')
      .doc(uid)
      .collection('appointment')
      .doc('appoit');

  final listappointment =
      FirebaseFirestore.instance.collection('appoinment').doc(appoinmentid);

  final json = {
    'status': 'Cancel',
  };
  final json2 = {
    'status': "Cancel",
  };
  final json3 = {
    'status': "Cancel",
  };

  await createappointment.update(json);
  await listappointment.update(json2);
  await docUser.update(json3);
}
