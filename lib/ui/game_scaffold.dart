import 'package:bold/model/card.dart';
import 'package:bold/ui/Cards/board.dart';
import 'package:bold/ui/Cards/hand.dart';
import 'package:bold/ui/Cards/revealed.dart';
import 'package:bold/ui/header.dart';
import 'package:flutter/material.dart';

class GameScaffold extends StatelessWidget {
  GameScaffold({super.key});

  final List<GameCard> cards = [
    GameCard(type: CardType.flower),
    GameCard(type: CardType.flower),
    GameCard(type: CardType.flower),
    GameCard(type: CardType.gun),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Revealed(),
            Board(cards: cards),
            Hand(cards: cards),
            const Header()
          ],
        ),
      ),
    );
  }
}
