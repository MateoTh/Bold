import 'package:bold/model/card.dart';
import 'package:bold/model/game.dart';
import 'package:bold/provider/provider_game_phase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamingCardUi extends StatelessWidget {
  const GamingCardUi({super.key, required this.card, required this.size});

  final GameCard card;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.5),
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: _cardIllustration(context),
          )),
    );
  }

  AssetImage _cardIllustration(BuildContext context) {
    switch (context.watch<ProviderGame>().gamePhase) {
      case GamePhase.bet:
        return const AssetImage("assets/neutral_flower.png");
      case GamePhase.build || GamePhase.reveal:
        switch (card.type) {
          case CardType.flower:
            return const AssetImage("assets/red_flower.png");
          case CardType.gun:
            return const AssetImage("assets/red_gun.png");
        }
    }
  }
}
