import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'button_style/my_button_style.dart';
import 'colors/my_colors.dart';
import 'my_fonts.dart';
import 'popup/my_bottom_sheet_style.dart';
import 'popup/my_dialog_style.dart';
import 'text_input/my_text_field_style.dart';
import 'text_style/my_text_style.dart';

class MyTheme {
  static final MyTheme _instance = MyTheme._internal();
  factory MyTheme() => _instance;

  MyTheme._internal();

  static MyTheme get instance => _instance;

  /// Get the theme data
  ThemeData get themeData => ThemeData(
        fontFamily: MyFonts.fontFamily,
        primarySwatch: Colors.blue,
        dividerColor: MyColors.dividerColor,
        scaffoldBackgroundColor: MyColors.backgroundColor,
        hintColor: MyColors.hintColor,
        textTheme: MyTextStyle.baseTextStyle,
        primaryTextTheme: GoogleFonts.notoSansTextTheme(),
        tabBarTheme: TabBarTheme(
          labelColor: MyColors.primaryColor,
          unselectedLabelColor: MyColors.onSurfaceMedium,
          labelStyle: MyTextStyle.baseTextStyle.labelMedium?.copyWith(
            color: MyColors.primaryColor,
          ),
          unselectedLabelStyle: MyTextStyle.baseTextStyle.labelMedium?.copyWith(
            color: MyColors.onSurfaceMedium,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: MyColors.dividerColor,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: MyColors.primaryColor,
                width: 2,
              ),
            ),
          ),
        ),
        switchTheme: SwitchThemeData(
          trackOutlineWidth: WidgetStateProperty.all(0),
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          thumbColor: WidgetStateProperty.all(Colors.white),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return MyColors.primaryColor;
            }
            return MyColors.onSurfaceLow;
          }),
        ),
        unselectedWidgetColor: MyColors.onSurfaceLow,
        checkboxTheme: CheckboxThemeData(
          checkColor: WidgetStateProperty.all(MyColors.primaryColor),
          fillColor: WidgetStateProperty.all(Colors.transparent),
          overlayColor: WidgetStateProperty.all(MyColors.errorColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          side: WidgetStateBorderSide.resolveWith(
            (states) {
              return BorderSide(
                color: states.contains(WidgetState.selected) ? MyColors.primaryColor : MyColors.onSurfaceLow,
                width: 2,
                strokeAlign: 1,
              );
            },
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: MyColors.primaryColor,
          secondary: MyColors.secondaryColor,
          surface: MyColors.backgroundColor,
          error: MyColors.errorColor,
        ),
        dividerTheme: const DividerThemeData(
          thickness: 0.5,
          color: MyColors.dividerColor,
          space: 0.5,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: MyButtonStyle.elevatedButtonStyle,
        ),
        textButtonTheme: TextButtonThemeData(
          style: MyButtonStyle.textButtonStyle,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: MyButtonStyle.outlinedButtonStyle,
        ),
        inputDecorationTheme: MyTextFieldStyle.inputDecoration,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: MyColors.surfaceWhite,
          scrolledUnderElevation: 0,
          iconTheme: const IconThemeData(
            color: MyColors.primaryColor,
          ),
          centerTitle: true,
          foregroundColor: Colors.white,
          actionsIconTheme: const IconThemeData(
            color: MyColors.secondaryColor,
          ),
          titleTextStyle: TextStyle(
            color: MyColors.secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: MyFonts.fontFamily,
          ),
          toolbarTextStyle: const TextStyle(color: Colors.white),
        ),
        splashFactory: InkRipple.splashFactory,
        drawerTheme: const DrawerThemeData(
          backgroundColor: MyColors.backgroundColor,
        ),
        bottomSheetTheme: MyBottomSheetStyle.bottomSheetThemeData,
        dialogTheme: MyDialogStyle.dialogTheme,
        scrollbarTheme: ScrollbarThemeData(
          thickness: WidgetStateProperty.all(0),
        ),
      );
}
