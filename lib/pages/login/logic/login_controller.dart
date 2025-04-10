import 'package:chat_app/pages/login/state/login_state.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../functions/user_functions.dart';
import '../../../utils/my_utils.dart';

class LoginController extends GetxController {
  final LoginState state = LoginState();
  final SupabaseClient supabase = Supabase.instance.client;

  void onVisiblePasswordChanged() {
    state.isVisiblePassword.value = !state.isVisiblePassword.value;
  }

  void onEmailChanged(String value) {
    state.email = value;
    updateButtonState();
  }

  void onPasswordChanged(String value) {
    state.password.value = value;
    updateButtonState();
  }

  void updateButtonState() {
    state.isButtonActive.value =
        (MyUtils.isValidEmail(state.email) || MyUtils.isValidUsername(state.email)) && MyUtils.isValidPassword(state.password.value);
  }

  Future<(bool, dynamic)> login() async {
    try {
      final email = state.email.trim();
      final password = state.password.value.trim();

      state.isLoading.value = true;
      final response = await UserFunctions.signIn(email: email, password: password);
      state.isLoading.value = false;

      return (true, {'message': 'Login successful', 'data': response});
    } catch (error) {
      state.isLoading.value = false;
      return (false, {'message': 'An error occurred: $error'});
    }
  }
}
