import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite;
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });
  void _toggleFavorites() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> toogleFavorites(String token) async {
    _toggleFavorites();
    final response = await http.patch(
      Uri.parse('${Constants.PRODUCT_BASE_URL}/$id.json?auth=$token'),
      body: jsonEncode(
        {
          'isFavorite': isFavorite,
        },
      ),
    );
    if (response.statusCode >= 400) {
      _toggleFavorites();
    }
  }
}
