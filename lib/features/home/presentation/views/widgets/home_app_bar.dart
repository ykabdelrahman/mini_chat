import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/widgets/custom_appbar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Chats',
      actions: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          child: const Icon(Icons.search),
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          color: Colors.white,
          position: PopupMenuPosition.under,
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: () {},
                child: const Text('New group', style: Styles.textStyle16),
              ),
              PopupMenuItem(
                onTap: () => context.push(Routes.profileView),
                child: const Text('Profile', style: Styles.textStyle16),
              ),
              PopupMenuItem(
                onTap: () {},
                child: const Text('Settings', style: Styles.textStyle16),
              ),
            ];
          },
        ),
      ],
    );
  }
}
