import 'dart:async';

import 'package:chat_app/functions/user_functions.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../suite/core_screen_type.dart';

class CoreService extends GetxService {
  RxMap<String, dynamic> user = <String, dynamic>{}.obs;
  final SupabaseClient supabaseClient = Supabase.instance.client;
  final Rx<CoreScreenType> currentScreen = CoreScreenType.login.obs;

  StreamSubscription? _authSubscription;

  @override
  void onInit() {
    _authSubscription = supabaseClient.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      final bool isSessionValid = UserFunctions.isSessionValid(session);

      if (event == AuthChangeEvent.signedIn || isSessionValid) {
        user.value = session?.user.toJson() ?? {};
        changeToMainScreen();
        return;
      }

      user.value = <String, dynamic>{};
      changeToLoginScreen();
    });
    super.onInit();
  }

  void changeToLoginScreen() {
    currentScreen.value = CoreScreenType.login;
  }

  void changeToMainScreen() {
    currentScreen.value = CoreScreenType.main;
  }

  @override
  void onClose() {
    _authSubscription?.cancel();
    super.onClose();
  }
}
