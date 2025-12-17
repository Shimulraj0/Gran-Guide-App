import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_button.dart';
import '../../../colors/app_colors.dart';

class BiometricView extends StatelessWidget {
  const BiometricView({super.key});

  @override
  Widget build(BuildContext context) {
    final type = Get.parameters['type'] ?? 'face'; // 'face' or 'fingerprint'
    final isFace = type == 'face';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          isFace ? "Add Your Face Print" : "Add Your Finger Print",
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('assets/images/arrow.png', width: 20, height: 20),
          onPressed: () => Get.back(),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              isFace
                  ? "Authenticate with face"
                  : "App locked", // Based on design text
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            if (!isFace) ...[
              const SizedBox(height: 10),
              const Text(
                "Unlock with Face Id To Open",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],

            const Spacer(),

            // Icon Placeholder
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Center the row content if strictly row
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Container(
                      height: 120,
                      width: 160,
                      decoration: const BoxDecoration(),
                      child: isFace
                          ? Center(
                              child: Image.asset(
                                'assets/images/face_id.png',
                                fit: BoxFit.contain,
                              ),
                            )
                          : Center(
                              child: SizedBox(
                                width: 350,
                                height: 120,
                                child: Image.asset(
                                  'assets/images/Vector.png',
                                  height: 70,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),
            if (isFace)
              const Text(
                "No border.. complete",
                style: TextStyle(color: AppColors.textSecondary),
              ),

            const Spacer(),

            // Button
            CustomButton(
              text: isFace ? "Confirm" : "Use User ID",
              onPressed: () {
                // Mock completion
                Get.back();
                Get.snackbar("Success", "$type added successfully");
              },
              useGradient: true,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
