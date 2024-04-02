import 'package:eshop/views/others%20categories/list_of_product.dart';
import 'package:flutter/material.dart';
import 'package:eshop/widget/add_product_form.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

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
      body: const OtherProductList(),
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
