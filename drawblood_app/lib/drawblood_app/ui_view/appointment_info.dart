import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawblood_app/drawblood_app/drawbood_app_theme.dart';
import 'package:drawblood_app/drawblood_app/models/user_data.dart';
import 'package:drawblood_app/firebase_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_flutter/qr_flutter.dart';

Color statuscolor = Colors.red;
var size2;
final uid = useruid();
String? id = "";

class qrcode extends StatefulWidget {
  const qrcode({Key? key}) : super(key: key);

  @override
  State<qrcode> createState() => _qrcodeState();
}

class _qrcodeState extends State<qrcode> {
  @override
  Widget build(BuildContext context) {
    final Name = ModalRoute.of(context)!.settings.arguments;
    Size size = MediaQuery.of(context).size;
    size2 = size;
    return Scaffold(
      backgroundColor: drawbloodAppTheme.red,
      appBar: AppBar(
        backgroundColor: drawbloodAppTheme.red,
      ),
      body: FutureBuilder<appoint?>(
          future: FirestoreQuery.readUserapp(uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data;
              id = userData?.appointmentid!;
              if (userData?.status == "Ongoing") {
                statuscolor = Colors.green;
              }
              return buildbody(userData!);
            } else
              return Center(
                child: Text('Loading'),
              );
          }),
    );
  }

  Widget buildbody(appoint info) => SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: size2.height,
            child: Stack(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 300),
                    height: 700,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 40, right: 30, top: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(info.status!,
                                    style: TextStyle(
                                      color: statuscolor,
                                      fontSize: 30,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text("Venue",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(info.vanue!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text("Date",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(info.date!.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 30, top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Appointment",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          QrImage(
                            backgroundColor: Colors.white,
                            data: id!,
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      );
}
