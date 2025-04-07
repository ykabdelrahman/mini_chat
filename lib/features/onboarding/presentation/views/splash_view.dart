import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/assets.dart';

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
    return Scaffold(
      body: Center(
        child: Image.asset(
          AssetsData.logo,
          height: 254,
          width: 232,
        ),
      ),
    );
  }

  void navigateToHome() {
    User? user = FirebaseAuth.instance.currentUser;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (user != null) {
          if (mounted) {
            context.go(Routes.bottomNavBar);
          }
        } else {
          if (mounted) {
            context.go(Routes.onboarding);
          }
        }
      },
    );
  }
}
