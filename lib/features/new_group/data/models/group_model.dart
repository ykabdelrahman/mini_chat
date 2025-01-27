import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel {
  final String id;
  final String groupName;
  final List<String> participants;
  final Timestamp createdAt;

  GroupModel({
    required this.id,
    required this.groupName,
    required this.participants,
    required this.createdAt,
  });

  factory GroupModel.fromMap(Map<String, dynamic> data) {
    return GroupModel(
      id: data['id'] ?? '',
      groupName: data['groupName'] ?? '',
      participants: List<String>.from(data['participants'] ?? []),
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'groupName': groupName,
      'participants': participants,
      'createdAt': createdAt,
    };
  }
}
