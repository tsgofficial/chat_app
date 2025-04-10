import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../theme/colors/my_colors.dart';
import 'alert_type.dart';
import 'alert_type_icon.dart';
import 'bottom_sheet_body.dart';
import 'full_screen_body.dart';
import 'my_dialog_body.dart';

class MyAlert {
  static final MyAlert _instance = MyAlert._internal();
  factory MyAlert() => _instance;

  MyAlert._internal();

  static MyAlert get instance => _instance;

  ///Show fullscreen success alert
  void showFullScreenSuccess(String? message) {
    if (message == null) return;
    Get.dialog(
      FullScreenBody(message: message),
      useSafeArea: false,
    );
  }

  ///Show popup dialog
  Future<dynamic> showDialog({
    String? title,
    String? message,
    String? negativeButtonText,
    String? positiveButtonText,
    AlertType? alertType = AlertType.info,
    Widget? customIcon,
    Widget? customMessage,
    Function()? onPositiveClicked,
    Function()? onNegativeClicked,
    bool isDismissible = true,
    dynamic apiErrorResponse,
    Axis? buttonDirection,
  }) async {
    if (title == null && message == null && apiErrorResponse == null && customMessage == null && customIcon == null) return;
    Widget? icon;

    String? errorMessage;

    if (apiErrorResponse != null && apiErrorResponse is! String && (apiErrorResponse['showMessage'] ?? true)) {
      alertType = AlertType.error;
      errorMessage = apiErrorResponse['message'];
      positiveButtonText ??= 'close'.tr;
    }

    if (alertType != null && customIcon == null) {
      switch (alertType) {
        case AlertType.success:
          icon = AlertTypeIcon(
            icon: PhosphorIcons.checkCircle(
              PhosphorIconsStyle.fill,
            ),
            color: MyColors.successColor,
          );

        case AlertType.warning:
          icon = AlertTypeIcon(
            icon: PhosphorIcons.warningCircle(
              PhosphorIconsStyle.fill,
            ),
            color: MyColors.warningColor,
          );

        case AlertType.info:
          icon = AlertTypeIcon(
            icon: PhosphorIcons.warningCircle(
              PhosphorIconsStyle.fill,
            ),
            color: MyColors.warningColor,
          );
        case AlertType.error:
          icon = AlertTypeIcon(
            icon: PhosphorIcons.xCircle(
              PhosphorIconsStyle.fill,
            ),
            color: MyColors.errorColor,
          );
      }
    }

    return await Get.dialog(
      MyDialogBody(
        icon: icon ?? customIcon,
        title: errorMessage ?? title,
        message: message,
        customMessage: customMessage,
        negativeButtonText: negativeButtonText,
        positiveButtonText: positiveButtonText,
        onPositiveClicked: onPositiveClicked,
        onNegativeClicked: onNegativeClicked,
        isDismissible: isDismissible,
        buttonDirection: buttonDirection,
      ),
      barrierDismissible: isDismissible,
    );
  }

  ///Show bottom sheet and wrap custom body
  Future<dynamic> showBottomSheet({
    String? title,
    Widget? child,
    Color? color,
    String? negativeButtonText,
    String? positiveButtonText,
    Function()? onPositiveClicked,
    Function()? onNegativeClicked,
    bool? disableScrolling,
    Axis? buttonDirection,
  }) async {
    if (title == null && child == null) return null;
    return await Get.bottomSheet(
      BottomSheetBody(
        title: title,
        color: color,
        disableScroll: disableScrolling,
        negativeButtonText: negativeButtonText,
        positiveButtonText: positiveButtonText,
        onPositiveClicked: onPositiveClicked,
        onNegativeClicked: onNegativeClicked,
        buttonDirection: buttonDirection,
        child: child,
      ),
      isScrollControlled: true,
    );
  }
}
