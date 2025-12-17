import 'package:get/get.dart';

import 'protection_controller.dart';

class ProtectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProtectionController>(() => ProtectionController());
  }
}
