import 'package:dartz/dartz.dart';
import '../models/user_model.dart';

abstract class HomeRepo {
  Stream<Either<String, List<UserModel>>> fetchUsers();
}
