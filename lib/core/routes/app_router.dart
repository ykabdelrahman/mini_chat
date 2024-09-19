import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/views/login/login_view.dart';
import '../../features/auth/presentation/views/signup/signup_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
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
        path: Routes.homeView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const HomeView(),
        ),
      ),
    ],
  );
}
