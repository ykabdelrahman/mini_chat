import 'package:flutter/material.dart';
import 'package:mini_chat/core/themes/styles.dart';
import '../../../../../core/themes/colors_manager.dart';

class StatusSectionText extends StatelessWidget {
  const StatusSectionText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: Styles.textStyle16.copyWith(
          fontWeight: FontWeight.w600,
          color: ColorsManager.textGrey.withValues(alpha: .5),
        ),
      ),
    );
  }
}
