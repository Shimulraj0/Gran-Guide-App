import 'dart:async';
import 'package:get/get.dart';
import 'views/ongoing_call_view.dart';

class CallController extends GetxController {
  final callerName = "Annette Black".obs;

  // Call State
  final isMuted = false.obs;
  final isSpeakerOn = false.obs;
  final duration = Duration.zero.obs;
  Timer? _timer;

  // Formatted duration string
  String get durationString {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.value.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.value.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void onAccept() {
    // Navigate to ongoing call view (replacing current view in stack to prevent back)
    // Or just push it.
    Get.off(() => const OngoingCallView(), transition: Transition.fadeIn);
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration.value += const Duration(seconds: 1);
    });
  }

  void onDecline() {
    Get.back();
  }

  void onEndCall() {
    _timer?.cancel();
    Get.back(); // Goes back to where call was triggered from (Support or Chat)
  }

  void onRemindMe() {
    Get.snackbar("Reminder", "Reminder set for 1 hour.");
    Get.back();
  }

  void onMessage() {
    // Should ideally go to message input
    Get.snackbar("Message", "Quick message sent.");
    Get.back();
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
