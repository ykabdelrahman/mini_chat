import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_chat/core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import 'widgets/already_have_account.dart';
import 'widgets/signup_bloc_listener.dart';
import 'widgets/signup_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Create an account',
        centerTitle: true,
        leading: InkWell(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SignupForm(),
                const SizedBox(height: 40),
                CustomButton(
                  text: "Sign Up",
                  onTap: () {
                    if (context
                        .read<AuthCubit>()
                        .signupFormKey
                        .currentState!
                        .validate()) {
                      context.read<AuthCubit>().signUp();
                    }
                  },
                ),
                const SizedBox(height: 26),
                const AlreadyHaveAccount(),
                const SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
