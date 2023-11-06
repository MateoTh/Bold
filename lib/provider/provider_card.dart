import 'package:bold/model/card.dart';
import 'package:flutter/material.dart';

class ProviderSelectedCard extends ChangeNotifier {
  GameCard? _selectedCard;

  GameCard? get selectedCard => _selectedCard;

  void setSelectedCard(GameCard? card) {
    _selectedCard = card;
    notifyListeners();
  }
}
