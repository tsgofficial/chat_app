import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login/view/login_screen.dart';
import '../../main/view/main_screen.dart';
import '../logic/core_service.dart';
import '../suite/core_screen_type.dart';

class CoreScreen extends StatelessWidget {
  const CoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CoreService coreService = Get.find<CoreService>();

    return ObxValue((currentScreen) {
      switch (currentScreen.value) {
        case CoreScreenType.login:
          return const LoginScreen();
        case CoreScreenType.main:
          return const MainScreen();
      }
    }, coreService.currentScreen);
  }
}
