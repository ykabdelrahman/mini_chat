import 'package:flutter/material.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../../../../core/themes/styles.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    this.controller,
    this.onSubmitted,
    this.focusNode,
    this.onTapIcon,
  });

  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: onSubmitted,
              focusNode: focusNode,
              cursorColor: ColorsManager.mainGreen,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                suffixIcon: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  child: CircleAvatar(
                    backgroundColor: ColorsManager.mainGreen,
                    child: InkWell(
                      onTap: onTapIcon,
                      child: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                focusedBorder: borderStyle(),
                enabledBorder: borderStyle(),
                border: borderStyle(),
                hintText: 'Message',
                hintStyle: Styles.textStyle16.copyWith(
                  color: ColorsManager.textGrey.withValues(alpha: .6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: ColorsManager.mainGreen,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(15),
    );
  }
}
