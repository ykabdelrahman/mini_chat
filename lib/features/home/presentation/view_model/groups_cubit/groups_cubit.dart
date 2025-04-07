import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../new_group/data/models/group_model.dart';
import '../../../data/repos/home_repo.dart';
part 'groups_state.dart';

class GroupsCubit extends Cubit<GroupsState> {
  GroupsCubit(this.homeRepo) : super(GroupsInitial());
  final HomeRepo homeRepo;

  void getGroups() async {
    emit(GroupLoading());
    await for (final results in homeRepo.fetchGroups()) {
      results.fold(
        (failure) => emit(GroupFailure(failure)),
        (groups) => emit(
          GroupLoaded(groups),
        ),
      );
    }
  }
}
