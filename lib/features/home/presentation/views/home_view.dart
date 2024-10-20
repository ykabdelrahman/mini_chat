import 'package:flutter/material.dart';
import 'widgets/chat_list.dart';
import 'widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          HomeAppBar(),
          ChatList(),
        ],
      ),
    );
  }
}
