import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../routes/app_pages.dart';

class SubscriptionPlansView extends StatelessWidget {
  const SubscriptionPlansView({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Subscription Plans",
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
              _buildPlanCard(
                title: "Basic Plan",
                price: "£23.99/m",
                features: [
                  "Sell Products - list and manage your products seamlessly.",
                  "Track Orders - Get instant notifications for each new order.",
                  "Access Updates - Utilize all system features.",
                  "Includes advanced analytics.",
                ],
                isPremium: false,
                onTap: () => Get.toNamed(Routes.PAYMENT_OPTION),
              ),
              const SizedBox(height: 20),
              _buildPlanCard(
                title: "Premium Plan",
                price: "£24.99/m",
                features: [
                  "Sell Products - list and manage your products and teams.",
                  "Track Orders - Get instant notifications for each new order.",
                  "Access Features - Utilize all modern features for enhanced sales.",
                  "Priority Support included.",
                ],
                isPremium: true,
                onTap: () => Get.toNamed(Routes.PAYMENT_OPTION),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required List<String> features,
    required bool isPremium,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isPremium
            ? const Color(0xFF007AFF)
            : Colors.white, // Blue for premium
        borderRadius: BorderRadius.circular(20),
        border: isPremium ? null : Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isPremium
                  ? Colors.white.withValues(alpha: 0.2)
                  : const Color(0xFF007AFF).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            // Mock icon - could receive as param
            child: Icon(
              isPremium ? Icons.workspace_premium : Icons.security,
              color: isPremium ? Colors.white : const Color(0xFF007AFF),
              size: 30,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.outfit(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isPremium ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: GoogleFonts.outfit(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isPremium ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check,
                    size: 18,
                    color: isPremium ? Colors.white : Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feature,
                      style: GoogleFonts.outfit(
                        fontSize: 12, // Small text as per visual
                        color: isPremium
                            ? Colors.white.withValues(alpha: 0.9)
                            : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: isPremium ? Colors.white : Colors.transparent,
                foregroundColor: isPremium
                    ? const Color(0xFF007AFF)
                    : Colors.black,
                elevation: 0,
                side: isPremium
                    ? null
                    : const BorderSide(color: Colors.black12),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Select Plan",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
