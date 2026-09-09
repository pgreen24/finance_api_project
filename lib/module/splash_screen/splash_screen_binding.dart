import 'package:get/get.dart';

import 'splash_screen_logic.dart';

class Splash_screenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Splash_screenLogic());
  }
}
