import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class AuthController extends GetxController {
  // Reactive toggle state (Sign Up vs Sign In)
  final RxBool isSignUp = true.obs;

  // Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController(); // For Sign In and Sign Up
  final confirmPasswordController = TextEditingController(); // For Sign Up
  final nameController = TextEditingController(); // For Sign Up
  final phoneController = TextEditingController(); // For Sign Up

  // Password Visibility
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;

  // Checkbox for "Remember Me"
  final RxBool rememberMe = false.obs;

  void toggleAuthMode() {
    isSignUp.value = !isSignUp.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Loading State
  final RxBool isLoading = false.obs;

  void submit() async {
    // Validate Phone Number
    if (isSignUp.value) {
      if (phoneController.text.isEmpty) {
        Get.snackbar('Error', 'Phone number is mandatory');
        return;
      }
      if (!GetUtils.isNumericOnly(phoneController.text)) {
        Get.snackbar('Error', 'Phone number must be numeric only');
        return;
      }
    }

    try {
      isLoading.value = true;
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Implement auth logic
      if (!isSignUp.value) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar('Auth', 'Proceeding with Sign Up');
      }
    } finally {
      isLoading.value = false;
    }
  }

  void authenticateWithBiometrics() {
    // Placeholder for biometric authentication logic
    Get.snackbar('Biometric Auth', 'Feature coming soon!');
  }

  void toForgotPassword() {
    Get.toNamed('/auth/forgot-password');
  }

  void toBiometricSetup(String type) {
    Get.toNamed('/auth/biometric?type=$type');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
