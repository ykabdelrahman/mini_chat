import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mini_chat/features/home/data/models/user_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<String, List<UserModel>>> fetchUsers() async {
    try {
      final querySnapshot = await _firestore.collection('users').get();
      return Right(querySnapshot.docs.map((doc) {
        return UserModel.fromFirestore(doc.data(), doc.id);
      }).toList());
    } catch (error) {
      return Left('Error fetching users: $error');
    }
  }
}
