import 'package:eshop/views/mens%20screen/list_of_product.dart';
import 'package:eshop/widget/add_product_form.dart';
import 'package:flutter/material.dart';

class MensScreen extends StatelessWidget {
  const MensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Men Collection',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const MensProductList(),
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
