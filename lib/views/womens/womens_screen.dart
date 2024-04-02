import 'package:eshop/views/womens/list_of_product.dart';
import 'package:flutter/material.dart';
import 'package:eshop/widget/add_product_form.dart';

class WomensScreen extends StatelessWidget {
  const WomensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Women\'s Collection',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const WomensProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
