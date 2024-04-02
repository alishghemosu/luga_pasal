import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eshop/service%20or%20provider/product_list_provider.dart';
import 'package:eshop/views/product%20details/product_details_screen.dart';

class MensProductList extends StatelessWidget {
  const MensProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final productListProvider = Provider.of<AddProductListProvider>(context);
    final products = productListProvider.products
        .where((product) => product.category == "Mens")
        .toList();

    return Column(
      children: products.map((product) {
        return Container(
          height: 100,
          margin: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 61, 2, 252).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            leading: Image.file(
              File(product.imageUrl),
              // height: 500,
            ),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
