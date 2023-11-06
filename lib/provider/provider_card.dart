import 'package:bold/model/card.dart';
import 'package:bold/model/game.dart';
import 'package:flutter/material.dart';

class ProviderCard extends ChangeNotifier {
  List<GameCard> _placedCards = [];
  List<GameCard> _revealedCards = [];

  GameCard? get selectedCard => _placedCards.lastOrNull;
  List<GameCard>? get placedCards => _placedCards;
  List<GameCard>? get revealedCards => _revealedCards;

  void addNewCard(GameCard card) {
    if (!_placedCards.contains(card)) {
      _placedCards.add(card);
    } else if (_placedCards.last == card) {
      _placedCards.remove(card);
    }
    notifyListeners();
  }

  void revealCard(GamePhase phase) {
    if (_placedCards.length == 1) return;
    if (_placedCards.isNotEmpty) {
      if (_revealedCards.isEmpty) {
        _revealedCards.add(_placedCards.last);
      } else {
        _placedCards.removeLast();
        _revealedCards.add(_placedCards.last);
      }
    }
    notifyListeners();
  }

  void resetCards() {
    _placedCards = [];
    _revealedCards = [];
    notifyListeners();
  }
}
