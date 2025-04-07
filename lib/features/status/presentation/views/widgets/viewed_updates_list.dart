import 'package:flutter/material.dart';
import 'status_list_item.dart';

class ViewedUpdatesList extends StatelessWidget {
  const ViewedUpdatesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return const StatusListItem(isViewed: true);
        },
        childCount: 5,
      ),
    );
  }
}
