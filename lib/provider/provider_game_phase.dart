import 'package:bold/model/game.dart';
import 'package:flutter/material.dart';

class ProviderGame extends ChangeNotifier {
  GamePhase _gamePhase = GamePhase.build;
  bool _roundWon = false;

  GamePhase get gamePhase => _gamePhase;
  bool get roundWon => _roundWon;

  void setGamePhase(GamePhase phase) {
    _gamePhase = phase;
    notifyListeners();
  }

  void winRound() {
    _roundWon = !_roundWon;
    notifyListeners();
  }

  void looseRound() {
    _roundWon = false;
    notifyListeners();
  }
}
