import 'package:flutter/material.dart';

class AuthButtons extends StatelessWidget {
  final VoidCallback? onSignUp;
  final VoidCallback? onSignIn;

  const AuthButtons({super.key, this.onSignUp, this.onSignIn});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // --- Sign Up Button ---
        Expanded(
          child: GestureDetector(
            onTap: onSignUp,
            child: _buildButton(
              text: "Sign up",
              textColor: Colors.black,
              gradient: const LinearGradient(
                colors: [Color(0xFFD7DDE8), Color(0xFF757F9A)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        // --- Sign In Button ---
        Expanded(
          child: GestureDetector(
            onTap: onSignIn,
            child: _buildButton(
              text: "Sign in",
              textColor: Colors.white,
              gradient: const LinearGradient(
                colors: [Color(0xFF8EC5FC), Color(0xFF3A7BD5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required Color textColor,
    required Gradient gradient,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
