import 'package:go_router/go_router.dart';
import 'package:myapp/core/routes/route_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_injection.g.dart';

@riverpod
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1569984024.
GoRouter routerInjection(RouterInjectionRef ref) =>
    RouteManager().managerRoutes;
