import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repos/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  void getUsers() async {
    emit(UserLoading());
    await for (final results in homeRepo.fetchUsers()) {
      results.fold(
        (failure) => emit(UserFailure(failure)),
        (users) => emit(
          UserLoaded(users),
        ),
      );
    }
  }
}
