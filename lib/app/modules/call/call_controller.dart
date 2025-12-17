import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class CallController extends GetxController {
  final callerName = "Annette Black".obs;

  // Call State
  final isMuted = false.obs;
  final isSpeakerOn = false.obs;
  final duration = Duration.zero.obs;
  final showDialPad = false.obs;
  final dialPadValue = "".obs;
  Timer? _timer;

  void onAccept() {
    startTimer();
    // Navigate to ongoing call view using named route
    Get.offNamed(Routes.ONGOING_CALL, arguments: {'isOngoing': true});
  }

  @override
  void onReady() {
    super.onReady();
    // Fallback: start timer if we are on the ongoing call screen and it's not running
    if (Get.currentRoute == Routes.ONGOING_CALL ||
        (Get.arguments is Map && Get.arguments['isOngoing'] == true)) {
      startTimer();
    }
  }

  void startTimer() {
    if (_timer != null && _timer!.isActive) {
      debugPrint("Timer already active, not starting again.");
      return;
    }
    debugPrint("Timer starting now...");
    duration.value = Duration.zero;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration.value += const Duration(seconds: 1);
      debugPrint("Timer tick: ${duration.value.inSeconds}s");
    });
  }

  void toggleDialPad() {
    showDialPad.value = !showDialPad.value;
  }

  void onKeyPress(String key) {
    dialPadValue.value += key;
    // In a real app, this might send DTMF tones
    debugPrint("Dialed: $key");
  }

  void clearDialPad() {
    dialPadValue.value = "";
  }

  void onDecline() {
    Get.back();
  }

  void onEndCall() {
    _timer?.cancel();
    Get.back(); // Goes back to where call was triggered from
  }

  void onRemindMe() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Remind Me",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildActionItem("In 1 hour", () {
              Get.back(); // Close bottom sheet
              Get.snackbar("Reminder", "Reminder set for 1 hour.");
              Get.back(); // Close call screen
            }),
            _buildActionItem("When I leave", () {
              Get.back();
              Get.snackbar("Reminder", "Reminder set for when you leave.");
              Get.back();
            }),
            _buildActionItem("End of day", () {
              Get.back();
              Get.snackbar("Reminder", "Reminder set for end of day.");
              Get.back();
            }),
          ],
        ),
      ),
    );
  }

  void onMessage() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Quick Reply",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildActionItem(
              "Can't talk right now.",
              () => _sendMessage("Can't talk right now."),
            ),
            _buildActionItem(
              "I'll call you back.",
              () => _sendMessage("I'll call you back."),
            ),
            _buildActionItem("On my way.", () => _sendMessage("On my way.")),
            _buildActionItem("Custom message...", () {
              Get.back();
              // Navigate to a message input or similar
              Get.snackbar(
                "Message",
                "Custom message screen (To be implemented)",
              );
            }),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String message) {
    Get.back(); // Close bottom sheet
    Get.snackbar("Message Sent", "Reply: \"$message\"");
    Get.back(); // Close call screen
  }

  Widget _buildActionItem(String text, VoidCallback onTap) {
    return ListTile(
      title: Text(text, textAlign: TextAlign.center),
      onTap: onTap,
    );
  }

  void toggleMute() {
    isMuted.value = !isMuted.value;
  }

  void toggleSpeaker() {
    isSpeakerOn.value = !isSpeakerOn.value;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
