import 'dart:math';

import 'package:bold/model/card.dart';
import 'package:bold/model/game.dart';
import 'package:flutter/material.dart';

class ProviderCard extends ChangeNotifier {
  List<GameCard> _handCards = [
    GameCard(type: CardType.flower),
    GameCard(type: CardType.flower),
    GameCard(type: CardType.flower),
    GameCard(type: CardType.gun),
  ];
  List<GameCard> _placedCards = [];
  List<GameCard> _revealedCards = [];

  GameCard? get selectedCard => _placedCards.lastOrNull;
  List<GameCard>? get handCards => _handCards;
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

  void resetGame() {
    _handCards = [
      GameCard(type: CardType.flower),
      GameCard(type: CardType.flower),
      GameCard(type: CardType.flower),
      GameCard(type: CardType.gun),
    ];
    resetCards();
  }

  void resetCards() {
    _placedCards = [];
    _revealedCards = [];
    notifyListeners();
  }

  void deleteCard() {
    if (_handCards.isEmpty) return;
    var card = _handCards[Random().nextInt(_handCards.length)];
    _handCards.remove(card);
    notifyListeners();
  }
}
