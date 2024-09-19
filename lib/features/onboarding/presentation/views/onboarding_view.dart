import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_chat/core/utils/assets.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/themes/styles.dart';
import '../../../../core/widgets/custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(AssetsData.onboardingLogo, width: 250, height: 250),
              const SizedBox(height: 40),
              const Text(
                'Connect easily with\nyour family and friends\n over countries',
                style: Styles.textStyle24,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomButton(
                text: 'Start Messaging',
                onTap: () => context.go(Routes.loginView),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
