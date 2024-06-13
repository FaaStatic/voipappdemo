import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/util/gap.dart';
import 'package:myapp/features/voip_splash/presentation/controller/splash_screen_controller.dart';
import 'package:myapp/gen/assets.gen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(splashScreenControllerProvider);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.icon.icPhone.image(width: 120, height: 120),
            const Gap(heightGap: 16),
            const Text(
              "Voip App Demo",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
