import 'package:bold/ui/Rules/rule_scaffold.dart';
import 'package:flutter/material.dart';

class Step1 extends StatelessWidget {
  const Step1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image(context, "assets/neutral_flower.png"),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              rulesText(context, "Bold *is a game of bluffing and reasoning"),
            ],
          ),
          rulesText(context,
              "*There is no required number of players, but it is preferable to be between* 3 and 6"),
          rulesText(context,
              "*Each player needs a *phone with the application installed"),
        ]);
  }
}
