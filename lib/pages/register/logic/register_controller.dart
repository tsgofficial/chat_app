import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../functions/user_functions.dart';
import '../../../utils/my_utils.dart';
import '../state/register_state.dart';

class RegisterController extends GetxController {
  final RegisterState state = RegisterState();
  final SupabaseClient supabase = Supabase.instance.client;

  void onVisiblePasswordChanged() {
    state.isVisiblePassword.value = !state.isVisiblePassword.value;
  }

  void onUsernameChanged(String value) {
    state.username = value;
    updateButtonState();
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
        MyUtils.isValidUsername(state.username) && MyUtils.isValidEmail(state.email) && MyUtils.isValidPassword(state.password.value);
  }

  Future<(bool, dynamic)> register() async {
    try {
      final String email = state.email.trim();
      final String username = state.username.trim();
      final String password = state.password.value.trim();

      state.isLoading.value = true;
      final response = await UserFunctions.signUp(email: email, username: username, password: password);
      state.isLoading.value = false;

      return (true, {'message': 'Registration successful', 'data': response});
    } catch (error) {
      state.isLoading.value = false;
      return (false, {'message': 'Error registering user'});
    }
  }
}
