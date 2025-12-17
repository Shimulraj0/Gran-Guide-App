import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../call_controller.dart';

class IncomingCallView extends GetView<CallController> {
  const IncomingCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background as per image
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image (Blurred or Darkened)
          Container(
            color: const Color(0xFF4F4F4F), // Greyish dark background
          ),

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                // Caller Info
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: const AssetImage('assets/images/caller.png'),
                  onBackgroundImageError: (_, __) {},
                  child: const Icon(Icons.person, size: 60, color: Colors.grey),
                ),
                const SizedBox(height: 24),
                Text(
                  controller.callerName.value,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Incoming call",
                  style: GoogleFonts.outfit(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                const Spacer(flex: 3),

                // Actions (Remind me, Message)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSmallAction(
                        Icons.alarm,
                        "Remind me",
                        controller.onRemindMe,
                      ),
                      _buildSmallAction(
                        Icons.message,
                        "Message",
                        controller.onMessage,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Slide to Answer Widget
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  child: SizedBox(
                    height: 70,
                    child: Stack(
                      children: [
                        // Background Track
                        Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "slide to answer",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        // Draggable Button
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return _SlideButton(
                              maxWidth: constraints.maxWidth,
                              onSlideComplete: controller.onAccept,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),

          // Back button for safety in prototype
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallAction(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.outfit(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _SlideButton extends StatefulWidget {
  final double maxWidth;
  final VoidCallback onSlideComplete;

  const _SlideButton({required this.maxWidth, required this.onSlideComplete});

  @override
  State<_SlideButton> createState() => _SlideButtonState();
}

class _SlideButtonState extends State<_SlideButton> {
  double _dragValue = 0;
  bool _dragCompleted = false;
  final double _buttonSize = 62;
  final double _padding = 4;

  @override
  Widget build(BuildContext context) {
    double maxDrag = widget.maxWidth - _buttonSize - (_padding * 2);

    return Stack(
      children: [
        Positioned(
          left: _padding + _dragValue,
          top: _padding,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (!_dragCompleted) {
                setState(() {
                  _dragValue = (_dragValue + details.delta.dx).clamp(
                    0.0,
                    maxDrag,
                  );
                });
              }
            },
            onHorizontalDragEnd: (details) {
              if (_dragValue > maxDrag * 0.8) {
                // Completed
                setState(() {
                  _dragValue = maxDrag;
                  _dragCompleted = true;
                });
                widget.onSlideComplete();
              } else {
                // Reset
                setState(() {
                  _dragValue = 0;
                });
              }
            },
            child: Container(
              height: _buttonSize,
              width: _buttonSize,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.call, color: Colors.green, size: 30),
            ),
          ),
        ),
      ],
    );
  }
}
