import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class VerifyController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(Routes.BIOMETRIC);
  }
}
