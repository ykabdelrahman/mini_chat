import 'package:dartz/dartz.dart';
import '../../../new_group/data/models/group_model.dart';

abstract class GroupsRepo {
  Stream<Either<String, List<GroupModel>>> fetchGroups();
}
