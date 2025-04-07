import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mini_chat/features/home/data/models/user_model.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<Either<String, List<UserModel>>> fetchSearchUsers(
      {required String searchText}) async {
    try {
      final querySnapshot = await _firestore
          .collection('users')
          .where('username', isGreaterThanOrEqualTo: searchText)
          .where('username', isLessThanOrEqualTo: '$searchText\uf8ff')
          .get();
      return Right(querySnapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data());
      }).toList());
    } catch (error) {
      return Left('Error fetching users: $error');
    }
  }
}
