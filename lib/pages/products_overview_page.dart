import 'package:flutter/material.dart';
import 'package:shop/data/dummy_products.dart';
import 'package:shop/widgets/product_item.dart';

import '../model/product.dart';

class ProductsOverviewPage extends StatelessWidget {
  final List<Product> loadProducts = dummyProducts;
  ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minha Loja',
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ProductItem(product: loadProducts[index]);
        },
      ),
    );
  }
}
