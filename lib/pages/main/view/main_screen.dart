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
          final List<Widget> screens = [Container(), Container(), Container()];

          return Scaffold(
            body: screens[currentIndex.value],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.state.currentIndex.value,
              onTap: controller.onPageChanged,
              items: [
                BottomNavigationBarItem(icon: Icon(PhosphorIcons.house()), label: 'Home'),
                const BottomNavigationBarItem(icon: Icon(PhosphorIconsFill.plusCircle), label: 'New Post'),
                BottomNavigationBarItem(icon: Icon(PhosphorIcons.user()), label: 'Profile'),
              ],
            ),
          );
        }, controller.state.currentIndex);
      },
    );
  }
}
