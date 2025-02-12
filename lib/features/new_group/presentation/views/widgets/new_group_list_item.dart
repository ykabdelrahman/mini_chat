import 'package:flutter/material.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../home/data/models/user_model.dart';

class NewGroupListItem extends StatelessWidget {
  final void Function()? onTap;
  final UserModel? user;
  final bool isSelected;

  const NewGroupListItem({
    super.key,
    this.onTap,
    this.user,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                  user?.phoneNumber ?? '+2123456789',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.textGrey.withValues(alpha: .5),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const Spacer(),
            if (isSelected)
              const Icon(Icons.check_circle, color: ColorsManager.mainGreen),
          ],
        ),
      ),
    );
  }
}
