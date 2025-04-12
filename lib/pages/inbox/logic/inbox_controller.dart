import 'package:chat_app/functions/user_functions.dart';
import 'package:chat_app/pages/inbox/state/inbox_state.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InboxController extends GetxController {
  final InboxState state = InboxState();
  final SupabaseClient supabase = Supabase.instance.client;

  Stream<List<Map<String, dynamic>>> getInboxStream() {
    final String? currentUserId = UserFunctions.getUserId();
    return supabase
        .from('profiles')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: false)
        .map((allInbox) => allInbox.where((inbox) => inbox['id'] != currentUserId).toList());
  }
}
