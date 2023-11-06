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
            shape: card == context.watch<ProviderCard>().selectedCard
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: const BorderSide(color: Colors.white, width: 2.0),
                  )
                : null,
            child: GamingCardUi(card: card, size: size)),
        Visibility(
          visible: context.watch<ProviderCard>().placedCards?.contains(card) ??
              false,
          child: Positioned(
            bottom: 4,
            left: 4,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
              ),
              child: Text(
                (context.watch<ProviderCard>().placedCards!.indexOf(card) + 1)
                    .toString(),
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
