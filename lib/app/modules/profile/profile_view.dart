import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../routes/app_pages.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Profile',
                        style: GoogleFonts.outfit(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // Balance the back button
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Profile info
            Obx(
              () => Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: const AssetImage(
                      'assets/images/Ellipse 1.png',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    controller.user.value.name,
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    controller.user.value.email,
                    style: GoogleFonts.outfit(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    text: 'Personal Information',
                    onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
                  ),
                  _buildMenuItem(
                    icon: Icons.chat_bubble_outline,
                    text: 'Chat',
                    onTap: () => Get.toNamed(Routes.CHAT),
                  ),
                  _buildMenuItem(
                    icon: Icons.card_membership,
                    text: 'Subscription Plan',
                    onTap: () => Get.toNamed(Routes.SUBSCRIPTION_PLANS),
                  ),
                  _buildMenuItem(
                    icon: Icons.language,
                    text: 'Language',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'English',
                          style: GoogleFonts.outfit(color: Colors.grey),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    onTap: () {}, // Language dialog
                  ),
                  _buildMenuItem(
                    icon: Icons.help_outline,
                    text: 'Help',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.settings_outlined,
                    text: 'Settings',
                    onTap: () => Get.toNamed(Routes.SETTINGS),
                  ),
                  _buildMenuItem(
                    icon: Icons.logout,
                    text: 'Logout',
                    textColor: Colors.red,
                    iconColor: Colors.red,
                    onTap: controller.logout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 4),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color textColor = Colors.black,
    Color iconColor = const Color(0xFF007AFF),
    Widget? trailing,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 16),
              Text(
                text,
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
              const Spacer(),
              trailing ??
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
