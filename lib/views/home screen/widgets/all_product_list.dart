import 'dart:io';

import 'package:eshop/service%20or%20provider/liked_state_provider.dart';
import 'package:eshop/service%20or%20provider/product_list_provider.dart';
import 'package:eshop/views/cart%20screen/cart_scren.dart';
import 'package:eshop/views/product%20details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductList extends StatelessWidget {
  const AllProductList({super.key});

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
            return Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 120,
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: Image.file(
                            File(product.imageUrl),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   'Price: \$${product.price.toStringAsFixed(2)}',
                          // ),
                          // Text(product.category),
                          Row(
                            children: [
                              Consumer<LikeState>(
                                builder: (context, likeState, _) => IconButton(
                                  icon: Icon(
                                    likeState.isLiked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        likeState.isLiked ? Colors.red : null,
                                  ),
                                  onPressed: () {
                                    likeState.updateLike();
                                  },
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.shopping_cart),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CartScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
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
