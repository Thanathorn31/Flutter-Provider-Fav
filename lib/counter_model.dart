import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  final int maxItems = 20;

  final List<bool> _favorites = List.generate(20, (_) => false);

  List<bool> get favorites => _favorites;

  void toggleFavorite(int index) {
    _favorites[index] = !_favorites[index];
    notifyListeners();
  }
}
