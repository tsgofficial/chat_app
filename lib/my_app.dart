import 'package:chat_app/pages/chat/suite/chat_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/core/view/core_screen.dart';
import 'pages/register/suite/register_pages.dart';
import 'theme/my_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
        theme: MyTheme.instance.themeData,
        getPages: [...RegisterPages.pages, ...ChatPages.pages],
        home: const CoreScreen(),
      ),
    );
  }
}
