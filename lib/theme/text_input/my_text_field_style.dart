import 'package:flutter/material.dart';

import '../colors/my_colors.dart';

class MyTextFieldStyle {
  /// The default InputBorder for the app.
  static const InputBorder _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(
      color: MyColors.onSurfaceLow,
      width: 1,
    ),
  );

  /// The default InputDecorationTheme for the app.
  static InputDecorationTheme inputDecoration = InputDecorationTheme(
    filled: true,
    fillColor: WidgetStateColor.resolveWith((state) {
      if (state.contains(WidgetState.disabled)) {
        return MyColors.disabledSurface;
      }
      return Colors.transparent;
    }),
    suffixIconColor: MyColors.secondaryColor,
    prefixIconColor: MyColors.onSurfaceMedium,
    isCollapsed: false,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
    hintStyle: const TextStyle(
      color: MyColors.onSurfaceLow,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    alignLabelWithHint: false,
    labelStyle: const TextStyle(fontSize: 0),
    errorStyle: const TextStyle(fontSize: 0),
    counterStyle: const TextStyle(fontSize: 0),
    border: _defaultBorder,
    enabledBorder: _defaultBorder.copyWith(
      borderSide: const BorderSide(
        color: MyColors.strokeSecondary,
      ),
    ),
    focusedBorder: _defaultBorder.copyWith(
      borderSide: const BorderSide(
        color: MyColors.strokePrimary,
      ),
    ),
    disabledBorder: _defaultBorder.copyWith(
      borderSide: const BorderSide(
        color: MyColors.disabledSurface,
      ),
    ),
    errorBorder: _defaultBorder.copyWith(
      borderSide: const BorderSide(
        color: MyColors.strokePrimary,
        width: 1,
      ),
    ),
    focusedErrorBorder: _defaultBorder.copyWith(
      borderSide: const BorderSide(
        color: MyColors.strokePrimary,
      ),
    ),
  );
}
