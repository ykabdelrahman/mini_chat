import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../view_model/auth_cubit/auth_cubit.dart';
import 'widgets/dont_have_account.dart';
import 'widgets/login_bloc_listener.dart';
import 'widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  AssetsData.logo,
                  width: 300,
                  height: 150,
                ),
                const SizedBox(height: 18),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login to your account',
                    style: Styles.textStyle20,
                  ),
                ),
                const SizedBox(height: 26),
                const LoginForm(),
                const SizedBox(height: 50),
                CustomButton(
                  text: "Login",
                  onTap: () {
                    if (context
                        .read<AuthCubit>()
                        .loginFormKey
                        .currentState!
                        .validate()) {
                      context.read<AuthCubit>().login();
                    }
                  },
                ),
                const SizedBox(height: 26),
                const DontHaveAccount(),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
