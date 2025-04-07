import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../view_model/groups_cubit/groups_cubit.dart';
import 'group_list_item.dart';

class GroupList extends StatelessWidget {
  const GroupList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupsCubit, GroupsState>(
      builder: (context, state) {
        if (state is GroupLoading) {
          return Expanded(
            child: Skeletonizer(
              enabled: true,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const GroupListItem();
                },
              ),
            ),
          );
        }
        if (state is GroupFailure) {
          return Center(child: Text(state.message));
        }
        if (state is GroupLoaded) {
          final otherGroups = state.groups;
          return Expanded(
            child: ListView.builder(
              itemCount: otherGroups.length,
              itemBuilder: (context, index) {
                final group = otherGroups[index];
                return GroupListItem(group: group);
              },
            ),
          );
        }
        return const Expanded(child: Column());
      },
    );
  }
}
