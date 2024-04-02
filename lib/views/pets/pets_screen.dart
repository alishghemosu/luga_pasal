import 'package:eshop/views/pets%20screen/list_of_product.dart';
import 'package:flutter/material.dart';
import 'package:eshop/widget/add_product_form.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pet\'s Collection',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const PetsProductList(),
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
