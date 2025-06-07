import 'package:get/get.dart';

import '../controllers/history1_controller.dart';

class History1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<History1Controller>(
      () => History1Controller(),
    );
  }
}
