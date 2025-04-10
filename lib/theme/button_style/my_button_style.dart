import 'package:flutter/material.dart';

import '../colors/my_colors.dart';
import '../text_style/my_text_style.dart';

class MyButtonStyle {
  /// Button shape
  static const OutlinedBorder _buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(24)),
  );

  /// Button minimum size
  static const Size buttonMinSize = Size(129, 48);

  /// Button padding
  static const EdgeInsetsGeometry _buttonPadding = EdgeInsets.symmetric(horizontal: 24);

  /// Elevated button style
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: MyColors.primaryColor,
    foregroundColor: Colors.white,
    disabledBackgroundColor: MyColors.disabledSurface,
    disabledForegroundColor: MyColors.onDisabledSurface,
    elevation: 0,
    shape: _buttonShape,
    minimumSize: Size(double.infinity, buttonMinSize.height),
    padding: _buttonPadding,
    textStyle: MyTextStyle.baseTextStyle.labelLarge,
  );

  /// Text button style
  static ButtonStyle textButtonStyle = TextButton.styleFrom(
    textStyle: MyTextStyle.baseTextStyle.labelLarge,
    foregroundColor: MyColors.primaryColor,
    padding: _buttonPadding,
  );

  /// Outlined button style
  static ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    shape: _buttonShape,
    side: const BorderSide(
      color: MyColors.strokePrimarySoft,
      width: 1,
    ),
    foregroundColor: MyColors.primaryColor,
    textStyle: MyTextStyle.baseTextStyle.labelLarge,
    padding: _buttonPadding,
    minimumSize: buttonMinSize,
  );
}
