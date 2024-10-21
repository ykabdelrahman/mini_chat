import 'package:go_router/go_router.dart';
import 'package:mini_chat/features/home/presentation/views/bottom_nav_bar.dart';
import 'package:mini_chat/features/profile/presentation/views/profile_view.dart';
import '../../features/auth/presentation/views/login/login_view.dart';
import '../../features/auth/presentation/views/signup/signup_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/onboarding/presentation/views/splash_view.dart';
import '../func/transition_page.dart';
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
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: Routes.signupView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const SignupView(),
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
    ],
  );
}
