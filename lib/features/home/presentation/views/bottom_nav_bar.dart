import 'package:flutter/material.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../calls/presentation/views/calls_view.dart';
import '../../../status/presentation/views/status_view.dart';
import 'home_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final List<Widget> pages = [
    const HomeView(),
    const StatusView(),
    const CallsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        selectedItemColor: ColorsManager.mainGreen,
        unselectedItemColor: ColorsManager.textGrey.withOpacity(.4),
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates_rounded),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
