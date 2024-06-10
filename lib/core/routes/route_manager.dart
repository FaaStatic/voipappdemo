import 'package:go_router/go_router.dart';

class RouteManager {
  static final RouteManager _manager = RouteManager._internal();

  factory RouteManager() => _manager;

  RouteManager._internal();


  GoRouter managerRoutes = GoRouter( initialLocation: "/",routes: [] );

}
