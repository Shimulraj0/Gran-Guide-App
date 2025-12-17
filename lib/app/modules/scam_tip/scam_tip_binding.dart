import 'package:get/get.dart';
import 'scam_tip_controller.dart';

class ScamTipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScamTipController>(() => ScamTipController());
  }
}
