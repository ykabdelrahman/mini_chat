import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/themes/colors_manager.dart';
import '../../view_model/home_cubit/home_cubit.dart';
import 'categories_item.dart';

class CategoriesOptions extends StatelessWidget {
  final int selectedCategory;
  final Function(int) onCategoryChanged;

  const CategoriesOptions({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          CategoriesItem(
            onTap: () {
              onCategoryChanged(1);
              context.read<HomeCubit>().getUsers();
            },
            text: 'Chats',
            bgColor:
                selectedCategory == 1 ? ColorsManager.mainGreen : Colors.white,
            textColor:
                selectedCategory == 1 ? Colors.white : ColorsManager.mainGreen,
          ),
          const SizedBox(width: 8),
          CategoriesItem(
            onTap: () {
              onCategoryChanged(2);
              context.read<HomeCubit>().getGroups();
            },
            text: 'Groups',
            bgColor:
                selectedCategory == 2 ? ColorsManager.mainGreen : Colors.white,
            textColor:
                selectedCategory == 2 ? Colors.white : ColorsManager.mainGreen,
          ),
        ],
      ),
    );
  }
}
