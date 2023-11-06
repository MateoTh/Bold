import 'package:flutter/material.dart';

class ProviderCardActualNumber extends ChangeNotifier {
  int _actualNumber = 0;

  int get selectedCard => _actualNumber;

  void setSelectedCard(int number) {
    _actualNumber = number;
    notifyListeners();
  }
}
