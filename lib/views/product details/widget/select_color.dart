import 'package:flutter/material.dart';

class SelectColor extends StatefulWidget {
  const SelectColor({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectColor createState() => _SelectColor();
}

class _SelectColor extends State<SelectColor> {
  List<Color> colors = [
    Colors.black,
    Colors.white,
    Colors.grey,
    Colors.blue,
    Colors.red,
    Colors.pink,
  ];
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}
