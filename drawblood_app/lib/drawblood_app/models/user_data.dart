import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? name;
  final String? bloodtype;
  final String? gender;
  final String? height;
  final String? phonenum;
  final String? point;
  final String? weight;
  final DateTime? lastapp;

  UserModel(
      {this.name,
      this.bloodtype,
      this.gender,
      this.height,
      this.phonenum,
      this.point,
      this.weight,
      this.lastapp});

  static UserModel fromJson(Map<String, dynamic> snapshot) => UserModel(
        name: snapshot['name'],
        bloodtype: snapshot['bloodtype'],
        gender: snapshot['gender'],
        height: snapshot['height'],
        phonenum: snapshot['phonenum'],
        point: snapshot['point'],
        weight: snapshot['weight'],
        lastapp: snapshot['lastapp'].toDate(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "bloodtype": bloodtype,
        "gender": gender,
        "height": height,
        "phonenum": phonenum,
        "point": point,
        "weight": weight,
        "lastapp": lastapp
      };
}

class appoint {
  final String? vanue;
  final String? status;
  final DateTime? date;
  final DateTime? createdate;

  appoint({this.vanue, this.status, this.date, this.createdate});

  static appoint fromJson(Map<String, dynamic> snapshot) => appoint(
        vanue: snapshot['vanue'],
        status: snapshot['status'],
        date: snapshot['date'].toDate(),
        createdate: snapshot['createdate'].toDate(),
      );

  Map<String, dynamic> toJson() =>
      {"vanue": vanue, "status": status, "createdate": createdate};
}
