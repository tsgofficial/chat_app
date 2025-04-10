import 'package:chat_app/components/password_validation/password_rule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/my_utils.dart';

class PasswordValidation extends StatelessWidget {
  final Rx<String> password;
  const PasswordValidation({required this.password, super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue((pass) {
      final password = pass.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PasswordRule(label: 'At least 6 characters', passed: password.length >= 6),
          PasswordRule(label: 'At least 1 uppercase letter', passed: MyUtils.hasUpperCase(password)),
          PasswordRule(label: 'At least 1 lowercase letter', passed: MyUtils.hasLowerCase(password)),
          PasswordRule(label: 'At least 1 number', passed: MyUtils.hasNumber(password)),
          PasswordRule(label: 'At least 1 special character', passed: MyUtils.hasSpecialCharacter(password)),
        ],
      );
    }, password);
  }
}
