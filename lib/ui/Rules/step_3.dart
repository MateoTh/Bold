import 'package:bold/ui/Rules/rule_scaffold.dart';
import 'package:flutter/material.dart';

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
                image(context, "assets/red_flower.png",
                    size: MediaQuery.of(context).size.width * 0.4),
                image(context, "assets/red_gun.png",
                    size: MediaQuery.of(context).size.width * 0.4),
                rulesText(context, "Face Up"),
              ],
            ),
            Column(
              children: [
                image(context, "assets/neutral_flower.png",
                    size: MediaQuery.of(context).size.width * 0.4),
                rulesText(context, "Face Down"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        rulesText(context,
            "*After selecting a card, the player *drags down on the card* to turn it over"),
        rulesText(context,
            "*Everyone then *places their telephone on the table*, card face down, and the game can begin"),
      ],
    );
  }
}
