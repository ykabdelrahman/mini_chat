import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<String, String>> signUp({
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  });
  Future<Either<String, String>> login(
      {required String email, required String password});
}
