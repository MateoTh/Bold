import 'package:bold/model/card.dart';
import 'package:bold/model/game.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/provider/provider_game_phase.dart';
import 'package:bold/ui/game_ui/gaming_card_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacedCards extends StatelessWidget {
  const PlacedCards({super.key, required this.cards});

  final List<GameCard> cards;

  @override
  Widget build(BuildContext context) {
    final placedCards = context.watch<ProviderCard>().placedCards;
    final actualGamePhase = context.watch<ProviderGame>().gamePhase;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dy < 0) {
                context.read<ProviderGame>().setGamePhase(GamePhase.build);
              }
              if (details.delta.dy > 0) {
                context.read<ProviderGame>().setGamePhase(GamePhase.bet);
              }
            },
            onTap: () {
              if (actualGamePhase == GamePhase.build) return;
              context.read<ProviderGame>().setGamePhase(GamePhase.reveal);
              context.read<ProviderCard>().revealCard(actualGamePhase);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                // for (int i = 0; i < placedCards!.length; i++)
                //   Padding(
                //     padding: EdgeInsets.only(top: i * 32),
                //     child: GamingCardUi(
                //       size: MediaQuery.of(context).size.width * 0.8 + i * 16,
                //       card: placedCards[i],
                //     ),
                //   ),
                for (int i = 0; i < placedCards!.length; i++)
                  GamingCardUi(
                    size: MediaQuery.of(context).size.width * 0.8,
                    card: placedCards[i],
                  ),
              ],
            ),
          ),
          // SizedBox(
          //   height: placedCards.length * 32,
          // )
        ],
      ),
    );
  }
}
