import 'package:get/get.dart';

import 'second_cover_logic.dart';

class Second_coverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Second_coverLogic());
  }
}
