import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/themes/colors_manager.dart';
import '../view_model/groups_cubit/groups_cubit.dart';
import '../view_model/home_cubit/home_cubit.dart';
import 'widgets/categories_options.dart';
import 'widgets/chat_list.dart';
import 'widgets/group_list.dart';
import 'widgets/home_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedCategory = 1;

  void _updateCategory(int selected) {
    setState(() {
      _selectedCategory = selected;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getUsers();
    context.read<GroupsCubit>().getGroups();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              const HomeAppBar(),
              CategoriesOptions(
                selectedCategory: _selectedCategory,
                onCategoryChanged: _updateCategory,
              ),
              const SizedBox(height: 10),
              _selectedCategory == 1 ? const ChatList() : const GroupList(),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: ColorsManager.mainGreen,
              child: const Icon(Icons.message, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
