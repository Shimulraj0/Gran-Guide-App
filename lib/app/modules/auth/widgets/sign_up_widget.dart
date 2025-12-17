import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../auth_controller.dart';

import '../../../widgets/custom_text_field.dart';
import '../../../widgets/custom_button.dart';
import '../../../colors/app_colors.dart';

class SignUpWidget extends GetView<AuthController> {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const Text(
          "Hello! Let's join with us",
          style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 20),

        // Full Name
        CustomTextField(
          controller: controller.nameController,
          label: "Full Name",
          hintText: "Enter your full name",
        ),
        const SizedBox(height: 16),

        // Email
        CustomTextField(
          controller: controller.emailController,
          label: "Email",
          hintText: "Enter your email",
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),

        // Phone Number
        CustomTextField(
          controller: controller.phoneController,
          label: "Phone number",
          hintText: "Enter your phone number",
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        const SizedBox(height: 16),

        // Password
        Obx(
          () => CustomTextField(
            controller: controller.passwordController,
            label: "Password",
            hintText: "Enter your password",
            obscureText: !controller.isPasswordVisible.value,
            suffixIcon: IconButton(
              icon: Icon(
                controller.isPasswordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.primary,
              ),
              onPressed: controller.togglePasswordVisibility,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Confirm Password
        Obx(
          () => CustomTextField(
            controller: controller.confirmPasswordController,
            label: "Confirm Password",
            hintText: "Confirm your password",
            obscureText: !controller.isConfirmPasswordVisible.value,
            suffixIcon: IconButton(
              icon: Icon(
                controller.isConfirmPasswordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.primary,
              ),
              onPressed: controller.toggleConfirmPasswordVisibility,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Biometric Buttons
        CustomButton(
          text: "Add FACE ID",
          onPressed: () => controller.toBiometricSetup('face'),
          isOutlined: true,
          textColor: AppColors.primary,
          // height: 50, // Default matches existing somewhat
        ),
        const SizedBox(height: 10),
        CustomButton(
          text: "Add Fingerprint",
          onPressed: () => controller.toBiometricSetup('fingerprint'),
          isOutlined: true,
          textColor: AppColors.primary,
        ),

        const SizedBox(height: 20),

        // Sign Up Button
        Obx(
          () => CustomButton(
            text: "Sign Up",
            onPressed: controller.submit,
            isLoading: controller.isLoading.value,
            useGradient: true,
            textColor: Colors.white,
          ),
        ),

        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account? ",
              style: TextStyle(color: AppColors.textSecondary),
            ),
            GestureDetector(
              onTap: controller.toggleAuthMode,
              child: const Text(
                "Sign in",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
