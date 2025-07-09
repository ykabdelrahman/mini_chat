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

class _BottomNavBarState extends State<BottomNavBar>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = 0;
  final List<Widget> pages = [
    const HomeView(),
    const StatusView(),
    const CallsView(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsManager.bgColor,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: ColorsManager.offWhite.withValues(alpha: .4),
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
      body: IndexedStack(index: currentIndex, children: pages),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
