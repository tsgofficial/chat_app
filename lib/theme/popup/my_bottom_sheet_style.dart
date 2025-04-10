import 'package:flutter/material.dart';

import '../colors/my_colors.dart';

class MyBottomSheetStyle {
  static BottomSheetThemeData bottomSheetThemeData = const BottomSheetThemeData(
    backgroundColor: MyColors.popupBackgroundColor,
    elevation: 0,
    showDragHandle: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
  );
}
