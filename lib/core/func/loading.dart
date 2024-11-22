import 'package:flutter/material.dart';
import '../themes/colors_manager.dart';

void loading(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(
        color: ColorsManager.mainGreen,
      ),
    ),
  );
}
