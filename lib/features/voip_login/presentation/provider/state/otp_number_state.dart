import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'otp_number_state.g.dart';

@Riverpod(keepAlive: true)
class OtpNumberState extends _$OtpNumberState {
  @override
  String build() => "";

  void changeOtpState(String inputCharOtp) {
    state = inputCharOtp;
  }
}
