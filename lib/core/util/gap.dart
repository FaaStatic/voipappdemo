import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double heightGap;
  const Gap({super.key, required this.heightGap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightGap,
    );
  }
}
