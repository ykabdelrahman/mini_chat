import 'package:flutter/material.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'widgets/dont_have_account.dart';
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
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 36),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login to your account',
                    style: Styles.textStyle18.copyWith(
                      color: ColorsManager.mainGreen,
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                const LoginForm(),
                const SizedBox(height: 50),
                CustomButton(
                  text: "Login",
                  onTap: () {},
                ),
                const SizedBox(height: 26),
                const DontHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
