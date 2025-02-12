import 'package:flutter/material.dart';

class VerificationTextWidget extends StatelessWidget {
  final String phoneNumber;

  const VerificationTextWidget({Key? key, required this.phoneNumber})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Poppins',
          color: Colors.black,
        ),
        children: [
          const TextSpan(
              text: "Please enter the 4 digit verification code sent\n"),
          const TextSpan(text: "to your mobile number "),
          TextSpan(
            text: "+91-$phoneNumber",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(text: " via "),
          const TextSpan(
            text: "SMS",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
