import 'package:supabase_flutter/supabase_flutter.dart';

class UserFunctions {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<AuthResponse> signIn({required String email, required String password}) async {
    final response = await supabase.auth.signInWithPassword(email: email, password: password);

    return response;
  }

  static Future<AuthResponse> signUp({required String email, required String username, required String password}) async {
    final response = await supabase.auth.signUp(email: email, password: password, data: {'username': username});

    return response;
  }

  static bool isSessionValid(Session? session) {
    if (session == null) {
      return false;
    }

    final int? expiresAt = session.expiresAt;

    final DateTime now = DateTime.now();
    final String currentTime = now.millisecondsSinceEpoch.toString();
    final int currentTimeInMilliseconds = int.parse(currentTime.substring(0, currentTime.length - 3));

    final bool isExpired = expiresAt != null && expiresAt <= currentTimeInMilliseconds;

    return !isExpired;
  }
}
