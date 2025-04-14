import 'package:chat_app/components/my_avatar.dart';
import 'package:chat_app/components/my_loading_view.dart';
import 'package:chat_app/pages/chat/logic/chat_controller.dart';
import 'package:chat_app/theme/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'receiver_bubble.dart';
import 'sender_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChatController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.primarySoft,
          appBar: AppBar(
            leading: IconButton(onPressed: Get.back, icon: Icon(PhosphorIcons.arrowLeft())),
            title: Row(
              children: [
                MyAvatar(color: MyColors.primaryColor),
                Gap(12),
                Text(
                  '${controller.state.user['username'] ?? ''}',
                  style: Get.theme.textTheme.labelLarge?.copyWith(color: MyColors.primaryColor),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: controller.getChatStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: MyLoadingView());
                    }

                    if (snapshot.hasError) {
                      return const Center(child: Text('Error loading messages'));
                    }

                    final messages = snapshot.data;

                    if (messages == null || messages.isEmpty) {
                      return const Center(child: Text('No messages yet'));
                    }

                    return ListView.separated(
                      reverse: true,
                      itemCount: messages.length,
                      padding: EdgeInsets.only(left: 12, right: 12, top: 32),
                      separatorBuilder: (_, __) => Gap(2),
                      itemBuilder: (context, index) {
                        int timeDiff = 10;
                        final chat = messages[index];

                        if (index != messages.length - 1) {
                          final previousChat = messages[index + 1];
                          final DateTime chatDate = DateTime.parse(chat['created_at']);
                          final DateTime previousChatDate = DateTime.parse(previousChat['created_at']);

                          timeDiff = chatDate.difference(previousChatDate).inMinutes;
                        }

                        final bool isSentMessage = controller.isSentMessage(chat);
                        return isSentMessage
                            ? SenderBubble(
                              chat: chat,
                              timeDiff: timeDiff,
                              hasRecentOwnMessage: controller.hasRecentOwnMessage(messages, index, isSentMessage: true),
                            )
                            : ReceiverBubble(
                              chat: chat,
                              timeDiff: timeDiff,
                              hasRecentOwnMessage: controller.hasRecentOwnMessage(
                                messages,
                                index,
                                isSentMessage: false,
                              ),
                            );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.state.chatController,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Type a message',
                          fillColor: MyColors.surfaceWhite,
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(16),
                      onPressed: controller.sendMessage,
                      icon: Icon(PhosphorIconsBold.paperPlaneTilt, color: MyColors.onPrimary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
