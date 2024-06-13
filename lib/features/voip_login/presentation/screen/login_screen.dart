import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/util/gap.dart';
import 'package:myapp/features/voip_login/presentation/provider/controller/controller_otp_number.dart';
import 'package:myapp/features/voip_login/presentation/provider/controller/controller_phone_number.dart';
import 'package:myapp/features/voip_login/presentation/provider/state/otp_number_state.dart';
import 'package:myapp/features/voip_login/presentation/provider/state/phone_number_state.dart';
import 'package:myapp/features/voip_login/presentation/widgets/btn_login.dart';
import 'package:myapp/features/voip_login/presentation/widgets/input_login.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(controllerPhoneNumberProvider).addListener(() {
      ref
          .read(phoneNumberStateProvider.notifier)
          .changePhoneState(ref.read(controllerPhoneNumberProvider).text);
    });
    ref.watch(controllerOtpNumberProvider).addListener(() {
      ref
          .read(otpNumberStateProvider.notifier)
          .changeOtpState(ref.read(controllerOtpNumberProvider).text);
    });

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(14),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login with Phone Number",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(heightGap: 16),
              InputLogin(
                  controller: ref.watch(controllerPhoneNumberProvider),
                  hintText: "Input Your Number Phone"),
              const Gap(heightGap: 18),
              BtnLogin(callback: () {})
            ],
          )),
    );
  }
}
