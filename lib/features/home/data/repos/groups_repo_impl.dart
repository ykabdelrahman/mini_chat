import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_chat/features/home/data/repos/groups_repo.dart';
import 'package:mini_chat/features/new_group/data/models/group_model.dart';

class GroupsRepoImpl implements GroupsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<Either<String, List<GroupModel>>> fetchGroups() async* {
    final user = FirebaseAuth.instance.currentUser;
    try {
      await for (final snapshot in _firestore
          .collection('groups')
          .where('participants', arrayContains: user!.uid)
          .orderBy('createdAt', descending: true)
          .snapshots()) {
        final groups = snapshot.docs.map((doc) {
          return GroupModel.fromMap(doc.data());
        }).toList();
        yield Right(groups);
      }
    } catch (error) {
      yield Left('Error fetching groups: $error');
    }
  }
}
