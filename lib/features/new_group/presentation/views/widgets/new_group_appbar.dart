import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/custom_appbar.dart';

class NewGroupAppbar extends StatelessWidget {
  const NewGroupAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'New Group',
      leading: InkWell(
        onTap: () => context.pop(),
        child: const Icon(Icons.arrow_back_rounded),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
