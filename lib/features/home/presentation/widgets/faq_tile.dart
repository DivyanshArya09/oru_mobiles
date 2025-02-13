import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/features/home/data/models/faq_model.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';

class FAQTile extends StatefulWidget {
  final FaqModel faq;
  const FAQTile({super.key, required this.faq});

  @override
  State<FAQTile> createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: ColorPalette.lightestGrey,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorPalette.lightGrey,
        ),
        boxShadow: _isExpanded
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                )
              ]
            : [],
      ),
      child: ExpansionTile(
        shape: Border.all(color: Colors.transparent),
        collapsedShape: Border.all(color: Colors.transparent),
        trailing: AnimatedRotation(
          duration: const Duration(milliseconds: 200),
          turns: _isExpanded ? 0.125 : 0,
          child: const Icon(Icons.add, color: ColorPalette.darktext),
        ),
        title: Text(
          widget.faq.question,
          style: AppTextThemes.of(context).bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.faq.answer,
                  style: AppTextThemes.of(context).labelMedium?.copyWith(
                        color: ColorPalette.darktext,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
