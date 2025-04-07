import 'package:flutter/material.dart';
import 'widgets/calls_app_bar.dart';
import 'widgets/calls_list.dart';

class CallsView extends StatelessWidget {
  const CallsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          CallsAppBar(),
          CallsList(),
        ],
      ),
    );
  }
}
