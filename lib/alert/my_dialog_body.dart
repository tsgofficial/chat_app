import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'alert_buttons.dart';

class MyDialogBody extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? message;
  final Widget? customMessage;
  final String? negativeButtonText;
  final String? positiveButtonText;
  final Function()? onPositiveClicked;
  final Function()? onNegativeClicked;
  final bool isDismissible;
  final Axis? buttonDirection;
  const MyDialogBody({
    super.key,
    this.icon,
    this.title,
    this.message,
    this.customMessage,
    this.negativeButtonText,
    this.positiveButtonText,
    this.onPositiveClicked,
    this.onNegativeClicked,
    this.isDismissible = true,
    this.buttonDirection,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: isDismissible,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Get.theme.dialogTheme.backgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Gap(32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Column(
                      children: [
                        ///Success or Error Icon
                        if (icon != null)
                          Column(
                            children: [
                              icon!,
                              const Gap(16),
                            ],
                          ),

                        ///Title
                        if (title != null)
                          Column(
                            children: [
                              Text(
                                title!,
                                style: Get.theme.dialogTheme.titleTextStyle,
                                textAlign: TextAlign.center,
                              ),
                              const Gap(16),
                            ],
                          ),

                        ///Message
                        if (message != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                message!,
                                style: Get.theme.dialogTheme.contentTextStyle,
                                textAlign: TextAlign.center,
                              ),
                              const Gap(16),
                            ],
                          ),

                        ///Custom Message for more detailed message or instruction
                        if (customMessage != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              customMessage!,
                              const Gap(16),
                            ],
                          ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  AlertButtons(
                    negativeButtonText: negativeButtonText,
                    positiveButtonText: positiveButtonText,
                    onNegativeClicked: onNegativeClicked,
                    onPositiveClicked: onPositiveClicked,
                    buttonDirection: buttonDirection,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
