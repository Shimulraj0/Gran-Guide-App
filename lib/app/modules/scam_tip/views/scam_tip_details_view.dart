import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../colors/app_colors.dart';
import '../../../widgets/custom_bottom_nav_bar.dart';
import '../scam_tip_controller.dart';

class ScamTipDetailsView extends GetView<ScamTipController> {
  const ScamTipDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Scam Tip Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1F1), // Light grey background
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.menu_book, color: AppColors.primary),
                      SizedBox(width: 8),
                      Text(
                        "Scam Tip Details",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Date: 7/31/2025",
                    style: TextStyle(color: AppColors.primary, fontSize: 12),
                  ),
                  const SizedBox(height: 16),

                  // Alert Title
                  Row(
                    children: const [
                      Icon(Icons.error_outline, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        "Our Account Is Locked",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Explanation
                  const Text(
                    "Detailed Explanation:",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Scammers often send emails that appear to be from your bank, email provider, or workplace IT department. These emails might say your account has been locked and prompt you to click a link to \"unlock\" it.\n\nThis is a phishing attempt. Clicking the link may lead to fake websites or download malware.",
                    style: TextStyle(height: 1.5, fontSize: 13),
                  ),
                  const SizedBox(height: 16),

                  // What to Do
                  const Text(
                    "What to Do:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildBulletPoint(
                    "on't click any links or download attachments.",
                  ),
                  _buildBulletPoint(
                    "Verify by contacting your service provider or admin directly.",
                  ),
                  _buildBulletPoint("Report suspicious emails."),
                  const SizedBox(height: 16),

                  // Protect Yourself Tips
                  const Text(
                    "Protect Yourself Tips",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildBulletPoint("Use multi-factor authentication (MFA)."),
                  _buildBulletPoint("Check email addresses carefully."),
                  _buildBulletPoint(
                    "Look out for poor grammar or urgent threats.",
                  ),

                  const SizedBox(height: 16),
                  const Text(
                    "Related Tips Section",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // More Tips dropdown
            Column(
              children: const [
                Text(
                  "More Tips",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }
}
