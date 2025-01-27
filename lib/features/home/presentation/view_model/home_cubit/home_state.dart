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

final class GroupLoading extends HomeState {}

final class GroupLoaded extends HomeState {
  final List<GroupModel> groups;
  GroupLoaded(this.groups);
}

final class GroupFailure extends HomeState {
  final String message;
  GroupFailure(this.message);
}
