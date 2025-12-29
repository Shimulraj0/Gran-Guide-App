import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../routes/app_pages.dart';
import 'support_controller.dart';

class SupportView extends GetView<SupportController> {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Support',
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.offNamed(Routes.HOME),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Need Help Right Now Banner
            GestureDetector(
              onTap: controller.onNeedHelp,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F8FF), // Light blue tint
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.09),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.help_outlined,
                      color: Color(0xFF2F80ED),
                      size: 28,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Need Help Right Now?",
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF2F80ED),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: const Color(0xFF2F80ED),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Emergency Contact Access Section
            Text(
              "Emergency Contact Access",
              style: GoogleFonts.outfit(
                color: const Color(0xFF2F80ED), // Blue color
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.09),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header inside card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFE0E0E0)),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.emergency_outlined,
                          color: Colors.red,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Emergency Help",
                          style: GoogleFonts.outfit(
                            color: const Color(0xFF4F4F4F),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Quickly reach out to your trusted contact in case of confusion or danger.",
                          style: GoogleFonts.outfit(
                            color: const Color.fromARGB(255, 31, 30, 30),
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              color: const Color(0xFFEB5757),
                            ), // Reddish
                            children: [
                              TextSpan(text: "${controller.contactName} - "),
                              TextSpan(
                                text: controller.contactNumber,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            // Call Button
                            Expanded(
                              child: InkWell(
                                onTap: controller.onEmergencyCall,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.call,
                                      color: Color(0xFF2F80ED),
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "[Call]",
                                      style: GoogleFonts.outfit(
                                        color: const Color(0xFF2F80ED), // Blue
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Message Button
                            Expanded(
                              child: InkWell(
                                onTap: controller.onEmergencyMessage,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.message_outlined,
                                      color: Color(0xFF2F80ED),
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "[Message]",
                                      style: GoogleFonts.outfit(
                                        color: const Color(0xFF2F80ED), // Blue
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Help Articles Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.09),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.help,
                        color: Color(0xFFB08C55),
                        size: 24,
                      ), // Gold/Brown
                      const SizedBox(width: 12),
                      Text(
                        "Help Articles",
                        style: GoogleFonts.outfit(
                          color: const Color(0xFF4F4F4F),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: Color(0xFFE0E0E0)),
                  const SizedBox(height: 12),
                  _buildHelpItem("How to reset your password"),
                  _buildHelpItem("How to allow screen sharing"),
                  _buildHelpItem("What is a scam warning?"),
                  const SizedBox(height: 12),
                  Center(
                    child: TextButton(
                      onPressed: controller.onBrowseHelpTopics,
                      child: Text(
                        "[Browse All Help Topics]",
                        style: GoogleFonts.outfit(
                          color: const Color(0xFFB08C55), // Gold/Brown
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildHelpItem(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () => controller.onArticleTap(title),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "• ",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.outfit(
                  color: const Color(0xFF333333),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
