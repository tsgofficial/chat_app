import 'package:chat_app/pages/chat/logic/chat_binding.dart';
import 'package:chat_app/pages/chat/suite/chat_routes.dart';
import 'package:chat_app/pages/chat/view/chat_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class ChatPages {
  static final pages = [
    GetPage(
      name: ChatRoutes.chat,
      page: () => ChatScreen(),
      binding: ChatBinding(),
    ),
  ];
}
