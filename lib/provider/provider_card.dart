import 'package:bold/model/card.dart';
import 'package:flutter/material.dart';

class ProviderCard extends ChangeNotifier {
  List<GameCard> _placedCards = [];

  GameCard? get selectedCard => _placedCards.lastOrNull;
  List<GameCard>? get placedCards => _placedCards;

  void addNewCard(GameCard card) {
    if (!_placedCards.contains(card)) {
      _placedCards.add(card);
    } else {
      _placedCards.remove(card);
    }
    notifyListeners();
  }
}
