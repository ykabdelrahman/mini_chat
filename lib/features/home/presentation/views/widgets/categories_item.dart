import 'package:flutter/material.dart';
import '../../../../../core/themes/styles.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    this.bgColor,
    this.textColor,
    this.onTap,
    required this.text,
  });
  final Color? bgColor;
  final Color? textColor;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: Text(
              text,
              style: Styles.textStyle16.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
