import 'package:bloc/bloc.dart';
import '../../../../home/data/models/user_model.dart';
import '../../../data/repos/search_repo.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  SearchRepo searchRepo;

  fetchUsers({required String searchText}) async {
    emit(SearchLoading());
    var results = await searchRepo.fetchSearchUsers(searchText: searchText);
    results.fold(
      (error) => emit(SearchFailure(error)),
      (users) => emit(SearchSuccess(users)),
    );
  }
}
