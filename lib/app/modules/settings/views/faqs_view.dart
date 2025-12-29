import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqsView extends StatelessWidget {
  const FaqsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'FAQs',
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: const [
          _FaqTile(
            title: 'How do I register for the app?',
            content:
                'Users can register by signing up with their email, phone number, or social media accounts. Profile verification is available through email, phone, or document.',
            isExpanded: true,
          ),
          SizedBox(height: 16),
          _FaqTile(
            title: 'What is the purpose of this dating app?',
            content: 'The purpose is to connect people...',
          ),
          SizedBox(height: 16),
          _FaqTile(
            title: 'Is the app free to use?',
            content: 'Yes, basic features are free...',
          ),
          SizedBox(height: 16),
          _FaqTile(
            title: 'How is user privacy & security ensured?',
            content: 'We use encryption and rigid policies...',
          ),
          SizedBox(height: 16),
          _FaqTile(
            title: 'Can I edit or delete my profile?',
            content:
                'Yes, you can edit or delete your profile from settings...',
          ),
        ],
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  final String title;
  final String content;
  final bool isExpanded;

  const _FaqTile({
    required this.title,
    required this.content,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF007AFF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isExpanded,
          iconColor: const Color(0xFF007AFF),
          collapsedIconColor: const Color(0xFF007AFF),
          title: Text(
            title,
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                content,
                style: GoogleFonts.outfit(fontSize: 12, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
