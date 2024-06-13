import 'package:myapp/core/di/router_injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_screen_controller.g.dart';

@riverpod
Future<void> splashScreenController(SplashScreenControllerRef ref) async {
  await Future.delayed(const Duration(milliseconds: 3000), () {
    ref.read(routerInjectionProvider).replace("/login");
  });
}
