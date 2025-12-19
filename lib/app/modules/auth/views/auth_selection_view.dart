import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../controllers/theme_controller.dart';

class AuthSelectionView extends GetView<AuthController> {
  const AuthSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).scaffoldBackgroundColor, // Adaptive background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              // Top Bar: Back Button and Theme Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  _buildIconButton(
                    icon: 'assets/images/arrow.png', // Reusing arrow asset
                    onPressed: () => Get.back(),
                    isBack: true,
                  ),
                  // Theme Toggle (Moon/Sun)
                  _buildThemeToggle(),
                ],
              ),
              const SizedBox(height: 20),
              // Title
              Text(
                'Create your own\ngran guide plan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                  height: 1.2,
                ),
              ),
              const Spacer(flex: 2),
              // Illustration
              Image.asset(
                'assets/images/image8.png', // Assuming this asset exists or will be provided
                height: 250,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image.asset('assets/images/image8.png'),
                    ),
                  );
                },
              ),
              const Spacer(flex: 2),
              // Subtitle
              Text(
                'Stay Secure. Feel Supported.\nAlways Guided."',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(flex: 3),
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: _buildGradientButton(
                      text: 'Sign up',
                      onPressed: () {
                        controller.isSignUp.value = true;
                        Get.toNamed(Routes.AUTH); // Route to AuthView (Sign Up)
                      },
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFBCC6CC),
                          Color(0xFF708090),
                        ], // Silver/Grey gradient
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      textColor: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildGradientButton(
                      text: 'Sign in',
                      onPressed: () {
                        controller.isSignUp.value = false;
                        Get.toNamed(Routes.AUTH); // Route to AuthView (Sign In)
                      },
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF90CAE9),
                          Color(0xFF389ED0),
                        ], // Blue gradient
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required String icon,
    required VoidCallback onPressed,
    bool isBack = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withAlpha(100), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: isBack
            ? Transform.rotate(
                angle: 0, // Arrow is already pointing left in assets
                child: Image.asset(icon, width: 20, height: 20),
              )
            : Image.asset(icon, width: 20, height: 20),
        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildThemeToggle() {
    final themeController = Get.find<ThemeController>();
    return GestureDetector(
      onTap: themeController.toggleTheme,
      child: Obx(() {
        final isDark = themeController.isDarkMode.value;
        return Container(
          width: 60,
          height: 30,
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[800] : const Color(0xFFB3E5FC),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: isDark ? 34 : 4,
                top: 4,
                bottom: 4,
                child: Container(
                  width: 22,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[600] : const Color(0xFF03A9F4),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isDark ? Icons.nights_stay : Icons.wb_sunny,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildGradientButton({
    required String text,
    required VoidCallback onPressed,
    required Gradient gradient,
    required Color textColor,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(30),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
