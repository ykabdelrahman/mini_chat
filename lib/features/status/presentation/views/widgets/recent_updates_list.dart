import 'package:flutter/material.dart';
import 'status_list_item.dart';

class RecentUpdatesList extends StatelessWidget {
  const RecentUpdatesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return const StatusListItem(isViewed: false);
        },
        childCount: 5,
      ),
    );
  }
}
