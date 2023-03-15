import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/utils/app_routes.dart';

import '../model/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    //Se só um elemento da tela sobre alteração você ´pde deixar o listen false
    //e envolver o widget que deve ser renderizado com um Consumer para fazer isso
    // no caso abaixo
    //Outra forma de acessar o produtos usando o
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(10),
    //   child: GridTile(
    //     footer: GridTileBar(
    //       backgroundColor: Colors.black54,
    //       leading: IconButton(
    //         onPressed: () {
    //           product.toggleFavorites();
    //         },
    //         icon: Icon(
    //           product.isFavorite ? Icons.favorite : Icons.favorite_border,
    //           color: Colors.deepOrange,
    //         ),
    //       ),
    //       title: Text(
    //         product.title,
    //         textAlign: TextAlign.center,
    //       ),
    //       trailing: IconButton(
    //         onPressed: () {},
    //         icon: const Icon(
    //           Icons.shopping_cart,
    //           color: Colors.deepOrange,
    //         ),
    //       ),
    //     ),
    //     child: GestureDetector(
    //       onTap: () {
    //         // Navigator.of(context).push(
    //         //   MaterialPageRoute(
    //         //     builder: (context) => ProductDetailPage(
    //         //       product: product,
    //         //     ),
    //         //   ),
    //         // );
    //         Navigator.of(context).pushNamed(
    //           AppRoutes.PRODUCT_DETAIL,
    //           arguments: product,
    //         );
    //       },
    //       child: Image.network(
    //         product.imageUrl,
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //   ),
    // );
    //Usandom o consumer
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (context, product, _)=>IconButton(
              onPressed: () {
                product.toggleFavorites();
              },
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.deepOrange,
              ),
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.deepOrange,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => ProductDetailPage(
            //       product: product,
            //     ),
            //   ),
            // );
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments: product,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
