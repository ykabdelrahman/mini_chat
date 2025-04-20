import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../models/group_model.dart';
import 'new_group_repo.dart';

class NewGroupRepoImpl implements NewGroupRepo {
  @override
  Future<Either<String, String>> createGroup(
      {required GroupModel group}) async {
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(group.id)
          .set(group.toMap());

      return const Right('Group created successfully');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
