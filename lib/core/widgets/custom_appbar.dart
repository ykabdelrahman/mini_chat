import 'package:flutter/material.dart';
import '../themes/colors_manager.dart';
import '../themes/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.centerTitle,
  });
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title!,
        style: Styles.textStyle20.copyWith(color: ColorsManager.offWhite),
      ),
      leading: leading,
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
