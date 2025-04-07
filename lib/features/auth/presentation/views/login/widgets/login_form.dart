import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/core/func/validation.dart';
import '../../../../../../core/themes/colors_manager.dart';
import '../../../../../../core/themes/styles.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    var authCubit = context.read<AuthCubit>();
    return Form(
      key: authCubit.loginFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: authCubit.emailLoginController,
            hint: 'Email',
            validator: validateEmail,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            controller: authCubit.passwordLoginController,
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
                color: ColorsManager.textGrey.withValues(alpha: .5),
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
        ],
      ),
    );
  }
}
