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

  UserModel({
    this.name,
    this.bloodtype,
    this.gender,
    this.height,
    this.phonenum,
    this.point,
    this.weight,
  });

  static UserModel fromJson(Map<String, dynamic> snapshot) => UserModel(
        name: snapshot['name'],
        bloodtype: snapshot['bloodtype'],
        gender: snapshot['gender'],
        height: snapshot['height'],
        phonenum: snapshot['phonenum'],
        point: snapshot['point'],
        weight: snapshot['weight'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "bloodtype": bloodtype,
        "gender": gender,
        "height": height,
        "phonenum": phonenum,
        "point": point,
        "weight": weight,
      };
}
