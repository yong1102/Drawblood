import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

String? useruid() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  final uid = user?.uid;
  return uid;
}
