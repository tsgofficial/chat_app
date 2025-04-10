import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'alert_buttons.dart';
import 'handle_bar.dart';

class BottomSheetBody extends StatelessWidget {
  final String? title;
  final Widget? child;
  final Color? color;
  final String? negativeButtonText;
  final String? positiveButtonText;
  final Function()? onPositiveClicked;
  final Function()? onNegativeClicked;
  final bool? disableScroll;

  final Axis? buttonDirection;
  const BottomSheetBody({
    this.child,
    this.title,
    this.color,
    this.negativeButtonText,
    this.positiveButtonText,
    this.onPositiveClicked,
    this.onNegativeClicked,
    super.key,
    this.disableScroll = true,
    this.buttonDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxHeight: Get.height * 0.9,
            ),
            margin: const EdgeInsets.only(top: kToolbarHeight),
            decoration: BoxDecoration(
              color: color ?? Get.theme.bottomSheetTheme.backgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(8),
                  const HandleBar(),
                  const Gap(20),
                  if (title != null)
                    Column(
                      children: [
                        Text(
                          title!,
                          style: Get.textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(12),
                      ],
                    ),
                  if (child != null)
                    Flexible(
                      child: ListView(
                        shrinkWrap: true,
                        addAutomaticKeepAlives: true,
                        physics: (disableScroll ?? true) ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
                        children: [
                          child!,
                        ],
                      ),
                    ),
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
        ),
      ],
    );
  }
}
