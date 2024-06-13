import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller_otp_number.g.dart';

@Riverpod(keepAlive: true)
TextEditingController controllerOtpNumber(ControllerOtpNumberRef ref) =>
    TextEditingController();
