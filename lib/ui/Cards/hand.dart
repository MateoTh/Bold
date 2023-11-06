import 'package:bold/model/card.dart';
import 'package:bold/model/game.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/provider/provider_game_phase.dart';
import 'package:bold/ui/Cards/playing_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Hand extends StatelessWidget {
  const Hand({super.key, required this.cards});

  final List<GameCard> cards;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: Consumer<ProviderGame>(
        builder: (context, providerGame, child) {
          return Visibility(
            maintainAnimation: true,
            maintainState: true,
            visible: providerGame.gamePhase == GamePhase.build,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              opacity: providerGame.gamePhase == GamePhase.build ? 1 : 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: cards
                      .map(
                        (card) => GestureDetector(
                            onTap: () =>
                                {context.read<ProviderCard>().addNewCard(card)},
                            child: _cardAth(context, card)),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _cardAth(BuildContext context, GameCard card) {
    return Stack(
      children: [
        Card(
            shape: card == context.watch<ProviderCard>().selectedCard
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: const BorderSide(color: Colors.white, width: 2.0),
                  )
                : null,
            child: PlayingCard(
                card: card,
                size: MediaQuery.of(context).size.width / 5,
                cardIllustration: _cardIllustration(context, card))),
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

  AssetImage _cardIllustration(BuildContext context, GameCard card) {
    switch (card.type) {
      case CardType.flower:
        return const AssetImage("assets/red_flower.png");
      case CardType.gun:
        return const AssetImage("assets/red_gun.png");
    }
  }
}
