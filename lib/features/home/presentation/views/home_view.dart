import 'package:flutter/material.dart';
import '../../../../core/themes/colors_manager.dart';
import 'widgets/chat_list.dart';
import 'widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const Column(
            children: [
              HomeAppBar(),
              ChatList(),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: ColorsManager.mainGreen,
              child: const Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
