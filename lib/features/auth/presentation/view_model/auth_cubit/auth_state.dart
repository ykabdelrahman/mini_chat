part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSignUpSuccess extends AuthState {
  final String successMsg;

  AuthSignUpSuccess(this.successMsg);
}

final class AuthLoginSuccess extends AuthState {
  final String successMsg;

  AuthLoginSuccess(this.successMsg);
}

final class AuthFailure extends AuthState {
  final String errorMsg;

  AuthFailure(this.errorMsg);
}
