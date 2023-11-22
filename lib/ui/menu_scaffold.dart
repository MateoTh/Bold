import 'package:bold/model/card.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/ui/Cards/playing_card.dart';
import 'package:bold/ui/Rules/rule_scaffold.dart';
import 'package:bold/ui/game_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';

class MenuScaffold extends StatelessWidget {
  const MenuScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          PlayingCard(
              size: MediaQuery.of(context).size.width * 0.9,
              card: GameCard(type: CardType.flower),
              cardIllustration: AssetImage(context
                  .read<ProviderCard>()
                  .selectedPlayingCardTheme
                  .neutralFlowerAsset)),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Image.asset("assets/bold.png",
            //     height: MediaQuery.of(context).size.height * 0.3),
            SizedBox(height: MediaQuery.of(context).size.height * 0.7),
            ElevatedButton(
              child: Text(
                translate('menu.newGame'),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GameScaffold()),
                );
              },
            ),
            TextButton(
              child: Text(
                translate('menu.rules'),
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RuleScaffold()),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ]),
        ],
      ),
    ));
  }
}
