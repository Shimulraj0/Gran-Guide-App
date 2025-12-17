import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../routes/app_pages.dart';
import 'educate_controller.dart';

class EducateView extends GetView<EducateController> {
  const EducateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Educate',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.offNamed(Routes.HOME),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Learn How To Stay Safe From Scams, Fraud, And Tech Confusion. Choose How You Want To Learn!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5ebbf1), // Light blue text
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Popular Topics",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1fa4e4), // Darker blue
                ),
              ),
              const SizedBox(height: 16),
              _buildTopicCard(
                iconOrImage: Icons.bar_chart, // Placeholder for graph icon
                title: "Staying Safe on Facebook & WhatsApp",
                subtitle:
                    "Spot Fake Calls & Messages\nStay Safe on Social Media\nCreate Strong Passwords",
                actionText: "[See All Lessons]",
              ),
              const SizedBox(height: 16),
              _buildTopicCard(
                iconOrImage: Icons.wifi, // Placeholder for signal icon
                title: "How to Spot a Scam Call",
                subtitle:
                    "Spot Fake Calls & Messages\nReal examples of scam caller tricks",
              ),
              const SizedBox(height: 16),
              _buildTopicCard(
                iconOrImage: Icons.numbers, // Placeholder for hashtag
                title: "Create Strong Passwords Easily",
                subtitle:
                    "Make passwords you can remember\nKeep your accounts safe from hackers\nUse password tricks (no tech skill needed)",
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _showBookClassDialog(context),
                  icon: const Icon(Icons.calendar_today, color: Colors.white),
                  label: const Text(
                    "Book your own class",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1fa4e4), // Blue button
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildTopicCard({
    required IconData iconOrImage,
    required String title,
    required String subtitle,
    String? actionText,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFedf8fc), // Very light blue bg
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFbbe1f3)), // Light blue border
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.transparent),
            child: Icon(iconOrImage, color: Color(0xFF1fa4e4), size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B6B6B),
                    height: 1.4,
                  ),
                ),
                if (actionText != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    actionText,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2FA2E3), // Green/Blue action color
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBookClassDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => CheckboxListTile(
                  value: controller.inPersonClasses.value,
                  onChanged: controller.toggleInPerson,
                  title: const Text("In-Person Classes"),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: const Color(0xFF1fa4e4),
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Obx(
                () => CheckboxListTile(
                  value: controller.virtualClasses.value,
                  onChanged: controller.toggleVirtual,
                  title: const Text("Virtual Classes"),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: const Color(0xFF1fa4e4),
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity, // Full width button
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.red.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: controller.joinClass,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1fa4e4),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Join A Live Class",
                          style: TextStyle(
                            color: Color(0xFF1fa4e4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.touch_app, color: Colors.brown),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
