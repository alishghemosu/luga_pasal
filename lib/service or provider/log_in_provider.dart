import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 3));
    _isLoading = false;
    notifyListeners();
  }
}
