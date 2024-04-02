import 'dart:io';
import 'package:eshop/service%20or%20provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:eshop/models/product_models.dart';
import 'package:eshop/service%20or%20provider/liked_state_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<Color> colors = [
    Colors.black,
    Colors.white,
    Colors.grey,
    Colors.blue,
    Colors.red,
    Colors.pink,
  ];
  List<String> sizes = ["S", "M", "L", "XL"];
  String selectedSize = "S";
  Color? selectedColor;

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
                Wrap(
                  spacing: 8.0,
                  children: colors
                      .map(
                        (color) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedColor == color
                                    ? Colors.green
                                    : Colors.transparent,
                                width: 5,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 10),
                const Text("Select Size:"),
                Wrap(
                  spacing: 8.0,
                  children: sizes.map((size) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: selectedSize == size
                              ? Colors.black
                              : Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          size,
                          style: TextStyle(
                            color: selectedSize == size
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Expanded(
                  child: MaterialButton(
                    color: Colors.black,
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false)
                          .addToCart(widget.product);
                      Navigator.of(context).pushNamed('/cart');
                    },
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
