import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _controller = TextEditingController();

  // Function to verify code
  void _verifyCode() {
    String code = _controller.text;
    if (code.isNotEmpty) {
      // Call API to verify code
      // If successful, navigate to next screen (Forgot Password)
      // print('Verifying code: $code');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please enter a code')));
    }
  }

  // Function to resend code
  void _resendCode() {
    // API call to resend verification code
    // print('Resending code...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify Code')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Check your email'),
            SizedBox(height: 20),
            Text(
              'We have sent you an authentication code on your email to verify your account.',
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Enter verification code'),
              keyboardType: TextInputType.number,
              maxLength: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _verifyCode, child: Text('Verify Code')),
            TextButton(
              onPressed: _resendCode,
              child: Text('Didn\'t get a code? Resend Code'),
            ),
          ],
        ),
      ),
    );
  }
}
