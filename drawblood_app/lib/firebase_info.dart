import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawblood_app/drawblood_app/models/reward_list_data.dart';
import 'package:drawblood_app/drawblood_app/models/user_data.dart';
import 'package:drawblood_app/drawblood_app/models/user_reward_list_data.dart';
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

  static Future createUserRewardList(UserRewardList rewardList) async {
    final userRewardCollection =
        FirebaseFirestore.instance.collection("user_reward_list");
    final docRef = userRewardCollection.doc();

    final newUserRewardList = UserRewardList(
            uid: rewardList.uid,
            reward_name: rewardList.reward_name,
            status: rewardList.status,
            description: rewardList.description,
            timestamp: rewardList.timestamp)
        .toJson();

    try {
      await docRef.set(newUserRewardList);
    } catch (e) {
      print("Some error occured: $e");
    }
  }

  static Future updateUserPoint(uid, point) async {
    final userRewardCollection = FirebaseFirestore.instance.collection("user");
    final docRef = userRewardCollection.doc(uid);

    try {
      await docRef.update({"point": point});
    } catch (e) {
      print("Some error occured: $e");
    }
  }
}
