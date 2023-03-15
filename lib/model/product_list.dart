import 'package:flutter/material.dart';
import 'package:shop/data/dummy_products.dart';
import 'package:shop/model/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  final bool _showFavoriteOnly = false;
  //usando um clone da lista ..._items
  //filtrando a lista de favoritos
  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>  _items.where((prod) => prod.isFavorite).toList();


  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}

//Mudando esse codigo que seleciona os favoritos de global para local
  // List<Product> get items {
  //   if (_showFavoriteOnly) {
  //     return _items.where((prod) => prod.isFavorite).toList();
  //   }
  //   return [..._items];
  // }

  // void showFavoriteOnly() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();

  // }

  // void showAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();

  // }