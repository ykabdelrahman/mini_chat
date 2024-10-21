import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_chat/core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_appbar.dart';
import 'widgets/custom_profile_field.dart';
import 'widgets/edit_profile_pic.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        centerTitle: true,
        leading: InkWell(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              const EditProfilePic(),
              const SizedBox(height: 16),
              const CustomProfileField(
                text: 'Username',
                hint: 'Duhhh',
              ),
              const SizedBox(height: 16),
              const CustomProfileField(
                text: 'Phone Number',
                hint: '555-555-5555',
                isLastInput: true,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Save Changes',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
