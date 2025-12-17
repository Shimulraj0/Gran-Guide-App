import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth_controller.dart';

import '../../../widgets/custom_text_field.dart';
import '../../../widgets/custom_button.dart';
import '../../../colors/app_colors.dart';

class SignInWidget extends GetView<AuthController> {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Welcome Back",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 10),
        Center(child: Image.asset('assets/images/image 9.png', height: 180)),
        const SizedBox(height: 10),

        // Email
        CustomTextField(
          controller: controller.emailController,
          label: "Email",
          hintText: "Enter your email",
          keyboardType: TextInputType.emailAddress,
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
                size: 23,
              ),
              onPressed: controller.togglePasswordVisibility,
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Remember Me & Forgot Password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Obx(
                    () => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (val) =>
                          controller.rememberMe.value = val ?? false,
                      activeColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      side: const BorderSide(color: AppColors.textSecondary),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Remember Me",
                  style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
                ),
              ],
            ),
            TextButton(
              onPressed: controller.toForgotPassword,
              child: const Text(
                "Forgot password?",
                style: TextStyle(color: AppColors.textMuted, fontSize: 12),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Sign In Button
        Obx(
          () => CustomButton(
            text: "Sign in",
            onPressed: controller.submit,
            isLoading: controller.isLoading.value,
            useGradient: true,
          ),
        ),

        const SizedBox(height: 20),

        // Biometric & Social - Blue Section Container
        Builder(
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderLight.withValues(alpha: 0.5),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: controller.authenticateWithBiometrics,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                    child: const Icon(
                      Icons.fingerprint,
                      size: 40,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Or",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Google
                  _buildSocialButton(
                    label: "Sign in with Google",
                    iconWidget: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.transparent, // Or white
                      ),
                      child: const Image(
                        image: AssetImage('assets/images/google.png'),
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Apple
                  _buildSocialButton(
                    label: "Sign in with Apple",
                    iconData: Icons.apple,
                    iconColor: AppColors.appleBlack,
                  ),
                  const SizedBox(height: 12),
                  // Facebook
                  _buildSocialButton(
                    label: "Sign in with Facebook", // Exact text as requested
                    iconData: Icons.facebook,
                    iconColor: AppColors.facebookBlue,
                  ),
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 20),

        // Don't have an account
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account? ",
              style: TextStyle(color: AppColors.textSecondary),
            ),
            GestureDetector(
              onTap: controller.toggleAuthMode,
              child: const Text(
                "Sign up",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSocialButton({
    required String label,
    String? iconPath,
    IconData? iconData,
    Color? iconColor,
    Widget? iconWidget,
  }) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () {},
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              if (iconWidget != null)
                iconWidget
              else if (iconPath != null)
                Image.asset(iconPath, width: 20)
              else if (iconData != null)
                Icon(iconData, color: iconColor, size: 24),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
