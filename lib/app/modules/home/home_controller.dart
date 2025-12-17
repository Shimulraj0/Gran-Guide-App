import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxBool isProtectionOn = true.obs;

  // Selection state for activity feed
  final RxnInt selectedActivityIndex = RxnInt();

  void selectActivity(int index) {
    if (selectedActivityIndex.value == index) {
      selectedActivityIndex.value = null; // Deselect if already selected
    } else {
      selectedActivityIndex.value = index;
    }
  }

  // Dump data for activity feed
  final List<Map<String, dynamic>> activityFeed = [
    {
      "title": "Blocked Scam Call",
      "from": "Unknown Number",
      "risk": 92,
      "time": "10:45 AM Today",
      "color": Colors.red,
      "action": "View Details",
    },
    {
      "title": "Suspicious Email",
      "from": "fakebank@mail.com",
      "subject": "\"Account Locked\"",
      "risk": 72,
      "color": Colors.amber,
      "action": "View Details",
    },
    {
      "title": "Safe Message",
      "from": "Daughter",
      "message": "\"See you at 5\"",
      "risk": 12,
      "color": Colors.green,
      "action": "View Details",
    },
  ];

  void toggleProtection(bool value) {
    isProtectionOn.value = value;
  }

  void navigateToScamTipDetails() {
    Get.toNamed('/scam_tip/details');
  }
}
