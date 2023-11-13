import 'package:bold/model/game.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/provider/provider_game_phase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.watch<ProviderGame>().gamePhase == GamePhase.reveal,
      child: Positioned(
        bottom: MediaQuery.of(context).size.height * 0.05,
        child: Column(
          children: [
            ElevatedButton(
              child: const Text(
                "New Round",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                context.read<ProviderGame>().setGamePhase(GamePhase.build);
                context.read<ProviderCard>().resetCards();
              },
            ),
            Row(
              children: [
                TextButton(
                  child: const Text(
                    "Win Round",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    context.read<ProviderGame>().winRound();
                  },
                ),
                TextButton(
                  child: const Text(
                    "Delete Card",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    context.read<ProviderCard>().deleteCard();
                    context.read<ProviderGame>().setGamePhase(GamePhase.build);
                    context.read<ProviderCard>().resetCards();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
