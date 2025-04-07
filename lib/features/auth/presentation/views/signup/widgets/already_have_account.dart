import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/themes/colors_manager.dart';
import '../../../../../../core/themes/styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: Styles.textStyle14.copyWith(
              color: ColorsManager.textGrey.withValues(alpha: .6),
            ),
          ),
          TextSpan(
            text: ' Login',
            style: Styles.textStyle14.copyWith(
              color: ColorsManager.mainGreen,
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
          ),
        ],
      ),
    );
  }
}
