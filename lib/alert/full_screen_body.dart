import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../theme/button_style/my_button_style.dart';
import '../theme/colors/my_colors.dart';

class FullScreenBody extends StatelessWidget {
  final String message;
  const FullScreenBody({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhosphorIcon(
            PhosphorIcons.check(),
            color: MyColors.strokeSuccess,
            size: 44,
          ),
          const Gap(16),
          Text(
            'success'.tr,
            style: Get.textTheme.titleLarge?.copyWith(),
          ),
          const Gap(4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyMedium?.copyWith(
                color: MyColors.onSurfaceMedium,
              ),
            ),
          ),
          const Gap(86),
          ElevatedButton(
            onPressed: Get.back,
            style: ElevatedButton.styleFrom(
              minimumSize: MyButtonStyle.buttonMinSize,
            ),
            child: Text('understood'.tr),
          ),
        ],
      ),
    );
  }
}
