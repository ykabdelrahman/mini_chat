import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_chat/features/new_group/data/models/group_model.dart';
import 'package:mini_chat/features/new_group/data/repos/new_group_repo_impl.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';
import '../../../home/data/models/user_model.dart';
import 'widgets/group_name_section.dart';
import 'widgets/participants_section.dart';
import 'package:uuid/uuid.dart';

class NewGroupSecondStep extends StatelessWidget {
  final List<UserModel> selectedUsers;

  const NewGroupSecondStep({super.key, required this.selectedUsers});

  @override
  Widget build(BuildContext context) {
    TextEditingController groupNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Group',
          style: Styles.textStyle20.copyWith(color: ColorsManager.textGrey),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            GroupNameSection(groupNameController: groupNameController),
            Expanded(child: ParticipantsSection(selectedUsers: selectedUsers)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (groupNameController.text.isNotEmpty) {
            String groupId = const Uuid().v4();
            GroupModel newGroup = GroupModel(
              id: groupId,
              groupName: groupNameController.text,
              participants: selectedUsers.map((user) => user.id).toList(),
              createdAt: Timestamp.now(),
            );
            NewGroupRepoImpl().createGroup(group: newGroup);
            if (context.mounted) {
              context.pushReplacement(
                Routes.groupChatView,
                extra: newGroup,
              );
            }
          }
        },
        backgroundColor: ColorsManager.mainGreen,
        child: const Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}
