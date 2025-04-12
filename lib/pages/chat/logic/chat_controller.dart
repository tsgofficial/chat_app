import 'package:chat_app/functions/user_functions.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../state/chat_state.dart';

class ChatController extends GetxController {
  final ChatState state = ChatState();
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  onInit() {
    state.chatterId = Get.parameters['chatterId'];
    state.currentUserId = UserFunctions.getUserId();
    super.onInit();
  }

  Stream<List<Map<String, dynamic>>> getChatStream() {
    return supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map(
          (allMessages) =>
              allMessages
                  .where(
                    (message) =>
                        (message['sender_id'] == state.currentUserId && message['receiver_id'] == state.chatterId) ||
                        (message['sender_id'] == state.chatterId && message['receiver_id'] == state.currentUserId),
                  )
                  .toList(),
        );
  }

  Future<void> sendMessage() async {
    final String message = state.chatController.text.trim();
    if (message.isEmpty) return;

    await supabase.from('messages').insert({
      'content': message,
      'sender_id': state.currentUserId,
      'receiver_id': state.chatterId,
      'created_at': DateTime.now().toIso8601String(),
    });
    state.chatController.clear();
  }

  bool isSentMessage(Map<String, dynamic> chat) {
    return chat['sender_id'] == state.currentUserId;
  }

  bool hasRecentOwnMessage(List<dynamic> messages, int index, {required bool isSentMessage}) {
    if (index == 0) return false;

    final chat = messages[index];
    final previousChat = messages[index - 1];
    if (previousChat['sender_id'] != (isSentMessage ? state.currentUserId : state.chatterId)) return false;

    final DateTime chatDate = DateTime.parse(chat['created_at']);
    final DateTime previousChatDate = DateTime.parse(previousChat['created_at']);

    return previousChatDate.difference(chatDate).inMinutes < 10;
  }
}
