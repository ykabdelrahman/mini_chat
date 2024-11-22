import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/func/validation.dart';
import '../../../../../../core/themes/colors_manager.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../view_model/auth_cubit/auth_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  @override
  Widget build(BuildContext context) {
    var authCubit = context.read<AuthCubit>();
    return Form(
      key: authCubit.signupFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: authCubit.usernameController,
            hint: 'Username',
            validator: validateUsername,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            controller: authCubit.emailSignupController,
            hint: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: validateEmail,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            controller: authCubit.phoneController,
            hint: 'phone number',
            keyboardType: TextInputType.phone,
            validator: validatePhoneNumber,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            controller: authCubit.passwordSignupController,
            hint: 'Password',
            hideText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.textGrey.withOpacity(.5),
              ),
            ),
            validator: validatePassword,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            hint: 'Confirm Pasword',
            controller: authCubit.passwordConfirmationController,
            hideText: isPasswordConfirmationObscureText,
            isLastInput: true,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: ColorsManager.textGrey.withOpacity(.5),
              ),
            ),
            validator: (value) {
              if (value != authCubit.passwordSignupController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
