import 'package:get/get.dart';

class RegisterState {
  String username = '';
  String email = '';
  final Rx<String> password = ''.obs;

  final Rx<bool> isVisiblePassword = false.obs;
  final Rx<bool> isLoading = false.obs;
  final Rx<bool> isButtonActive = false.obs;
}
