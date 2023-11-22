import 'package:bold/provider/provider_card.dart';
import 'package:bold/ui/Rules/rule_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Step3 extends StatelessWidget {
  const Step3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
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
                image(
                    context,
                    context
                        .read<ProviderCard>()
                        .selectedPlayingCardTheme
                        .gunAsset,
                    size: MediaQuery.of(context).size.width * 0.4),
                rulesText(context, 'rules.step_3.sentance_1'),
              ],
            ),
            Column(
              children: [
                image(
                    context,
                    context
                        .read<ProviderCard>()
                        .selectedPlayingCardTheme
                        .neutralFlowerAsset,
                    size: MediaQuery.of(context).size.width * 0.4),
                rulesText(context, 'rules.step_3.sentance_2'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        rulesText(context, 'rules.step_3.sentance_3'),
        rulesText(context, 'rules.step_3.sentance_4'),
      ],
    );
  }
}
