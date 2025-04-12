import 'package:chat_app/components/my_avatar.dart';
import 'package:chat_app/pages/chat/suite/chat_routes.dart';
import 'package:chat_app/theme/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';

class UserTile extends StatelessWidget {
  final dynamic user;
  const UserTile({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('${ChatRoutes.chatList}/${user['id']}');
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            MyAvatar(color: MyColors.primaryColor),
            Gap(12),
            Column(
              children: [
                Text(
                  '${user['username'] ?? ''}',
                  style: Get.theme.textTheme.labelLarge?.copyWith(color: MyColors.primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
