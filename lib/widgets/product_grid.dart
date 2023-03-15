import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop/widgets/product_item.dart';

import '../model/product.dart';
import '../model/product_list.dart';

class ProductWidget extends StatelessWidget {
  final bool showFavoriteOnly;
  const ProductWidget({
    Key? key,
    required this.showFavoriteOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadProducts = 
    showFavoriteOnly ? provider.favoriteItems : provider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: loadProducts[index],
          child: ProductItem(),
        );
      },
    );
  }
}
