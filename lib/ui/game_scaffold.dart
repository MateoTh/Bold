import 'package:bold/provider/provider_game_phase.dart';
import 'package:bold/ui/Cards/board.dart';
import 'package:bold/ui/Cards/hand.dart';
import 'package:bold/ui/Cards/revealed.dart';
import 'package:bold/ui/Shared%20Widgets/header.dart';
import 'package:bold/ui/Shared%20Widgets/reset_button.dart';
import 'package:bold/ui/Shared%20Widgets/victory_ui.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class GameScaffold extends StatelessWidget {
  const GameScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
                visible: context.watch<ProviderGame>().roundWon,
                child: const VictoryUi()),
            const ResetButton(),
            const Revealed(),
            const Board(),
            const Hand(),
            const Header(),
          ],
        ),
      ),
    );
  }
}
