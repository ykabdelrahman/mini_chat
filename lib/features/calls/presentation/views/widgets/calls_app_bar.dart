import 'package:flutter/material.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/widgets/custom_appbar.dart';

class CallsAppBar extends StatelessWidget {
  const CallsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Calls',
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
                child: const Text('Settings', style: Styles.textStyle16),
              ),
            ];
          },
        ),
      ],
    );
  }
}
