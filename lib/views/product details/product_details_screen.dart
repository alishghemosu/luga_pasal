import 'dart:io';
import 'package:eshop/views/product%20details/widget/like_and_button.dart';
import 'package:eshop/views/product%20details/widget/select_color.dart';
import 'package:eshop/views/product%20details/widget/select_size.dart';
import 'package:flutter/material.dart';
import 'package:eshop/models/product_models.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    File? imageFile;
    if (widget.product.imageUrl.isNotEmpty) {
      imageFile = File(widget.product.imageUrl);
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 230, 223),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageFile != null
              ? Image.file(
                  imageFile,
                  height: 450,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Container(),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${widget.product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(widget.product.name),
                const SizedBox(height: 10),
                const Text("Select Color:"),
                const SelectColor(),
                const SizedBox(height: 10),
                const Text("Select Size:"),
                const SelectSize(),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          const LikeButton(),
        ],
      ),
    );
  }
}
