import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../chat_controller.dart';

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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Header
          Container(
            padding: const EdgeInsets.only(
              top: 40,
              left: 16,
              right: 16,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF0091FF), // Blue background
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
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
                    Row(
                      children: [
                        const Icon(Icons.more_horiz, color: Colors.white),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(chatData['image'] ?? ""),
                  backgroundColor: Colors.white24,
                  child: (chatData['image'] == null)
                      ? const Icon(Icons.person, size: 40, color: Colors.white)
                      : null,
                ),
                const SizedBox(height: 10),
                Text(
                  chatData['name'] ?? "John Abraham",
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  chatData['handle'] ?? "@johnabraham",
                  style: GoogleFonts.outfit(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton(Icons.chat_bubble_outline, () {}),
                    const SizedBox(width: 20),
                    _buildActionButton(Icons.call_outlined, () {
                      // Trigger incoming call demo or actual call
                      Get.toNamed('/incoming_call');
                    }),
                    const SizedBox(width: 20),
                    _buildActionButton(Icons.videocam_outlined, () {}),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildMessageRow(
                  isMe: false,
                  message: "Hello ! Nazrul How are you?",
                  time: "09:25 AM",
                  avatar: chatData['image'],
                ),
                const SizedBox(height: 20),
                _buildMessageRow(
                  isMe: true,
                  message: "You did your job well !",
                  time: "09:25 AM",
                  avatar: null, // Me
                ),
                const SizedBox(height: 20),
                _buildMessageRow(
                  isMe: false,
                  message: "Have a great working week!!",
                  time: "09:25 AM",
                  avatar: chatData['image'],
                ),
                const SizedBox(height: 20),
                _buildMessageRow(
                  isMe: false,
                  message: "Hope you like it",
                  time: "09:25 AM",
                  avatar: chatData['image'],
                ),
              ],
            ),
          ),

          // Input Area
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: const Color(0xFFEEEEEE)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Type something...",
                              hintStyle: GoogleFonts.outfit(
                                color: Colors.grey[400],
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.image_outlined, color: Colors.blue[400]),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFEEEEEE)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(Icons.send_rounded, color: Colors.blue[400]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _buildMessageRow({
    required bool isMe,
    required String message,
    required String time,
    String? avatar,
  }) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMe) ...[
          CircleAvatar(
            radius: 16,
            backgroundImage: avatar != null ? AssetImage(avatar) : null,
            child: avatar == null ? const Icon(Icons.person, size: 16) : null,
          ),
          const SizedBox(width: 10),
        ],
        Column(
          crossAxisAlignment: isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              constraints: const BoxConstraints(maxWidth: 250),
              decoration: BoxDecoration(
                color: isMe ? const Color(0xFF2F80ED) : const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomRight: isMe ? Radius.zero : const Radius.circular(16),
                  bottomLeft: !isMe ? Radius.zero : const Radius.circular(16),
                ),
              ),
              child: Text(
                message,
                style: GoogleFonts.outfit(
                  color: isMe ? Colors.white : Colors.black87,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: GoogleFonts.outfit(color: Colors.grey[400], fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }
}
