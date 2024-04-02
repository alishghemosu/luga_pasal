import 'package:flutter/material.dart';
import 'package:eshop/models/product_models.dart';

class AddProductListProvider with ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}
