import 'package:bold/provider/provider_card.dart';
import 'package:bold/ui/Rules/rule_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Step6 extends StatelessWidget {
  const Step6({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image(context,
              context.read<ProviderCard>().selectedPlayingCardTheme.gunAsset),
          const SizedBox(height: 8),
          rulesText(context, 'rules.step_6.sentance_1'),
          rulesText(context, 'rules.step_6.sentance_2'),
          rulesText(context, 'rules.step_6.sentance_3'),
          rulesText(context, 'rules.step_6.sentance_4'),
          rulesText(context, 'rules.step_6.sentance_5'),
        ]);
  }
}
