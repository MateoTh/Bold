import 'package:bold/model/card.dart';
import 'package:bold/model/game.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/provider/provider_game_phase.dart';
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
    return Scaffold(
        body: Center(
            child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dy < 0) {
              context.read<ProviderGame>().setGamePhase(GamePhase.build);
            }
            if (details.delta.dy > 0) {
              context.read<ProviderGame>().setGamePhase(GamePhase.bet);
            }
          },
          onTap: () => {
            context.read<ProviderGame>().setGamePhase(GamePhase.reveal),
          },
          child: GamingCardUi(
              size: MediaQuery.of(context).size.width * 0.8,
              card: context.watch<ProviderCard>().selectedCard ?? cards[0]),
        )),
        bottomNavigationBar: Consumer<ProviderGame>(
          builder: (context, providerGame, child) {
            return Visibility(
              maintainAnimation: true,
              maintainState: true,
              visible: providerGame.gamePhase == GamePhase.build,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                opacity: providerGame.gamePhase == GamePhase.build ? 1 : 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GameCardSelection(cards: cards),
                ),
              ),
            );
          },
        ));
  }
}
