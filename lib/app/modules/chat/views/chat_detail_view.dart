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
                  backgroundImage: AssetImage(chatData['image'] ?? ""),
                  backgroundColor: Colors.white24,
                  child: (chatData['image'] == null)
                      ? const Icon(Icons.person, size: 50, color: Colors.white)
                      : null,
                ),
                const SizedBox(height: 15),
                Text(
                  chatData['name'] ?? "Jhon Abraham",
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
                      onTap: () => Get.toNamed('/incoming_call'),
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
                    child: ListView(
                      padding: const EdgeInsets.all(20),
                      children: [
                        _buildMessageRow(
                          isMe: false,
                          name: chatData['name'] ?? "Jhon Abraham",
                          message: "Hello ! Nazrul How are you?",
                          time: "09:25 AM",
                          avatar: chatData['image'],
                        ),
                        const SizedBox(height: 15),
                        _buildMessageRow(
                          isMe: true,
                          name: "Me",
                          message: "You did your job well!",
                          time: "09:25 AM",
                          avatar: null,
                        ),
                        const SizedBox(height: 15),
                        _buildMessageRow(
                          isMe: false,
                          name: chatData['name'] ?? "Jhon Abraham",
                          message: "Have a great working week!!",
                          time: "09:25 AM",
                          avatar: chatData['image'],
                        ),
                        const SizedBox(height: 10),
                        _buildMessageRow(
                          isMe: false,
                          name: chatData['name'] ?? "Jhon Abraham",
                          message: "Hope you like it",
                          time: "09:25 AM",
                          avatar: chatData['image'],
                          hideHeader: true,
                        ),
                      ],
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
                        Icon(Icons.image_outlined, color: Colors.grey[400]),
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
                  child: const Icon(
                    Icons.send_outlined,
                    color: Color(0xFF2196F3),
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
              : const Color(0xFF0D47A1).withValues(alpha: 0.3),
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
    bool hideHeader = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMe && !hideHeader) ...[
            CircleAvatar(
              radius: 18,
              backgroundImage: avatar != null ? AssetImage(avatar) : null,
              child: avatar == null ? const Icon(Icons.person, size: 20) : null,
            ),
            const SizedBox(width: 10),
          ] else if (!isMe && hideHeader) ...[
            const SizedBox(width: 46), // Avatar width + spacing
          ],
          Column(
            crossAxisAlignment: isMe
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              if (!isMe && !hideHeader) ...[
                Text(
                  name,
                  style: GoogleFonts.outfit(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
              ],
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                constraints: const BoxConstraints(maxWidth: 240),
                decoration: BoxDecoration(
                  color: isMe
                      ? const Color(0xFF2196F3)
                      : const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: isMe
                        ? const Radius.circular(12)
                        : const Radius.circular(4),
                    bottomRight: isMe
                        ? const Radius.circular(4)
                        : const Radius.circular(12),
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
                style: GoogleFonts.outfit(
                  color: Colors.grey[500],
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
