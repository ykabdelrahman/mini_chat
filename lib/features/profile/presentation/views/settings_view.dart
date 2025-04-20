import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_chat/core/widgets/custom_button.dart';
import '../../../../core/data/user_manager.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_appbar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Settings',
        centerTitle: true,
        leading: InkWell(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            const Row(),
            const Spacer(),
            CustomButton(
              text: 'Logout',
              onTap: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  UserManager().clearUserData();
                  if (context.mounted) {
                    context.go(Routes.onboarding);
                  }
                  log('Signed out successfully');
                } catch (e) {
                  log('Error signing out: $e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
