import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_chat/core/func/validation.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../../../core/themes/colors_manager.dart';
import '../../../../../../core/themes/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          CustomTextFormField(
            controller: emailController,
            hint: 'Email',
            validator: validateEmail,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            controller: passwordController,
            hint: 'Password',
            validator: validatePassword,
            hideText: isObscureText,
            isLastInput: true,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.textGrey.withOpacity(.5),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              'Forgot Password?',
              style: Styles.textStyle12.copyWith(
                color: ColorsManager.mainGreen,
              ),
            ),
          ),
          const SizedBox(height: 50),
          CustomButton(
            text: "Login",
            onTap: () {
              if (_key.currentState!.validate()) {
                context.go(Routes.bottomNavBar);
              }
            },
          ),
        ],
      ),
    );
  }
}
