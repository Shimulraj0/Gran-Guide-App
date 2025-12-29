import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../colors/app_colors.dart';
import '../routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.surface
            : AppColors.primaryLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -5), // Negative offset for top shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            index: 0,
            iconPath: 'assets/icons/home.png',
            label: 'Home',
            onTap: () => _handleNavigation(0),
          ),
          _buildNavItem(
            context,
            index: 1,
            iconPath: 'assets/icons/Vector(2).png',
            label: 'Educate',
            onTap: () => _handleNavigation(1),
          ),
          _buildNavItem(
            context,
            index: 2,
            iconPath: 'assets/icons/Group.png',
            label: 'Protection',
            onTap: () => _handleNavigation(2),
          ),
          _buildNavItem(
            context,
            index: 3,
            iconPath: 'assets/icons/customer-support 1.png',
            label: 'Support',
            onTap: () => _handleNavigation(3),
          ),
          _buildNavItem(
            context,
            index: 4,
            iconPath: 'assets/icons/frame.png',
            label: 'Profile',
            onTap: () => _handleNavigation(4),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required String iconPath,
    required String label,
    required VoidCallback onTap,
  }) {
    final isSelected = currentIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isSelected
        ? (isDark ? AppColors.primary : Colors.white)
        : (isDark ? Colors.white70 : Colors.black);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Selection Indicator (Top Bar)
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
          ),
          const Spacer(),
          Image.asset(iconPath, width: 24, height: 24, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.outfit(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _handleNavigation(int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Get.offNamed(Routes.HOME);
        break;
      case 1:
        Get.offNamed(Routes.EDUCATE);
        break;
      case 2:
        Get.offNamed(Routes.PROTECTION);
        break;
      case 3:
        Get.offNamed(Routes.SUPPORT);
        break;
      case 4:
        Get.offNamed(Routes.PROFILE);
        break;
    }
  }
}
