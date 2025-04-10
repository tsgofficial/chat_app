import 'package:get/get.dart';

import '../logic/register_binding.dart';
import '../view/register_screen.dart';
import 'register_routes.dart';

class RegisterPages {
  static final List<GetPage> pages = [GetPage(name: RegisterRoutes.register, page: () => const RegisterScreen(), binding: RegisterBinding())];
}
