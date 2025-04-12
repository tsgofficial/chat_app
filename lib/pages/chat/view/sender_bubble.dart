import 'package:chat_app/theme/colors/my_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

import 'delivered_time.dart';

class SenderBubble extends StatelessWidget {
  final dynamic chat;
  final int timeDiff;
  final bool hasRecentOwnMessage;
  const SenderBubble({required this.chat, required this.timeDiff, required this.hasRecentOwnMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DeliveredTime(chat: chat, timeDiff: timeDiff),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: Get.width * 0.7),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(hasRecentOwnMessage ? 0 : 24),
                      ),
                    ),
                    child: Text(
                      chat['content'],
                      style: Get.theme.textTheme.bodyMedium?.copyWith(color: MyColors.onPrimary),
                    ),
                  ),
                ),
                // Gap(4),
                // Text(chat['created_at'], style: Get.theme.textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
