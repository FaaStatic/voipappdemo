import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phone_number_state.g.dart';

@Riverpod(keepAlive: true)
class PhoneNumberState extends _$PhoneNumberState {
  @override
  String build() => "";

  void changePhoneState(String inputCharPhone) {
    state = inputCharPhone;
  }
}
