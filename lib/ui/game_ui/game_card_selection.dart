import 'package:bold/model/card.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/ui/game_ui/gaming_card_selection_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameCardSelection extends StatelessWidget {
  const GameCardSelection({super.key, required this.cards});

  final List<GameCard> cards;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: cards
                  .map(
                    (card) => GestureDetector(
                      onTap: () =>
                          {context.read<ProviderCard>().addNewCard(card)},
                      child: GamingCardSelectionUi(
                          card: card,
                          size: MediaQuery.of(context).size.width / 5),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
