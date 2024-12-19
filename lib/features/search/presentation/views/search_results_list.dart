import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/presentation/views/widgets/chat_list_item.dart';
import '../view_model/search_cubit/search_cubit.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchFailure) {
        debugPrint(state.errorMessage);
        return const Text('');
      }
      if (state is SearchSuccess) {
        if (state.users.isNotEmpty) {
          final users =
              state.users.where((user) => user.id != currentUserId).toList();
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ChatListItem(
                user: users[index],
              );
            },
          );
        }
      }
      return const Text('');
    });
  }
}
