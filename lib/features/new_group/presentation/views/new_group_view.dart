import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../home/data/models/user_model.dart';
import 'widgets/new_group_appbar.dart';
import 'widgets/new_group_list.dart';

class NewGroupView extends StatefulWidget {
  const NewGroupView({super.key});

  @override
  State<NewGroupView> createState() => _NewGroupViewState();
}

class _NewGroupViewState extends State<NewGroupView> {
  final List<UserModel> selectedUsers = [];

  void toggleSelection(UserModel user) {
    setState(() {
      if (selectedUsers.contains(user)) {
        selectedUsers.remove(user);
      } else {
        selectedUsers.add(user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const NewGroupAppbar(),
            Expanded(
              child: NewGroupList(
                onUserSelected: toggleSelection,
                selectedUsers: selectedUsers,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedUsers.isNotEmpty) {
            context.push(Routes.newGroupSecondStep, extra: selectedUsers);
          }
        },
        backgroundColor:
            selectedUsers.isEmpty ? Colors.grey : ColorsManager.mainGreen,
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
    );
  }
}
