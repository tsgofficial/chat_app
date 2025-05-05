import 'package:get/get.dart';

import '../logic/forgot_password_binding.dart';
import '../view/forgot_password_screen.dart';
import 'forgot_password_routes.dart';

class ForgotPasswordPages {
  static final List<GetPage> pages = [
    GetPage(
      name: ForgotPasswordRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
