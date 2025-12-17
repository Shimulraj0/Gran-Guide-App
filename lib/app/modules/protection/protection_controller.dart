import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProtectionController extends GetxController {
  final RxBool isProtectionEnabled = true.obs;
  final TextEditingController linkController = TextEditingController();
  final RxString scanResult = ''.obs;

  void toggleProtection(bool value) {
    isProtectionEnabled.value = value;
  }

  void scanLink() {
    if (linkController.text.isNotEmpty) {
      // Mock scan logic
      scanResult.value = "Safe";
    }
  }

  @override
  void onClose() {
    linkController.dispose();
    super.onClose();
  }
}
