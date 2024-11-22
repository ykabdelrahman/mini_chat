import 'package:bloc/bloc.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repos/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> getUsers() async {
    emit(UserLoading());
    final results = await homeRepo.fetchUsers();
    results.fold(
      (failure) => emit(UserFailure(failure)),
      (users) => emit(
        UserLoaded(users),
      ),
    );
  }
}
