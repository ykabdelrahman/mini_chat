part of 'search_cubit.dart';

sealed class SearchState {
  const SearchState();
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<UserModel> users;

  const SearchSuccess(this.users);
}

final class SearchFailure extends SearchState {
  final String errorMessage;

  const SearchFailure(this.errorMessage);
}
