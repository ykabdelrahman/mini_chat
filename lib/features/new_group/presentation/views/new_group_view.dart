import 'package:flutter/material.dart';
import '../../../../core/themes/colors_manager.dart';
import 'widgets/new_group_appbar.dart';
import 'widgets/new_group_list.dart';

class NewGroupView extends StatelessWidget {
  const NewGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Column(
          children: [
            NewGroupAppbar(),
            NewGroupList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorsManager.mainGreen,
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}
