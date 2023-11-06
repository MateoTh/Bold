import 'package:bold/ui/Rules/rule_scaffold.dart';
import 'package:flutter/material.dart';

class Step6 extends StatelessWidget {
  const Step6({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image(context, "assets/red_gun.png"),
          const SizedBox(height: 8),
          rulesText(context,
              "*After announcing his bet, the following players have only two choices:"),
          rulesText(context, "Pass or Bid"),
          rulesText(context,
              "*If he decides to *Pass*, the player *can no longer intervene during the round"),
          rulesText(context,
              "*If he decides to *Bid*, the player must announce a *higher number of flowers"),
          rulesText(context,
              "*This continues until all the other players have passed, at which point the last player *must attempt to make his prediction in accordance with the three rules before"),
        ]);
  }
}
