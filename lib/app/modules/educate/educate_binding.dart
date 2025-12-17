import 'package:get/get.dart';

import 'educate_controller.dart';

class EducateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EducateController>(() => EducateController());
  }
}
