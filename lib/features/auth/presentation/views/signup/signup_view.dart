import 'package:flutter/material.dart';
import 'package:mini_chat/core/widgets/custom_appbar.dart';
import 'widgets/already_have_account.dart';
import 'widgets/signup_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Create an account'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SignupForm(),
                SizedBox(height: 26),
                AlreadyHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
