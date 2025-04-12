import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../theme/colors/my_colors.dart';

class MyTextField extends StatelessWidget {
  final TextField textField;
  const MyTextField({required this.textField, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textField.decoration?.labelText != null)
          Column(
            children: [
              Text(
                textField.decoration!.labelText!,
                style: Get.theme.textTheme.bodyMedium?.copyWith(color: MyColors.onPrimary),
              ),
              const Gap(10),
            ],
          ),
        textField,
        if (textField.decoration?.errorText != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              textField.decoration!.errorText!,
              style: Get.theme.textTheme.bodySmall?.copyWith(color: Get.theme.colorScheme.error),
            ),
          ),
      ],
    );
  }
}
