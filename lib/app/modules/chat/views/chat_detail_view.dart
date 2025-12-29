import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../chat_controller.dart';
import '../../../routes/app_pages.dart';
import 'dart:io';

class ChatDetailView extends GetView<ChatController> {
  const ChatDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get arguments passed from list
    final Map<String, dynamic> chatData =
        Get.arguments ??
        {
          "name": "John Abraham",
          "image": "assets/images/user1.png",
          "handle": "@johnabraham",
        };

    return Scaffold(
      backgroundColor: const Color(0xFF2196F3), // Match header blue
      body: Column(
        children: [
          // Custom Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => Get.back(),
                    ),
                    const SizedBox(width: 48), // Spacer
                  ],
                ),
                const SizedBox(height: 5),
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/Rectangle.png'),
                  backgroundColor: Colors.white24,
                  child: (chatData['image'] == null)
                      ? const Icon(Icons.person, size: 50, color: Colors.white)
                      : null,
                ),
                const SizedBox(height: 15),
                Text(
                  chatData["name"],
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  chatData['handle'] ?? "@jhonabraham",
                  style: GoogleFonts.outfit(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHeaderAction(
                      Icons.messenger_rounded,
                      isPrimary: true,
                      onTap: () {},
                    ),
                    const SizedBox(width: 20),
                    _buildHeaderAction(
                      Icons.call,
                      isPrimary: false,
                      onTap: () => Get.toNamed(Routes.INCOMING_CALL),
                    ),
                    const SizedBox(width: 20),
                    _buildHeaderAction(
                      Icons.share,
                      isPrimary: false,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  // Handle Bar
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          final msg = controller.messages[index];
                          return _buildMessageRow(
                            isMe: msg['isMe'] ?? false,
                            name: msg['isMe']
                                ? "Me"
                                : (chatData['name'] ?? "User"),
                            message: msg['message'] ?? "",
                            time: msg['time'] ?? "",
                            avatar: msg['isMe'] ? null : chatData['image'],
                            imagePath: msg['imagePath'],
                            hideHeader:
                                index > 0 &&
                                controller.messages[index - 1]['isMe'] ==
                                    msg['isMe'],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Input Area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF03A9F4).withValues(alpha: 0.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.messageController,
                            onSubmitted: (_) => controller.sendMessage(),
                            decoration: InputDecoration(
                              hintText: "Type something...",
                              hintStyle: GoogleFonts.outfit(
                                color: Colors.grey[400],
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
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
                                    ListTile(
                                      leading: const Icon(
                                        Icons.camera_alt_outlined,
                                        color: Color(0xFF2196F3),
                                      ),
                                      title: Text(
                                        'Take Photo',
                                        style: GoogleFonts.outfit(),
                                      ),
                                      onTap: () {
                                        Get.back();
                                        controller.pickImage(
                                          ImageSource.camera,
                                        );
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(
                                        Icons.image_outlined,
                                        color: Color(0xFF2196F3),
                                      ),
                                      title: Text(
                                        'Choose from Gallery',
                                        style: GoogleFonts.outfit(),
                                      ),
                                      onTap: () {
                                        Get.back();
                                        controller.pickImage(
                                          ImageSource.gallery,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.image_outlined,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF2196F3).withValues(alpha: 0.3),
                    ),
                  ),
                  child: InkWell(
                    onTap: controller.sendMessage,
                    borderRadius: BorderRadius.circular(12),
                    child: const Icon(
                      Icons.send_outlined,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderAction(
    IconData icon, {
    required bool isPrimary,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: isPrimary
              ? Colors.white
              : const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.3),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isPrimary ? const Color(0xFF2196F3) : Colors.white,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildMessageRow({
    required bool isMe,
    required String name,
    required String message,
    required String time,
    String? avatar,
    String? imagePath,
    bool hideHeader = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!isMe && !hideHeader)
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(avatar ?? 'assets/images/user1.png'),
            ),
          if (!isMe && hideHeader) const SizedBox(width: 36),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!hideHeader)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      name,
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                if (imagePath != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    constraints: const BoxConstraints(maxWidth: 250),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.file(File(imagePath), fit: BoxFit.cover),
                  ),
                if (message.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isMe ? const Color(0xFF2196F3) : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(12),
                        topRight: const Radius.circular(12),
                        bottomLeft: Radius.circular(isMe ? 12 : 0),
                        bottomRight: Radius.circular(isMe ? 0 : 12),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      message,
                      style: GoogleFonts.outfit(
                        color: isMe ? Colors.white : Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: GoogleFonts.outfit(
                    fontSize: 10,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          if (isMe) const SizedBox(width: 8),
        ],
      ),
    );
  }
}
