import 'package:get/get.dart';

class LoginState {
  String email = '';
  final Rx<String> password = ''.obs;

  final Rx<bool> isVisiblePassword = false.obs;
  final Rx<bool> isLoading = false.obs;
  final Rx<bool> isButtonActive = false.obs;
}
