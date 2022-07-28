import 'package:cloud_firestore/cloud_firestore.dart';

class UserRewardList {
  final String? uid;
  final String? reward_name;
  final String? status;
  final String? description;
  final Timestamp timestamp;

  UserRewardList({
    this.uid,
    this.reward_name,
    this.status,
    this.description,
    required this.timestamp,
  });

  static UserRewardList fromJson(Map<String, dynamic> snapshot) =>
      UserRewardList(
        uid: snapshot['uid'],
        reward_name: snapshot['reward_name'],
        status: snapshot['status'],
        description: snapshot['description'],
        timestamp: snapshot['timestamp'],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "reward_name": reward_name,
        "status": status,
        "description": description,
        "timestamp": timestamp,
      };
}
