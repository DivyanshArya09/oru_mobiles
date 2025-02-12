import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';

class HorizontalChipList extends StatelessWidget {
  const HorizontalChipList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'Sell Used Phones',
      'Buy Used Phones',
      'Buy Used Phones',
      'My Profile',
      'My Listings',
      'Get the App'
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _buildChip(labels[index], context),
          );
        },
      ),
    );
  }

  Widget _buildChip(String label, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorPalette.borderColorLight,
        ),
      ),
      child: Text(
        label,
        style: AppTextThemes.of(context).labelMedium,
      ),
    );
  }
}
