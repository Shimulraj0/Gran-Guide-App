import 'package:get/get.dart';

class SupportController extends GetxController {
  // Dummy contact data
  final contactName = "Daughter";
  final contactNumber = "+8801XXXXXXXXX";

  void onEmergencyCall() {
    print("Initiating emergency call to $contactNumber");
    // TODO: Implement url_launcher for tel:
  }

  void onEmergencyMessage() {
    print("Initiating emergency message to $contactNumber");
    // TODO: Implement url_launcher for sms:
  }

  void onBrowseHelpTopics() {
    print("Navigate to all help topics");
    // Get.toNamed(Routes.HELP_TOPICS);
  }

  void onArticleTap(String title) {
    print("Tapped article: $title");
  }
}
