import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/func/loading.dart';
import '../../../../../../core/func/snackbar.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthLoading ||
          current is AuthSignUpSuccess ||
          current is AuthFailure,
      listener: (context, state) {
        if (state is AuthLoading) {
          loading(context);
        } else if (state is AuthFailure) {
          context.pop();
          showSnackBar(context, state.errorMsg);
        } else if (state is AuthSignUpSuccess) {
          context.pop();
          showSnackBar(context, state.successMsg);
          context.push(Routes.loginView);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
