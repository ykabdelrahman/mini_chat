import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mini_chat/features/home/data/models/user_model.dart';
import 'package:mini_chat/features/new_group/data/models/group_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<Either<String, List<UserModel>>> fetchUsers() async* {
    try {
      await for (final data in _firestore.collection('users').snapshots()) {
        yield Right(data.docs.map((doc) {
          return UserModel.fromMap(doc.data());
        }).toList());
      }
    } catch (error) {
      yield Left('Error fetching users: $error');
    }
  }

  @override
  Stream<Either<String, List<GroupModel>>> fetchGroups() async* {
    try {
      await for (final data in _firestore.collection('groups').snapshots()) {
        yield Right(data.docs.map((doc) {
          return GroupModel.fromMap(doc.data());
        }).toList());
      }
    } catch (error) {
      yield Left('Error fetching users: $error');
    }
  }
}
