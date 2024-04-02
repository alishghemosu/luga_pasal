import 'package:eshop/views/kids%20screen/list_of_product.dart';
import 'package:flutter/material.dart';
import 'package:eshop/widget/add_product_form.dart';

class KidsScreen extends StatelessWidget {
  const KidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kids Collection',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const KidsProductList(),
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
