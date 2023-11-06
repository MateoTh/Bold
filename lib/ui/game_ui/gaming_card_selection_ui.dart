import 'package:bold/model/card.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/ui/game_ui/gaming_card_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamingCardSelectionUi extends StatelessWidget {
  const GamingCardSelectionUi(
      {super.key, required this.card, required this.size});

  final GameCard card;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
            shape: card == context.watch<ProviderSelectedCard>().selectedCard
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: const BorderSide(color: Colors.white, width: 2.0),
                  )
                : null,
            child: GamingCardUi(card: card, size: size)),
        Visibility(
          visible: card != context.watch<ProviderSelectedCard>().selectedCard &&
              card.number != null,
          child: Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
              ),
              child: Text(
                card.number.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ),
        )
      ],
    );
  }
}
