import 'package:bold/model/game.dart';
import 'package:flutter/material.dart';

class ProviderGame extends ChangeNotifier {
  GamePhase _gamePhase = GamePhase.build;

  GamePhase get gamePhase => _gamePhase;

  void setGamePhase(GamePhase phase) {
    _gamePhase = phase;
    notifyListeners();
  }
}
