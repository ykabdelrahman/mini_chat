import 'package:flutter/material.dart';
import 'new_group_list_item.dart';

class NewGroupList extends StatelessWidget {
  const NewGroupList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const NewGroupListItem();
        },
      ),
    );
  }
}
