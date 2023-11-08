import 'package:bold/provider/provider_card.dart';
import 'package:bold/ui/Rules/rule_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Step2 extends StatelessWidget {
  const Step2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                image(
                    context,
                    context
                        .read<ProviderCard>()
                        .selectedPlayingCardTheme
                        .flowerAsset,
                    size: MediaQuery.of(context).size.width * 0.4),
                rulesText(context, "3 Flowers"),
              ],
            ),
            Column(
              children: [
                image(
                    context,
                    context
                        .read<ProviderCard>()
                        .selectedPlayingCardTheme
                        .gunAsset,
                    size: MediaQuery.of(context).size.width * 0.4),
                rulesText(context, "1 Gun"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        rulesText(context, "*Each player has *4 cards* on his hand"),
        rulesText(context,
            "*When the game starts, each player *chooses a card to play by clicking it"),
      ],
    );
  }
}
