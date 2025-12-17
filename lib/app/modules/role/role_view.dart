import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'role_controller.dart';
import '../../../core/theme/app_theme.dart';

class RoleView extends GetView<RoleController> {
  const RoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Positioned(
            bottom: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.all(10),

              child: IconButton(
                icon: Image.asset(
                  'assets/images/arrow.png',
                  width: 20,
                  height: 20,
                ),

                onPressed: () => Get.back(),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(0, 26, 25, 25),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 0),
            // Logo small
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                Image.asset(
                  'assets/images/GranGuide1.png',
                  width: 200,
                  height: 200,
                ),
              ],
            ),
            const SizedBox(height: 100),
            const Text(
              'At GranGuide, we Educate, Support, and Protect our loved ones by guiding them through technology with patience and care. We provide easy-to-use resources, personal training, and trusted support to help older adults feel safe, confident, and connected in the digital world.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            // Role Buttons
            _buildRoleButton(context, 'User'),
            const SizedBox(height: 20),
            _buildRoleButton(context, 'Caregiver', isOutlined: true),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleButton(
    BuildContext context,
    String role, {
    bool isOutlined = false,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: isOutlined
            ? null
            : BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
        child: isOutlined
            ? OutlinedButton(
                onPressed: () => controller.selectRole(role),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Theme.of(context).primaryColor),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  role,
                  style: const TextStyle(fontSize: 18, color: Colors.black87),
                ),
              )
            : ElevatedButton(
                onPressed: () => controller.selectRole(role),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  role,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
      ),
    );
  }
}
