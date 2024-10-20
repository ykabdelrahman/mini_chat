import 'package:flutter/material.dart';
import 'chat_list_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ChatListItem();
        },
      ),
    );
  }
}
