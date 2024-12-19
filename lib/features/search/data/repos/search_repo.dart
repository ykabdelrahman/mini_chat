import 'package:dartz/dartz.dart';
import '../../../home/data/models/user_model.dart';

abstract class SearchRepo {
  Future<Either<String, List<UserModel>>> fetchSearchUsers(
      {required String searchText});
}
