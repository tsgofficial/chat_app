import 'package:chat_app/pages/inbox/view/inbox_screen.dart';
import 'package:chat_app/pages/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../logic/main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainController(),
      builder: (controller) {
        return ObxValue((currentIndex) {
          final List<Widget> screens = [InboxScreen(), ProfileScreen()];

          return Scaffold(
            body: screens[currentIndex.value],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.state.currentIndex.value,
              onTap: controller.onPageChanged,
              items: [
                BottomNavigationBarItem(icon: Icon(PhosphorIcons.chatCircle()), label: 'Messages'),
                BottomNavigationBarItem(icon: Icon(PhosphorIcons.user()), label: 'Profile'),
              ],
            ),
          );
        }, controller.state.currentIndex);
      },
    );
  }
}
