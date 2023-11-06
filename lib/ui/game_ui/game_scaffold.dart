import 'package:bold/model/card.dart';
import 'package:bold/model/game.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/provider/provider_game_phase.dart';
import 'package:bold/ui/game_ui/displayed_cards.dart';
import 'package:bold/ui/game_ui/game_card_selection.dart';
import 'package:bold/ui/game_ui/gaming_card_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    List<GameCard>? revealedCards = context.watch<ProviderCard>().revealedCards;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
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
                                child: GamingCardUi(
                                    card: card,
                                    size:
                                        MediaQuery.of(context).size.width / 5),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
            PlacedCards(cards: cards),
            Positioned(
              bottom: 20,
              child: Consumer<ProviderGame>(
                builder: (context, providerGame, child) {
                  return Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    visible: providerGame.gamePhase == GamePhase.build,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      opacity:
                          providerGame.gamePhase == GamePhase.build ? 1 : 0,
                      child: GameCardSelection(cards: cards),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read<ProviderGame>().setGamePhase(GamePhase.build);
                  context.read<ProviderCard>().resetCards();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
