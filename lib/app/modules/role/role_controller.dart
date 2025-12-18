import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class RoleController extends GetxController {
  // Reactive state to track selection (optional, if we want to show selection before navigating)
  final RxString selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
    // Navigate to Auth selection screen after role selection
    Get.toNamed(Routes.AUTH_SELECTION);
  }
}
