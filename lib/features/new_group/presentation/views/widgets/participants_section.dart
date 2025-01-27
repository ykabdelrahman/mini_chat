import 'package:flutter/material.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../home/data/models/user_model.dart';
import 'participant_item.dart';

class ParticipantsSection extends StatelessWidget {
  const ParticipantsSection({super.key, required this.selectedUsers});
  final List<UserModel> selectedUsers;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Participants',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
              color: ColorsManager.textGrey.withOpacity(.5),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: selectedUsers.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                var user = selectedUsers[index];
                return ParticipantItem(user: user);
              },
            ),
          ),
        ],
      ),
    );
  }
}
