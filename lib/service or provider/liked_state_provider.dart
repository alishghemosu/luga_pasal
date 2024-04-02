import 'package:flutter/material.dart';

class LikeState extends ChangeNotifier {
  bool _isLiked = false;

  bool get isLiked => _isLiked;

  void updateLike() {
    _isLiked = !_isLiked;
    notifyListeners();
  }
}
