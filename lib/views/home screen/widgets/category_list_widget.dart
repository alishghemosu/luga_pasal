import 'package:eshop/views/kids%20screen/kids_screen.dart';
import 'package:eshop/views/mens%20screen/mens_screen.dart';
import 'package:eshop/views/others%20categories/others_screen.dart';
import 'package:eshop/views/pets%20screen/pets_screen.dart';
import 'package:eshop/views/womens/womens_screen.dart';
import 'package:flutter/material.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryButton(
            context,
            'Men',
            Icons.man,
            const MensScreen(),
          ),
          _buildCategoryButton(
            context,
            'Women',
            Icons.woman,
            const WomensScreen(),
          ),
          _buildCategoryButton(
            context,
            'Kids',
            Icons.child_care,
            const KidsScreen(),
          ),
          _buildCategoryButton(
            context,
            'Pets',
            Icons.pets,
            const PetsScreen(),
          ),
          _buildCategoryButton(
            context,
            'Others',
            Icons.do_not_disturb_on_total_silence_sharp,
            const OtherScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(
      BuildContext context, String title, IconData icon, Widget screen) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.red,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
