import 'dart:io';

import 'package:eshop/service%20or%20provider/product_list_provider.dart';
import 'package:eshop/views/product%20details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductList extends StatelessWidget {
  const AddProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductListProvider>(
      builder: (context, productListProvider, _) {
        final products = productListProvider.products;
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              // elevation: 5,
              margin: const EdgeInsets.all(10),
              color: Colors.red,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailScreen(product: product),
                    ),
                  );
                },
                child: SizedBox(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: Image.file(
                            File(product.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Price: \$${product.price.toStringAsFixed(2)}',
                            ),
                            Text(product.category),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
