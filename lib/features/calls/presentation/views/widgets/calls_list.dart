import 'package:flutter/material.dart';
import 'calls_list_item.dart';

class CallsList extends StatelessWidget {
  const CallsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CallsListItem();
        },
      ),
    );
  }
}
