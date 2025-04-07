import 'package:flutter/material.dart';
import 'package:mini_chat/core/themes/styles.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../../../../core/utils/assets.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.msg,
    required this.isSender,
  });

  final String msg;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
              isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isSender)
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorsManager.veryLightGrey,
                  backgroundImage: AssetImage(AssetsData.logo),
                ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: isSender
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 250,
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSender
                          ? ColorsManager.mainGreen
                          : ColorsManager.veryLightGrey,
                      borderRadius: isSender
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(26),
                              topRight: Radius.circular(26),
                              bottomLeft: Radius.circular(26),
                            )
                          : const BorderRadius.only(
                              topLeft: Radius.circular(26),
                              topRight: Radius.circular(26),
                              bottomRight: Radius.circular(26),
                            ),
                    ),
                    child: isSender
                        ? Text(
                            msg,
                            style: Styles.textStyle16.copyWith(
                              color: Colors.white,
                            ),
                          )
                        : Text(msg, style: Styles.textStyle16),
                  ),
                ],
              ),
            ),
            if (isSender)
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorsManager.veryLightGrey,
                  backgroundImage: AssetImage(AssetsData.logo),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
