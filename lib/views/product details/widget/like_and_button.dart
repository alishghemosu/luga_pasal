import 'package:eshop/service%20or%20provider/liked_state_provider.dart';
import 'package:eshop/views/cart%20screen/cart_scren.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late LikeState likeState;

  @override
  void initState() {
    super.initState();
    likeState = Provider.of<LikeState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Assuming LikeState and Consumer are properly defined elsewhere
          Consumer<LikeState>(
            builder: (context, likeState, _) => IconButton(
              icon: Icon(
                likeState.isLiked ? Icons.favorite : Icons.favorite_border,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
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
    );
  }
}
