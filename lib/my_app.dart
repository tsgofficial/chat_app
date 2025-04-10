import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/core/view/core_screen.dart';
import 'pages/register/suite/register_pages.dart';
import 'theme/my_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(theme: MyTheme.instance.themeData, getPages: [...RegisterPages.pages], home: const CoreScreen());
  }
}
