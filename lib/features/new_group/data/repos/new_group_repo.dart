import 'package:dartz/dartz.dart';
import '../models/group_model.dart';

abstract class NewGroupRepo {
  Future<Either<String, String>> createGroup({required GroupModel group});
}
