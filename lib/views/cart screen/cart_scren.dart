import 'dart:io';

import 'package:eshop/service%20or%20provider/cart_provider.dart';
import 'package:eshop/service%20or%20provider/liked_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final cartItem = cart.items[index];
          return Container(
            height: 150,
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 179, 179),
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
              leading: SizedBox(
                width: 70,
                height: 100,
                child: Image.file(
                  File(cartItem.product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                cartItem.product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$${cartItem.product.price.toStringAsFixed(2)}'),
                  Text(cartItem.product.category),
                  Consumer<LikeState>(
                    builder: (context, likeState, _) => IconButton(
                      icon: Icon(
                        likeState.isLiked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: likeState.isLiked ? Colors.red : null,
                      ),
                      onPressed: () {
                        likeState.updateLike();
                      },
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.remove_shopping_cart),
                onPressed: () {
                  Provider.of<Cart>(context, listen: false)
                      .removeFromCart(cartItem.product);
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Provider.of<Cart>(context, listen: false).clearCart();
          },
          child: const Text('Clear Cart'),
        ),
      ),
    );
  }
}
