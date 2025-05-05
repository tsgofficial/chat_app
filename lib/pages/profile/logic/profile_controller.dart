import 'package:chat_app/functions/user_functions.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;

  void signOut() async {
    await UserFunctions.signOut();
  }
}
