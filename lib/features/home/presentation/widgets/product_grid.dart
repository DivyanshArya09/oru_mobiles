import 'package:flutter/material.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  final int itemCount;

  const ProductGrid({super.key, this.itemCount = 10});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 160 / 292,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) => ProductCard(
        onFavouriteTap: (v) {},
      ),
    );
  }
}
