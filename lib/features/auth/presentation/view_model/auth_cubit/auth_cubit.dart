import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/auth_repo.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailSignupController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordSignupController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final signupFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  bool isPasswordSecureLogin = true;
  bool isPasswordSecure = true;
  bool isConPasswordSecure = true;

  AuthCubit(this._authRepo) : super(AuthInitial());

  Future<void> signUp() async {
    emit(AuthLoading());
    final results = await _authRepo.signUp(
      email: emailSignupController.text,
      password: passwordSignupController.text,
      username: usernameController.text,
      phoneNumber: phoneController.text,
    );
    results.fold(
      (failure) => emit(AuthFailure(failure)),
      (success) {
        emit(AuthSignUpSuccess(success));
      },
    );
  }

  Future<void> login() async {
    emit(AuthLoading());
    final results = await _authRepo.login(
      email: emailLoginController.text,
      password: passwordLoginController.text,
    );
    results.fold(
      (failure) => emit(AuthFailure(failure)),
      (success) {
        emit(AuthLoginSuccess(success));
      },
    );
  }
}
