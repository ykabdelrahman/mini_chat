part of 'new_group_cubit.dart';

sealed class NewGroupState {
  const NewGroupState();
}

final class NewGroupInitial extends NewGroupState {}

final class NewGroupLoading extends NewGroupState {}

final class NewGroupSuccess extends NewGroupState {
  final String message;
  final GroupModel group;
  const NewGroupSuccess(this.message, this.group);
}

final class NewGroupFailure extends NewGroupState {
  final String message;
  const NewGroupFailure(this.message);
}
