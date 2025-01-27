import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/utils/di.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../search/data/repos/search_repo_impl.dart';
import '../../../../search/presentation/view_model/search_cubit/search_cubit.dart';
import '../../../../search/presentation/views/search_view.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Chats',
      actions: [
        InkWell(
          onTap: () => _showSearchScreen(context),
          borderRadius: BorderRadius.circular(15),
          child: const Icon(Icons.search),
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          color: Colors.white,
          position: PopupMenuPosition.under,
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: () => context.push(Routes.newGroupView),
                child: const Text('New group', style: Styles.textStyle16),
              ),
              PopupMenuItem(
                onTap: () => context.push(Routes.profileView),
                child: const Text('Profile', style: Styles.textStyle16),
              ),
              PopupMenuItem(
                onTap: () => context.push(Routes.settingsView),
                child: const Text('Settings', style: Styles.textStyle16),
              ),
            ];
          },
        ),
      ],
    );
  }

  void _showSearchScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.zero,
        ),
      ),
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchView(),
        );
      },
    );
  }
}
