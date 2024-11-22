import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<String, String>> signUp({
    required email,
    required password,
    required username,
    required phoneNumber,
  });
  Future<Either<String, String>> login({required email, required password});
}
