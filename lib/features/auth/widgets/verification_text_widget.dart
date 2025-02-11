import 'package:flutter/material.dart';

class VerificationTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Poppins',
          color: Colors.black,
        ),
        children: [
          const TextSpan(
              text: "Please enter the 4 digit verification code sent\n"),
          const TextSpan(text: "to your mobile number "),
          TextSpan(
            text: "+91-7587329682",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(text: " via "),
          TextSpan(
            text: "SMS",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
