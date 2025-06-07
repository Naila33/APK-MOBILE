import 'package:get/get.dart';

import '../controllers/soal_latihan_controller.dart';

class SoalLatihanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SoalLatihanController>(
      () => SoalLatihanController(),
    );
  }
}
