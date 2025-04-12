import 'package:chat_app/components/my_loading_view.dart';
import 'package:chat_app/pages/inbox/logic/inbox_controller.dart';
import 'package:chat_app/pages/inbox/view/user_tile.dart';
import 'package:chat_app/theme/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: InboxController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.primarySoft,
          body: SafeArea(
            child: StreamBuilder(
              stream: controller.getInboxStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: MyLoadingView());
                }

                if (snapshot.hasError) {
                  return const Center(child: Text('Error loading users'));
                }

                final users = snapshot.data;

                if (users == null || users.isEmpty) {
                  return const Center(child: Text('No users yet'));
                }

                return Column(
                  children: [
                    Gap(12),
                    Text('Messages', style: Get.theme.textTheme.titleLarge?.copyWith(color: MyColors.primaryColor)),
                    Gap(24),
                    Expanded(
                      child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return UserTile(user: users[index]);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
