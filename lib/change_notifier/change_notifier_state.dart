import 'package:flutter/material.dart';

class ChangeNotifierState extends ChangeNotifier {
  bool isActive = false;

  void isNotifier() {
    isActive = !isActive;
    notifyListeners();
  }
}
