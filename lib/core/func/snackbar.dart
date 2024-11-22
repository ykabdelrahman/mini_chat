import 'package:flutter/material.dart';
import '../themes/colors_manager.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
      ),
      backgroundColor: ColorsManager.mainGreen,
    ),
  );
}
