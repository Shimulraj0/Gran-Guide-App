import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Change Password',
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
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set your new password',
              style: GoogleFonts.outfit(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 24),
            _buildPasswordField(
              label: 'Current Password',
              hintText: 'Enter current password',
            ),
            const SizedBox(height: 20),
            _buildPasswordField(
              label: 'New Password',
              hintText: 'Enter new password',
            ),
            const SizedBox(height: 20),
            _buildPasswordField(
              label: 'Retype Password',
              hintText: 'Retype new password',
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Change password logic
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF67C3F3,
                  ), // Light blue from design
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Change Password',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required String hintText,
  }) {
    // Local state for visibility toggle could be handled by a controller or ValueNotifier.
    // For simplicity without a specific controller, using a boolean variable here won't work for reactivity.
    // I'll assume standard obscurity for now, or wrap in Obx if I add logic to SettingsController.
    // Using RxBool locally is also an option if I make this a GetView or StatefulWidget.
    // For now, I'll make it always obscured with an icon that doesn't do anything yet, or better,
    // simply use true. To make it functional, I should update the controller.

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF007AFF)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.outfit(color: Colors.black),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              suffixIcon: const Icon(
                Icons.remove_red_eye_outlined,
                color: Color(0xFF007AFF),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
