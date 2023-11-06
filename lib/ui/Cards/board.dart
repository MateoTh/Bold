import 'package:bold/model/card.dart';
import 'package:bold/model/game.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/provider/provider_game_phase.dart';
import 'package:bold/ui/Cards/playing_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    final placedCards = context.watch<ProviderCard>().placedCards;
    final actualGamePhase = context.watch<ProviderGame>().gamePhase;

    return Padding(
      padding: EdgeInsets.only(
          right: (placedCards!.isNotEmpty
                  ? placedCards.length - 1
                  : placedCards.length) *
              8,
          bottom: (placedCards.isNotEmpty
                  ? placedCards.length - 1
                  : placedCards.length) *
              8),
      child: Center(
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
                  for (int i = 0; i < placedCards.length; i++)
                    Padding(
                      padding: EdgeInsets.only(top: i * 16, left: i * 16),
                      child: PlayingCard(
                        size: MediaQuery.of(context).size.width * 0.8,
                        card: placedCards[i],
                        cardIllustration:
                            _cardIllustration(context, placedCards[i]),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }

  AssetImage _cardIllustration(BuildContext context, GameCard card) {
    List<GameCard>? revealed = context.watch<ProviderCard>().revealedCards;
    switch (context.watch<ProviderGame>().gamePhase) {
      case GamePhase.build:
        if (card.type == CardType.flower) {
          switch (card.type) {
            case CardType.flower:
              return const AssetImage("assets/red_flower.png");
            case CardType.gun:
              return const AssetImage("assets/red_gun.png");
          }
        }
        switch (card.type) {
          case CardType.flower:
            return const AssetImage("assets/red_flower.png");
          case CardType.gun:
            return const AssetImage("assets/red_gun.png");
        }
      case GamePhase.bet:
        return const AssetImage("assets/neutral_flower.png");
      case GamePhase.reveal:
        if (revealed!.contains(card)) {
          switch (card.type) {
            case CardType.flower:
              return const AssetImage("assets/red_flower.png");
            case CardType.gun:
              return const AssetImage("assets/red_gun.png");
          }
        }
        return const AssetImage("assets/neutral_flower.png");
    }
  }
}
