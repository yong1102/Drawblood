import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawblood_app/drawblood_app/models/reward_list_data.dart';
import 'package:drawblood_app/drawblood_app/models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

String? useruid() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  final uid = user?.uid;
  return uid;
}

String? useremail() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  final email = user?.email;
  return email;
}

class FirestoreQuery {
  static Stream<List<RewardModel>> readReward() {
    final rewardCollection =
        FirebaseFirestore.instance.collection("reward_list");
    return rewardCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => RewardModel.fromSnapshot(e)).toList());
  }

  static Future<UserModel?> readUserInfo(uid) async {
    final userCollection =
        FirebaseFirestore.instance.collection("user").doc(uid);
    final snapshot = await userCollection.get();
    if (snapshot.exists) {
      return UserModel.fromJson(snapshot.data()!);
    }
  }
}
