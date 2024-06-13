import 'package:flutter/material.dart';
import 'package:myapp/core/util/gap.dart';
import 'package:myapp/gen/assets.gen.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.icon.icWrongWay.image(width: 120, height: 120),
            const Gap(heightGap: 55),
            const Text(
              "Path is Not found!",
              style: TextStyle(
                  fontSize: 20, color: Colors.red, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
