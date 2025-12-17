import 'package:get/get.dart';

class EducateController extends GetxController {
  // State for "Book your own class" checkboxes
  final RxBool inPersonClasses = false.obs;
  final RxBool virtualClasses = false.obs;

  void toggleInPerson(bool? value) {
    inPersonClasses.value = value ?? false;
  }

  void toggleVirtual(bool? value) {
    virtualClasses.value = value ?? false;
  }

  void joinClass() {
    // Implement booking logic here
    Get.back(); // Close dialog
    Get.snackbar("Success", "Class booking request sent!");
  }
}
