import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/model/product_list.dart';

import '../widgets/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

//Converte para stateful
class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minha Loja',
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.Favorite,
                child: Text(
                  "Somente Favoritos",
                ),
              ),
              const PopupMenuItem(
                value: FilterOptions.All,
                child: Text(
                  "Todos",
                ),
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          )
        ],
        centerTitle: true,
      ),
      body: ProductWidget( showFavoriteOnly: _showFavoriteOnly),
    );
  }
}
