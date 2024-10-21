import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/routes.dart';
import 'chat_list_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ChatListItem(
            onTap: () => context.push(Routes.chatView),
          );
        },
      ),
    );
  }
}
