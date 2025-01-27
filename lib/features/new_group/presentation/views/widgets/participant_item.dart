import 'package:flutter/material.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../home/data/models/user_model.dart';

class ParticipantItem extends StatelessWidget {
  const ParticipantItem({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Row(
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
              user.username,
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 3),
            Text(
              user.phoneNumber,
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorsManager.textGrey.withOpacity(.5),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
