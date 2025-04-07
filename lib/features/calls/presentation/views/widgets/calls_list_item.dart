import 'package:flutter/material.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/utils/assets.dart';

class CallsListItem extends StatelessWidget {
  const CallsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: ColorsManager.veryLightGrey,
              backgroundImage: AssetImage(AssetsData.logo),
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
                  'September 10, 7:30 PM',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.textGrey.withValues(alpha: .5),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.call,
                color: ColorsManager.textGrey.withValues(alpha: .6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
