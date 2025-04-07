import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../home/data/models/user_model.dart';
import '../../../../home/presentation/view_model/home_cubit/home_cubit.dart';
import 'new_group_list_item.dart';

class NewGroupList extends StatelessWidget {
  final Function(UserModel) onUserSelected;
  final List<UserModel> selectedUsers;

  const NewGroupList({
    super.key,
    required this.onUserSelected,
    required this.selectedUsers,
  });

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Skeletonizer(
            enabled: true,
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return const NewGroupListItem();
              },
            ),
          );
        }
        if (state is UserFailure) {
          return Center(child: Text(state.message));
        }
        if (state is UserLoaded) {
          final otherUsers =
              state.users.where((user) => user.id != currentUserId).toList();
          return ListView.builder(
            itemCount: otherUsers.length,
            itemBuilder: (context, index) {
              final user = otherUsers[index];
              return NewGroupListItem(
                user: user,
                onTap: () => onUserSelected(user),
                isSelected: selectedUsers.contains(user),
              );
            },
          );
        }
        return const Center(child: Text("No users available"));
      },
    );
  }
}
