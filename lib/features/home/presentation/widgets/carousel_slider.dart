import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/app_assets.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  late CarouselSliderController _carouselTC;
  int currIndex = 0;

  List<String> assets = [
    AppAssets.banner1,
    AppAssets.banner2,
    AppAssets.banner3,
    AppAssets.banner4,
    AppAssets.banner5,
  ];

  @override
  void initState() {
    _carouselTC = CarouselSliderController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: assets
              .map(
                (item) => _buildSliderItem(item),
              )
              .toList(),
          carouselController: _carouselTC,
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            aspectRatio: 2,
            viewportFraction: 1,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            onPageChanged: (index, reason) {
              setState(
                () {
                  currIndex = index;
                },
              );
            },
          ),
        ),
        CustomSpacers.height10,
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < assets.length; i++) ...[
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(3),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorPalette.lightGrey),
                  color: currIndex == i
                      ? ColorPalette.lightGrey
                      : Colors.transparent,
                ),
              ),
            ),
          ]
        ]),
      ],
    );
  }

  Widget _buildSliderItem(String asset) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width,
        child: Image.asset(asset),
      ),
    );
  }
}
