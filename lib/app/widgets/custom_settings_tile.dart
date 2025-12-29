import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSettingsTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color baseColor;
  final Color textColor;
  final Color backgroundColor;

  const CustomSettingsTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.baseColor = const Color(0xFF1994D8),
    this.textColor = Colors.black,
    this.backgroundColor = const Color(0xFFE8F4FB),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: const Color(0xFF1994D8)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              Icon(icon, color: baseColor, size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: baseColor),
            ],
          ),
        ),
      ),
    );
  }
}
