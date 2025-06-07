import 'package:get/get.dart';

import '../controllers/historyfull_controller.dart';

class HistoryfullBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryfullController>(
      () => HistoryfullController(),
    );
  }
}
