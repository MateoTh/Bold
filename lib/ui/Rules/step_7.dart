import 'package:bold/provider/provider_card.dart';
import 'package:bold/ui/Rules/rule_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Step7 extends StatelessWidget {
  const Step7({super.key});

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
                  .neutralFlowerAsset),
          const SizedBox(height: 8),
          rulesText(context,
              "*If the player *misses his prediction*, he is penalized by *randomly losing one of his cards*"),
          rulesText(context,
              "*He must click on the *'Delete Card'* menu button and continue the game with this disadvantage"),
          rulesText(context,
              "*If the player has *made his prediction* with success, he *scores a point* and must click on the *'Win Round'* menu button"),
          rulesText(context,
              "*All others click on the *'Reset Cards'* menu button to *recover* their cards"),
          rulesText(context,
              "*Each player then *chooses the first card he want's to play*, and the next round begins"),
          rulesText(
              context, "*The first player to *score two points wins* the game"),
        ]);
  }
}
