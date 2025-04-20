import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/data/user_manager.dart';
import '../../../home/data/models/user_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<String, String>> signUp({
    required email,
    required password,
    required username,
    required phoneNumber,
  }) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection('users').doc(newUser.user!.uid).set({
        'uid': newUser.user!.uid,
        'email': email,
        'username': username,
        'phoneNumber': phoneNumber,
        'avatarUrl': 'default-avatar-url',
      });
      return const Right('Account created successfully');
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        return const Left('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        return const Left('The account already exists for that email.');
      } else {
        return Left(error.message.toString());
      }
    }
  }

  @override
  Future<Either<String, String>> login({
    required email,
    required password,
  }) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = userCredential.user!.uid;
      final docSnapshot = await _firestore.collection('users').doc(uid).get();
      if (!docSnapshot.exists) {
        log('User does not exist');
      }
      final userData = UserModel.fromJson(docSnapshot.data()!);
      await UserManager().setUserData(userData);

      return const Right('Login successful');
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        return const Left('No user found for that email.');
      } else if (error.code == 'invalid-credential') {
        return const Left('Email address or password is invalid.');
      } else {
        return Left(error.message.toString());
      }
    }
  }
}
