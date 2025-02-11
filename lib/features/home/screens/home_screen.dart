import 'package:flutter/material.dart';
import 'package:oru_mobiles/ui/custom_text_field.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomSpacers.height120,
            Center(
              child: CustomTextField(
                controller: TextEditingController(),
                title: 'Hello world',
                hintText: 'Hello world',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
