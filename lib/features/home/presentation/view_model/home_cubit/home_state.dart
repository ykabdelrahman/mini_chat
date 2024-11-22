part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class UserLoading extends HomeState {}

final class UserLoaded extends HomeState {
  final List<UserModel> users;
  UserLoaded(this.users);
}

final class UserFailure extends HomeState {
  final String message;
  UserFailure(this.message);
}
