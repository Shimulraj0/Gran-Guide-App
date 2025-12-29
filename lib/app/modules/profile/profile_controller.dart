import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/user_profile.dart';
import '../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final user = UserProfile(
    name: "Brooklyn Simmons",
    email: "mavis.mckinney@example.com",
    phone: "+1 325-433-7895",
    avatarUrl:
        "assets/images/Ellipse 311.png", // Ensure this exists or use placeholder
  ).obs;

  void logout() {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to log out?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        // Mock logout
        Get.back(); // Close dialog
        Get.offAllNamed(Routes.AUTH); // Navigate to Auth
        Get.snackbar("Success", "Logged out successfully");
      },
    );
  }

  void deleteAccount() {
    Get.defaultDialog(
      title: "Delete Profile",
      middleText: "Do you want to delete your profile?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        // Mock delete
        Get.back();
        Get.offAllNamed(Routes.AUTH);
        Get.snackbar("Success", "Account deleted");
      },
    );
  }

  void updateProfile(String name, String email, String phone) {
    user.update((val) {
      val?.name = name;
      val?.email = email;
      val?.phone = phone;
    });
    Get.back();
    Get.snackbar("Success", "Profile updated successfully");
  }
}
