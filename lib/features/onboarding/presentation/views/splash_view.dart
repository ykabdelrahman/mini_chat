import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_chat/core/themes/colors_manager.dart';
import '../../../../core/routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'MINI CHAT',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: ColorsManager.mainBlue,
          ),
        ),
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (mounted) {
          context.go(Routes.onboarding);
        }
      },
    );
  }
}
