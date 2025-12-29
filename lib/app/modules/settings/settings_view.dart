import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../routes/app_pages.dart';
import '../../widgets/custom_settings_tile.dart';
import 'settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          CustomSettingsTile(
            icon: Icons.article_outlined,
            text: 'FAQs',
            onTap: () => Get.toNamed(Routes.FAQS),
          ),
          CustomSettingsTile(
            icon: Icons.help_outline,
            text: 'Help Center',
            onTap: () => Get.toNamed(Routes.HELP_CENTER),
          ),
          CustomSettingsTile(
            icon: Icons.info_outline,
            text: 'Terms & Condition',
            onTap: () => Get.toNamed(Routes.TERMS_CONDITIONS),
          ),
          CustomSettingsTile(
            icon: Icons.privacy_tip_outlined,
            text: 'Privacy Policy',
            onTap: () => Get.toNamed(Routes.PRIVACY_POLICY),
          ),
          CustomSettingsTile(
            icon: Icons.vpn_key_outlined,
            text: 'Change Password',
            onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD),
          ),
          CustomSettingsTile(
            icon: Icons.delete_outline,
            text: 'Delete Account',
            onTap: () => _showDeleteAccountDialog(context),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Do you want to delete your profile?',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: Implement delete account logic
                        Get.back();
                        Get.offAllNamed(Routes.WELCOME);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: GoogleFonts.outfit(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF007AFF),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
