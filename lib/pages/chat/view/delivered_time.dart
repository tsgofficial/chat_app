import 'package:chat_app/theme/colors/my_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DeliveredTime extends StatelessWidget {
  final dynamic chat;
  final int timeDiff;
  const DeliveredTime({required this.chat, required this.timeDiff, super.key});

  @override
  Widget build(BuildContext context) {
    if (timeDiff < 10) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        DateFormat('yyyy-MM-dd HH:ss').format(DateTime.parse(chat['created_at'])),
        style: Get.theme.textTheme.bodySmall?.copyWith(color: MyColors.primaryColor),
      ),
    );
  }
}
