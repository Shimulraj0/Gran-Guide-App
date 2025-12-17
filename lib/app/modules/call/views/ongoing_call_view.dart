import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../call_controller.dart';

class OngoingCallView extends GetView<CallController> {
  const OngoingCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF202020,
      ), // Dark background for active call
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Caller Info
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: const AssetImage(
                      'assets/images/caller.png',
                    ),
                    onBackgroundImageError: (_, __) {},
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    controller.callerName.value,
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Text(
                      controller.durationString,
                      style: GoogleFonts.outfit(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Call Controls
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              decoration: const BoxDecoration(
                color: Color(0xFF2F2F2F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildControlBtn(
                        Icons.mic_off,
                        "Mute",
                        controller.toggleMute,
                        controller.isMuted,
                      ),
                      _buildControlBtn(
                        Icons.dialpad,
                        "Keypad",
                        () {},
                        false.obs,
                      ),
                      _buildControlBtn(
                        Icons.volume_up,
                        "Speaker",
                        controller.toggleSpeaker,
                        controller.isSpeakerOn,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: controller.onEndCall,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.call_end,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "End Call",
                    style: GoogleFonts.outfit(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlBtn(
    IconData icon,
    String label,
    VoidCallback onTap,
    RxBool isActive,
  ) {
    return Obx(
      () => Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: isActive.value
                    ? Colors.white
                    : Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isActive.value ? Colors.black : Colors.white,
                size: 28,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.outfit(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
