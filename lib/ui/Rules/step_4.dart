import 'package:bold/ui/Rules/rule_scaffold.dart';
import 'package:flutter/material.dart';

class Step4 extends StatelessWidget {
  const Step4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image(context, "assets/neutral_flower.png"),
          const SizedBox(height: 8),
          rulesText(context, "*The most beautiful player starts"),
          rulesText(context,
              "*In his turn, each player can do one of the following:"),
          rulesText(context, "Add or Bet"),
          rulesText(context,
              "*If he decides to *bet*, the player *takes back his phone*, pulls up his card to get back to his hand and chooses which of his remaining cards he will place *on top of the first one."),
          rulesText(context,
              "*After choosing a new card, he pulls them down again *to turn them over*, and places the phone back on the table for all to see."),
          rulesText(context, "*Now it's the turn of the next player."),
        ]);
  }
}
