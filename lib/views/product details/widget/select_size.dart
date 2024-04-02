import 'package:flutter/material.dart';

class SelectSize extends StatefulWidget {
  const SelectSize({super.key});

  @override
  State<SelectSize> createState() => _SelectSizeState();
}

class _SelectSizeState extends State<SelectSize> {
  List<String> sizes = ["S", "M", "L", "XL"];
  String selectedSize = "S";

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
              color: selectedSize == size ? Colors.black : Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              size,
              style: TextStyle(
                color: selectedSize == size ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
