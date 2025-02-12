import 'package:flutter/material.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/utils/assets.dart';

class StatusListItem extends StatelessWidget {
  const StatusListItem({super.key, required this.isViewed});
  final bool isViewed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isViewed
                      ? ColorsManager.textGrey.withValues(alpha: .3)
                      : ColorsManager.mainGreen,
                  width: 2,
                ),
              ),
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: ColorsManager.veryLightGrey,
                backgroundImage: AssetImage(AssetsData.logo),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Duhhh',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  'Today, 12:00 PM',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.textGrey.withValues(alpha: .5),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
