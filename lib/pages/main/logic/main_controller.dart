import 'package:get/get.dart';

import '../../core/logic/core_service.dart';
import '../state/main_state.dart';

class MainController extends GetxController {
  final MainState state = MainState();
  final CoreService coreService = Get.find<CoreService>();

  @override
  void onInit() {
    state.user = coreService.user;
    super.onInit();
  }

  void onPageChanged(int index) {
    state.currentIndex.value = index;
  }

  void changePageToHome() {
    state.currentIndex.value = 0;
  }
}
