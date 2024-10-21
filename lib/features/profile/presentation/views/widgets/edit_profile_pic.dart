import 'package:flutter/material.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../../../../core/utils/assets.dart';

class EditProfilePic extends StatelessWidget {
  const EditProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: ColorsManager.veryLightGrey,
            backgroundImage: AssetImage(AssetsData.logo),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 26,
              width: 26,
              decoration: const BoxDecoration(
                color: ColorsManager.mainGreen,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
