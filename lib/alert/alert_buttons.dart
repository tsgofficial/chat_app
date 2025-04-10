import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../theme/colors/my_colors.dart';

class AlertButtons extends StatelessWidget {
  final String? negativeButtonText;
  final String? positiveButtonText;
  final Function()? onPositiveClicked;
  final Function()? onNegativeClicked;
  final Axis? buttonDirection;

  const AlertButtons({
    super.key,
    this.negativeButtonText,
    this.positiveButtonText,
    this.onPositiveClicked,
    this.onNegativeClicked,
    this.buttonDirection,
  });

  @override
  Widget build(BuildContext context) {
    if (negativeButtonText == null && positiveButtonText == null) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        const Divider(),

        const Gap(16),

        ///Action buttons
        buttonDirection == Axis.vertical
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    if (negativeButtonText != null)
                      ElevatedButton(
                        onPressed: _onNegativeButtonClicked,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.primarySoft,
                        ),
                        child: Text(
                          negativeButtonText!,
                          style: TextStyle(
                            color: Get.theme.primaryColor,
                          ),
                        ),
                      ),
                    if (negativeButtonText != null) const Gap(12),
                    if (positiveButtonText != null)
                      ElevatedButton(
                        onPressed: _onPositiveButtonClicked,
                        child: Text(
                          positiveButtonText!,
                        ),
                      ),
                    const Gap(16),
                  ],
                ),
              )
            : Row(
                children: [
                  const Gap(16),

                  ///Negative Button
                  if (negativeButtonText != null)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _onNegativeButtonClicked,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.primarySoft,
                        ),
                        child: Text(
                          negativeButtonText!,
                          style: TextStyle(
                            color: Get.theme.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  if (negativeButtonText != null) const Gap(12),

                  ///Positive Button
                  if (positiveButtonText != null)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _onPositiveButtonClicked,
                        child: Text(
                          positiveButtonText!,
                        ),
                      ),
                    ),
                  const Gap(16),
                ],
              ),

        const Gap(16),
      ],
    );
  }

  void _onNegativeButtonClicked() {
    Get.back();
    onNegativeClicked?.call();
  }

  void _onPositiveButtonClicked() {
    Get.back();
    onPositiveClicked?.call();
  }
}
