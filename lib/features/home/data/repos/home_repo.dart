import 'package:dartz/dartz.dart';
import '../../../new_group/data/models/group_model.dart';
import '../models/user_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<UserModel>>> fetchUsers();
  Future<Either<String, List<GroupModel>>> fetchGroups();
}
