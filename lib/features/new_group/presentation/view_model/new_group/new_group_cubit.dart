import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/group_model.dart';
import '../../../data/repos/new_group_repo.dart';
part 'new_group_state.dart';

class NewGroupCubit extends Cubit<NewGroupState> {
  NewGroupCubit(this.newGroupRepo) : super(NewGroupInitial());
  final NewGroupRepo newGroupRepo;
  void createGroup({required GroupModel group}) async {
    emit(NewGroupLoading());

    final result = await newGroupRepo.createGroup(group: group);
    result.fold(
      (failure) => emit(NewGroupFailure(failure)),
      (message) => emit(NewGroupSuccess(message, group)),
    );
  }
}
