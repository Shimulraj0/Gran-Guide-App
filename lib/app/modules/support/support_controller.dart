import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../routes/app_pages.dart';

class SupportController extends GetxController {
  // Dummy contact data
  final contactName = "Daughter";
  final contactNumber = "+8801XXXXXXXXX";

  void onEmergencyCall() {
    print("Initiating emergency call to $contactNumber");
    Get.toNamed(Routes.INCOMING_CALL);
  }

  void onEmergencyMessage() {
    print("Initiating emergency message to $contactNumber");
    Get.toNamed(
      Routes.CONTACT_PROFILE,
      arguments: {
        "name": contactName,
        "image": "assets/images/daughter.png", // specific asset?
        "handle": contactNumber,
      },
    );
  }

  void onNeedHelp() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Now!",
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              _buildDialogButton("Contact Admin", () {
                Get.back();
                Get.toNamed(
                  Routes.CONTACT_PROFILE,
                  arguments: {
                    "name": "Admin",
                    "image": "assets/images/admin.png",
                    "handle": "@admin",
                  },
                );
              }),
              const SizedBox(height: 12),
              _buildDialogButton("Contact GranGuide", () {
                Get.back();
                Get.toNamed(
                  Routes.CONTACT_PROFILE,
                  arguments: {
                    "name": "GranGuide",
                    "image": "assets/images/granguide.png",
                    "handle": "@granguide",
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogButton(String text, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFFEB5757), // Red text
          side: const BorderSide(color: Color(0xFFEB5757)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          elevation: 0,
        ),
        child: Text(
          text,
          style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void onBrowseHelpTopics() {
    print("Navigate to all help topics");
    // Get.toNamed(Routes.HELP_TOPICS);
  }

  void onArticleTap(String title) {
    print("Tapped article: $title");
    if (title.contains("screen sharing")) {
      showScreenShareDialog();
    }
  }

  void showScreenShareDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Screen share",
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Stop screen share?",
                style: GoogleFonts.outfit(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2F80ED), // Blue
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.snackbar("Screen Share", "Screen sharing stopped");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFFEB5757),
                        side: const BorderSide(color: Color(0xFFEB5757)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text("Stop"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
