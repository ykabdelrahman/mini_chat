import 'package:dartz/dartz.dart';

abstract class NewGroupRepo {
  Future<Either<String, String>> createGroup({required group});
}
