import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oru_mobiles/features/home/data/models/product_model.dart';
import 'package:oru_mobiles/features/home/presentation/blocs/filter_bloc/filter_bloc.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/product_card.dart';
import 'package:oru_mobiles/ui/shimmer_container.dart';

class ProductGrid extends StatelessWidget {
  final FilterBloc filterBloc;

  const ProductGrid({super.key, required this.filterBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      buildWhen: (previous, current) => filterBloc.isProductsState,
      bloc: filterBloc,
      builder: (context, state) {
        if (state is ProductsLoaded) {
          return _buildProductGrid(state.products);
        }
        if (state is ProductsError) {
          return _buildProductGrid([]);
        }
        return const ShimmerGrid();
      },
    );
  }

  Widget _buildProductGrid(List<ProductModel> products) {
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
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCard(
        product: products[index],
        onFavouriteTap: (v) {},
      ),
    );
  }
}
