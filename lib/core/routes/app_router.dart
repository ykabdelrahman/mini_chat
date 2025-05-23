import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_chat/features/home/presentation/views/bottom_nav_bar.dart';
import 'package:mini_chat/features/new_group/presentation/views/new_group_view.dart';
import 'package:mini_chat/features/profile/presentation/views/profile_view.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/views/login/login_view.dart';
import '../../features/auth/presentation/views/signup/signup_view.dart';
import '../../features/chat/presentation/views/chat_view.dart';
import '../../features/chat/presentation/views/group_chat_view.dart';
import '../../features/home/data/models/user_model.dart';
import '../../features/new_group/data/models/group_model.dart';
import '../../features/new_group/data/repos/new_group_repo.dart';
import '../../features/new_group/presentation/view_model/new_group/new_group_cubit.dart';
import '../../features/new_group/presentation/views/new_group_second_step.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/onboarding/presentation/views/splash_view.dart';
import '../../features/profile/presentation/views/settings_view.dart';
import '../func/transition_page.dart';
import '../utils/di.dart';
import 'routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Routes.onboarding,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const OnboardingView(),
        ),
      ),
      GoRoute(
        path: Routes.loginView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepo>()),
            child: const LoginView(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.signupView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepo>()),
            child: const SignupView(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.bottomNavBar,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const BottomNavBar(),
        ),
      ),
      GoRoute(
        path: Routes.profileView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const ProfileView(),
        ),
      ),
      GoRoute(
        path: Routes.chatView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: ChatView(user: state.extra as UserModel),
        ),
      ),
      GoRoute(
        path: Routes.newGroupView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const NewGroupView(),
        ),
      ),
      GoRoute(
        path: Routes.newGroupSecondStep,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => NewGroupCubit(getIt.get<NewGroupRepo>()),
            child: NewGroupSecondStep(
                selectedUsers: state.extra as List<UserModel>),
          ),
        ),
      ),
      GoRoute(
        path: Routes.groupChatView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: GroupChatView(group: state.extra as GroupModel),
        ),
      ),
      GoRoute(
        path: Routes.settingsView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const SettingsView(),
        ),
      ),
    ],
  );
}
