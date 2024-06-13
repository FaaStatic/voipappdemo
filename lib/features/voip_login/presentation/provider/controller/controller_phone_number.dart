import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller_phone_number.g.dart';

@Riverpod(keepAlive: true)
TextEditingController controllerPhoneNumber(ControllerPhoneNumberRef ref) =>
    TextEditingController();
