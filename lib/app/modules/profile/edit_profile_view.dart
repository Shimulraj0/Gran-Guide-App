// ignore_for_file: unnecessary_underscores, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_controller.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controllers with current user data
    // Note: In a real app, you might want to handle this in the controller to avoid
    // resetting on rebuilds, but for this stateless view getting data from controller is fine.
    // However, since we want to edit, we need new TextEditingControllers.
    // To avoid them being recreated on every hot reload/rebuild, we ideally put them in the controller.
    // But for simplicity/scope here:
    final nameController = TextEditingController(
      text: controller.user.value.name,
    );
    final emailController = TextEditingController(
      text: controller.user.value.email,
    );
    final phoneController = TextEditingController(
      text: controller.user.value.phone,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      foregroundImage: AssetImage(
                        'assets/images/Ellipse 1.png',
                      ),
                      onForegroundImageError: (_, __) =>
                          const Icon(Icons.person, size: 50),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      controller.user.value.name,
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      controller.user.value.email,
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              _buildTextField("Name", nameController),
              const SizedBox(height: 20),
              _buildTextField("Email", emailController),
              const SizedBox(height: 20),
              _buildTextField("Phone", phoneController),

              const SizedBox(height: 60),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.updateProfile(
                      nameController.text,
                      emailController.text,
                      phoneController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A90E2),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Save & Change",
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF4A90E2)),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          style: GoogleFonts.outfit(fontSize: 14),
        ),
      ],
    );
  }
}
