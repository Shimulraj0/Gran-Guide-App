import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import '../../routes/app_pages.dart';

class ChatController extends GetxController {
  final chats = <Map<String, dynamic>>[
    {
      "name": "Andrew Parker",
      "message": "What kind of strategy is better?",
      "date": "11/16/19",
      "image": "assets/images/andrew.png", // Placeholder
      "isOnline": false,
      "unread": 0,
    },
    {
      "name": "Maximilian Jacobson",
      "message": "Bro, I have a good idea!",
      "date": "10/30/19",
      "image": "assets/images/max.png",
      "isOnline": false,
      "unread": 0,
    },
    {
      "name": "Martha Craig",
      "message": "Photo",
      "date": "10/28/19",
      "image": "assets/images/martha.png",
      "isOnline": false,
      "unread": 0,
    },
    {
      "name": "Tabitha Potter",
      "message":
          "Actually I wanted to check with you about your online business plan on our...",
      "date": "8/25/19",
      "image": "assets/images/tabitha.png",
      "isOnline": true,
      "unread": 2,
    },
    {
      "name": "Maisy Humphrey",
      "message": "Welcome, to make design process faster, look at Pixellz",
      "date": "8/20/19",
      "image": "assets/images/maisy.png",
      "isOnline": false,
      "unread": 0,
    },
    {
      "name": "Kieron Dotson",
      "message": "Ok, have a good trip!",
      "date": "7/29/19",
      "image": "assets/images/kieron.png",
      "isOnline": true,
      "unread": 0,
    },
  ].obs;

  final messageController = TextEditingController();
  final messages = <Map<String, dynamic>>[].obs;

  void onChatTap(Map<String, dynamic> chat) {
    // Mock initial messages for the selected chat
    messages.assignAll([
      {
        "isMe": false,
        "message": "Hello! I am ${chat['name']}",
        "time": "09:25 AM",
      },
      {"isMe": true, "message": "Hi ${chat['name']}!", "time": "09:26 AM"},
    ]);
    Get.toNamed(Routes.CONTACT_PROFILE, arguments: chat);
  }

  @override
  void onInit() {
    super.onInit();
    getLostData();
  }

  Future<void> getLostData() async {
    try {
      final LostDataResponse response = await _picker.retrieveLostData();
      if (response.isEmpty) return;

      if (response.file != null) {
        messages.add({
          "isMe": true,
          "message": "",
          "imagePath": response.file!.path,
          "time": "Just now",
        });
      } else if (response.exception != null) {
        debugPrint("Lost data error: ${response.exception}");
      }
    } catch (e) {
      debugPrint("Error retrieving lost data: $e");
    }
  }

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    messages.add({
      "isMe": true,
      "message": messageController.text.trim(),
      "time": "Just now",
    });

    messageController.clear();
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    try {
      // Aggressive Permission Handling
      if (source == ImageSource.camera) {
        var status = await Permission.camera.status;
        if (!status.isGranted) {
          status = await Permission.camera.request();
        }
        if (status.isPermanentlyDenied) {
          openAppSettings();
          return;
        }
        if (!status.isGranted) {
          Get.snackbar(
            'Permission Required',
            'Camera access is needed to take photos.',
          );
          return;
        }
      } else {
        // Gallery/Storage Permissions
        PermissionStatus status;

        // Handle Android 11+ / 13+ vs older versions
        if (Platform.isAndroid) {
          // Try to request Photo permission (Android 13+)
          status = await Permission.photos.status;
          if (!status.isGranted && !status.isLimited) {
            status = await Permission.photos.request();
          }

          // Fallback to storage if photos not supported or denied
          if (!status.isGranted && !status.isLimited) {
            status = await Permission.storage.status;
            if (!status.isGranted) {
              status = await Permission.storage.request();
            }
          }
        } else {
          // iOS
          status = await Permission.photos.request();
        }

        if (status.isPermanentlyDenied) {
          openAppSettings();
          return;
        }
        if (!status.isGranted && !status.isLimited) {
          Get.snackbar(
            'Permission Required',
            'Gallery access is needed to pick photos.',
          );
          return;
        }
      }

      debugPrint(
        "Permissions granted, opening ${source == ImageSource.camera ? 'Camera' : 'Gallery'}...",
      );

      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 70,
      );

      if (image != null) {
        messages.add({
          "isMe": true,
          "message": "",
          "imagePath": image.path,
          "time": "Just now",
        });
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
      Get.snackbar(
        'Error',
        'Failed to pick image: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
