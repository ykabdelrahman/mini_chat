part of 'groups_cubit.dart';

sealed class GroupsState {
  const GroupsState();
}

final class GroupsInitial extends GroupsState {}

final class GroupLoading extends GroupsState {}

final class GroupLoaded extends GroupsState {
  final List<GroupModel> groups;
  GroupLoaded(this.groups);
}

final class GroupFailure extends GroupsState {
  final String message;
  GroupFailure(this.message);
}
