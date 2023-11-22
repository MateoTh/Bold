import 'package:bold/provider/provider_card.dart';
import 'package:bold/ui/Rules/rule_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Step1 extends StatelessWidget {
  const Step1({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              rulesText(context, 'rules.step_1.sentance_1'),
            ],
          ),
          rulesText(context, "rules.step_1.sentance_2"),
          rulesText(context, "rules.step_1.sentance_3"),
        ]);
  }
}
