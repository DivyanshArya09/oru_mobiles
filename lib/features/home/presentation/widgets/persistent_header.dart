import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/horizontal_chip_list.dart';
import 'package:oru_mobiles/ui/custom_text_field.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class PersistentHeader<T extends Object> extends StatefulWidget {
  final TextEditingController searchController;
  const PersistentHeader({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  @override
  State<PersistentHeader<T>> createState() => _PersistentCategoryState<T>();
}

class _PersistentCategoryState<T extends Object>
    extends State<PersistentHeader<T>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      pinned: true,
      toolbarHeight: MediaQuery.of(context).size.height * 0.14,
      backgroundColor: Colors.transparent, // Transparent for glass effect
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                CustomTextField(
                  hintTextColor: ColorPalette.darkGrey,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  raduis: 12,
                  borderColor: ColorPalette.borderColorLight,
                  controller: widget.searchController,
                  hintText: 'Search phones with make, model...',
                  prefix: const Icon(
                    color: ColorPalette.action,
                    Icons.search,
                  ),
                  suffix: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "|",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.darkGrey,
                        ),
                      ),
                      Icon(
                        Icons.mic_none_outlined,
                        color: ColorPalette.darkGrey,
                      ),
                    ],
                  ),
                ),
                CustomSpacers.height10,
                const HorizontalChipList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/**    */