import 'package:flutter/material.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class GroupNameSection extends StatelessWidget {
  const GroupNameSection({super.key, this.groupNameController});
  final TextEditingController? groupNameController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: ColorsManager.veryLightGrey,
                child: Icon(
                  Icons.camera_alt,
                  color: ColorsManager.mainGreen,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextFormField(
                  controller: groupNameController,
                  hint: 'Group Name',
                  isLastInput: true,
                ),
              ),
            ],
          ),
          const Divider(height: 50),
        ],
      ),
    );
  }
}
