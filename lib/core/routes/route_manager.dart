import 'package:go_router/go_router.dart';
import 'package:myapp/core/util/widget/error_page.dart';
import 'package:myapp/features/voip_login/presentation/screen/login_screen.dart';
import 'package:myapp/features/voip_splash/presentation/screen/splash_screen.dart';

class RouteManager {
  static final RouteManager _manager = RouteManager._internal();

  factory RouteManager() => _manager;

  RouteManager._internal();

  GoRouter managerRoutes = GoRouter(
      errorBuilder: (context, state) {
        return const ErrorPage();
      },
      initialLocation: "/",
      routes: [
        GoRoute(
            path: "/",
            builder: (context, state) {
              return const SplashScreen();
            }),
        GoRoute(
            path: "/login",
            builder: (context, state) {
              return const LoginScreen();
            }),
      ]);
}
