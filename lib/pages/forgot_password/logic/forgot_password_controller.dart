import 'package:chat_app/functions/user_functions.dart';
import 'package:chat_app/utils/my_utils.dart';
import 'package:get/get.dart';

import '../state/forgot_password_state.dart';

class ForgotPasswordController extends GetxController {
  final ForgotPasswordState state = ForgotPasswordState();

  void onEmailChanged(String value) {
    state.email = value;
    updateButtonState();
  }

  void updateButtonState() {
    state.isButtonActive.value = MyUtils.isValidEmail(state.email);
  }

  Future<(bool, dynamic)> resetPassword() async {
    try {
      final email = state.email.trim();

      state.isLoading.value = true;
      await UserFunctions.resetPassword(email: email);
      state.isLoading.value = false;

      return (true, {'message': 'Password reset link sent to $email'});
    } catch (error) {
      state.isLoading.value = false;
      return (false, {'message': 'An error occurred: $error'});
    }
  }
}
