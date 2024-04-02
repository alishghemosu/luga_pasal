import 'package:flutter/material.dart';
import 'package:eshop/models/product_models.dart';

class CartItem {
  final Product product;

  CartItem({required this.product});
}

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Product product) {
    _items.add(CartItem(product: product));
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.removeWhere((item) => item.product == product);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
