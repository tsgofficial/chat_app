import 'package:flutter/material.dart';

import '../colors/my_colors.dart';

class MyDialogStyle {
  static DialogTheme dialogTheme = const DialogTheme(
    backgroundColor: MyColors.popupBackgroundColor,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: MyColors.textHigh,
    ),
    contentTextStyle: TextStyle(
      fontSize: 14,
      color: MyColors.onSurfaceMedium,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  );
}
