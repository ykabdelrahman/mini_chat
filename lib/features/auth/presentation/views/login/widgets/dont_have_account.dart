import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_chat/core/routes/routes.dart';
import '../../../../../../core/themes/colors_manager.dart';
import '../../../../../../core/themes/styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: Styles.textStyle14.copyWith(
              color: ColorsManager.offWhite.withValues(alpha: .6),
            ),
          ),
          TextSpan(
            text: ' Sign Up',
            style: Styles.textStyle14.copyWith(
              color: ColorsManager.brandDefault,
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.push(Routes.signupView);
              },
          ),
        ],
      ),
    );
  }
}
