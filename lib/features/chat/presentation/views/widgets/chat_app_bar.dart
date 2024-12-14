import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/custom_appbar.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title,
      leading: InkWell(
        onTap: () => context.pop(),
        child: const Icon(Icons.arrow_back_rounded),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: const Icon(Icons.call),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {},
          child: const Icon(Icons.more_vert),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
