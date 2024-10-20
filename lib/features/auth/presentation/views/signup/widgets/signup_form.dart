import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/func/validation.dart';
import '../../../../../../core/themes/colors_manager.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          CustomTextFormField(
            controller: usernameController,
            hint: 'Username',
            validator: validateUsername,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            controller: emailController,
            hint: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: validateEmail,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            controller: phoneNumberController,
            hint: 'phone number',
            keyboardType: TextInputType.phone,
            validator: validatePhoneNumber,
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            controller: passwordController,
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
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          CustomButton(
            text: "Sign Up",
            onTap: () {
              if (_key.currentState!.validate()) {
                context.pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
