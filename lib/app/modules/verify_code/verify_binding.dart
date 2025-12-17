import 'package:get/get.dart';
import 'verify_controller.dart';

class VerifyCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VerifyController>(VerifyController());
  }
}
