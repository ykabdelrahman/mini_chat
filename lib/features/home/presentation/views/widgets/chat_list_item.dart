import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_chat/core/themes/styles.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../../../../core/utils/assets.dart';
import '../../../data/models/user_model.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({super.key, this.user});
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(Routes.chatView, extra: user),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: ColorsManager.veryLightGrey,
              backgroundImage: AssetImage(AssetsData.logo),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.username ?? 'Duhhh',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  'hi how u doing today?',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.textGrey.withOpacity(.5),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  '11:30',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.textGrey.withOpacity(.5),
                  ),
                ),
                const SizedBox(height: 8),
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: ColorsManager.mainGreen,
                  child: Center(
                    child: Text(
                      '2',
                      maxLines: 1,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
