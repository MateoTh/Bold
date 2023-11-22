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
          rulesText(context, 'rules.step_5.sentance_1'),
          rulesText(context, 'rules.step_5.sentance_2'),
          rulesText(context, 'rules.step_5.sentance_3'),
          rulesText(context, 'rules.step_5.sentance_4'),
          rulesText(context, 'rules.step_5.sentance_5'),
        ]);
  }
}
