import 'package:eshop/models/product_models.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }
}
