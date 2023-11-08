import 'package:bold/model/card.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/provider/provider_game_phase.dart';
import 'package:bold/ui/Cards/playing_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Revealed extends StatelessWidget {
  const Revealed({super.key});

  @override
  Widget build(BuildContext context) {
    List<GameCard>? revealedCards = context.watch<ProviderCard>().revealedCards;
    return Positioned(
      top: 20,
      child: Consumer<ProviderGame>(
        builder: (context, providerGame, child) {
          return Visibility(
            maintainAnimation: true,
            maintainState: true,
            visible: revealedCards != null,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              opacity: revealedCards != null ? 1 : 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: revealedCards!
                    .map(
                      (card) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PlayingCard(
                            card: card,
                            size: MediaQuery.of(context).size.width / 5,
                            cardIllustration: _cardIllustration(context, card)),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  AssetImage _cardIllustration(BuildContext context, GameCard card) {
    switch (card.type) {
      case CardType.flower:
        return AssetImage(
            context.read<ProviderCard>().selectedPlayingCardTheme.flowerAsset);
      case CardType.gun:
        return AssetImage(
            context.read<ProviderCard>().selectedPlayingCardTheme.gunAsset);
    }
  }
}
