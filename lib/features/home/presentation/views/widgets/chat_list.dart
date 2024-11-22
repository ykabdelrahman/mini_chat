import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/routes/routes.dart';
import '../../view_model/home_cubit/home_cubit.dart';
import 'chat_list_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Expanded(
            child: Skeletonizer(
              enabled: true,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const ChatListItem();
                },
              ),
            ),
          );
        }
        if (state is UserFailure) {
          return Center(child: Text(state.message));
        }
        if (state is UserLoaded) {
          final otherUsers =
              state.users.where((user) => user.id != currentUserId).toList();
          return Expanded(
            child: ListView.builder(
              itemCount: otherUsers.length,
              itemBuilder: (context, index) {
                final user = otherUsers[index];
                return ChatListItem(
                  onTap: () => context.push(Routes.chatView),
                  username: user.username,
                );
              },
            ),
          );
        }
        return const Expanded(child: Column());
      },
    );
  }
}
