import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../themes/colors_manager.dart';
import '../themes/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
  });
  final String? title;

  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title!,
        style: Styles.textStyle20.copyWith(color: ColorsManager.mainGreen),
      ),
      centerTitle: true,
      leading: InkWell(
        onTap: () => context.pop(),
        child: const Icon(
          Icons.arrow_back_rounded,
          color: ColorsManager.mainGreen,
        ),
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
