import 'package:bold/provider/provider_card.dart';
import 'package:bold/ui/Rules/rule_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Step5 extends StatelessWidget {
  const Step5({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image(
              context,
              context
                  .read<ProviderCard>()
                  .selectedPlayingCardTheme
                  .flowerAsset),
          const SizedBox(height: 8),
          rulesText(context,
              "*If the player decides to bet, he must announce *how many flowers* he is able to find from *all the players'cards."),
          rulesText(context,
              "*To achieve his forecast, he must follow these three rules :"),
          rulesText(context,
              "1. The player must first reveal all his cards before turning over those of others"),
          rulesText(context,
              "2. After turning over his cards, he can turn over those of others in any order"),
          rulesText(context,
              "3. If a player turns over a pistol before finding the number of flowers announced, he has lost"),
        ]);
  }
}
