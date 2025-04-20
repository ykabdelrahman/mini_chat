import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/func/loading.dart';
import '../../../../../core/func/snackbar.dart';
import '../../../../../core/routes/routes.dart';
import '../../view_model/new_group/new_group_cubit.dart';

class NewGroupBlocListener extends StatelessWidget {
  const NewGroupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewGroupCubit, NewGroupState>(
      listenWhen: (previous, current) =>
          current is NewGroupLoading ||
          current is NewGroupSuccess ||
          current is NewGroupFailure,
      listener: (context, state) {
        if (state is NewGroupLoading) {
          loading(context);
        } else if (state is NewGroupFailure) {
          context.pop();
          log(state.message);
        } else if (state is NewGroupSuccess) {
          context.pop();
          showSnackBar(context, state.message);
          context.pushReplacement(
            Routes.groupChatView,
            extra: state.group,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
