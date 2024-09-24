import 'package:flutter/material.dart';
import 'package:mini_chat/core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'widgets/already_have_account.dart';
import 'widgets/signup_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Create an account'),
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
                  onTap: () {},
                ),
                const SizedBox(height: 26),
                const AlreadyHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
