import 'package:bold/model/card.dart';
import 'package:flutter/material.dart';

class PlayingCard extends StatelessWidget {
  const PlayingCard(
      {super.key,
      required this.card,
      required this.size,
      required this.cardIllustration});

  final GameCard card;
  final double size;
  final AssetImage cardIllustration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.5),
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: cardIllustration,
          )),
    );
  }

  // AssetImage _cardIllustration(BuildContext context) {
  //   switch (context.watch<ProviderGame>().gamePhase) {
  //     case GamePhase.bet:
  //       return const AssetImage("assets/neutral_flower.png");
  //     case GamePhase.build || GamePhase.reveal:
  //       switch (card.type) {
  //         case CardType.flower:
  //           return const AssetImage("assets/red_flower.png");
  //         case CardType.gun:
  //           return const AssetImage("assets/red_gun.png");
  //       }
  //   }
  // }
}
