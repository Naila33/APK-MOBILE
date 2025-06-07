import 'package:get/get.dart';

import '../controllers/hasil_soallatihan_controller.dart';

class HasilSoallatihanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HasilSoallatihanController>(
      () => HasilSoallatihanController(),
    );
  }
}
