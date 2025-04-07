import 'package:dartz/dartz.dart';
import '../../../new_group/data/models/group_model.dart';
import '../models/user_model.dart';

abstract class HomeRepo {
  Stream<Either<String, List<UserModel>>> fetchUsers();
  Stream<Either<String, List<GroupModel>>> fetchGroups();
}
