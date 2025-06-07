import 'package:get/get.dart';

import '../controllers/ujian1_controller.dart';

class Ujian1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Ujian1Controller>(
      () => Ujian1Controller(),
    );
  }
}
