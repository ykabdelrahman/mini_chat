import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_chat/features/new_group/data/models/group_model.dart';
import 'package:mini_chat/features/new_group/presentation/views/widgets/new_group_bloc_listener.dart';
import '../../../../core/themes/colors_manager.dart';
import '../../../../core/themes/styles.dart';
import '../../../home/data/models/user_model.dart';
import '../view_model/new_group/new_group_cubit.dart';
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
            Expanded(
              child: ParticipantsSection(selectedUsers: selectedUsers),
            ),
            const NewGroupBlocListener()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (groupNameController.text.isNotEmpty) {
            log('selectedUsers: ${selectedUsers.map((user) => user.id).toList()}');

            final group = GroupModel(
              id: const Uuid().v4(),
              groupName: groupNameController.text,
              participants: selectedUsers.map((user) => user.id).toList(),
              createdAt: Timestamp.now(),
            );
            context.read<NewGroupCubit>().createGroup(group: group);
          }
        },
        backgroundColor: ColorsManager.mainGreen,
        child: const Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}
