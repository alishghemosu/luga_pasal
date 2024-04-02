import 'package:flutter/material.dart';

class PromotionState extends StatefulWidget {
  const PromotionState({super.key});

  @override
  State<PromotionState> createState() => _PromotionStateState();
}

class _PromotionStateState extends State<PromotionState> {
  List<Map<String, String>> images = [
    {'name': 'Clothes', 'path': 'assets/images/clothes.jpeg'},
    {'name': 'Dresses', 'path': 'assets/images/dress.jpeg'},
    {'name': 'Jeans', 'path': 'assets/images/j1.jpeg'},
    {'name': 'Pets', 'path': 'assets/images/p1.jpeg'},
    {'name': 'Kids', 'path': 'assets/images/KidsFront.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Image.asset(
                images[index]['path']!,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    images[index]['name']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
