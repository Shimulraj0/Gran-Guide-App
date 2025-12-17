import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/custom_bottom_nav_bar.dart';
import '../chat_controller.dart';

class ChatListView extends GetView<ChatController> {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Chats',
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {}, // Search functionality to be implemented
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(
        () => ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: controller.chats.length,
          separatorBuilder: (context, index) =>
              const Divider(height: 1, color: Color(0xFFEEEEEE), indent: 80),
          itemBuilder: (context, index) {
            final chat = controller.chats[index];
            return InkWell(
              onTap: () => controller.onChatTap(chat),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(chat['image']),
                          backgroundColor: Colors.grey[200],
                          // Fallback if image not found
                          onBackgroundImageError: (_, __) {},
                          child: chat['image'] == null || chat['image'].isEmpty
                              ? const Icon(Icons.person, color: Colors.grey)
                              : null,
                        ),
                        if (chat['isOnline'] == true)
                          Positioned(
                            right: 0,
                            bottom: 2,
                            child: Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                chat['name'],
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                chat['date'],
                                style: GoogleFonts.outfit(
                                  color: Colors.grey[400],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              if (chat['type'] == 'photo')
                                const Padding(
                                  padding: EdgeInsets.only(right: 4.0),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              Expanded(
                                child: Text(
                                  chat['message'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.outfit(
                                    color: chat['unread'] > 0
                                        ? Colors.black
                                        : Colors.grey[600],
                                    fontSize: 14,
                                    fontWeight: chat['unread'] > 0
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                ),
                              ),
                              if (chat['unread'] > 0)
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2F80ED),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${chat['unread']}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 3,
      ), // Assuming accessible from Support or separate?
      // Wait, the Chat screen seems to be a main section or accessible from somewhere.
      // The image shows "Support" "Chat" "User profile".
      // Usually Chat is a separate tab or accessible.
      // I will leave the bottom nav for now.
    );
  }
}
