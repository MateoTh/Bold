import 'package:bold/model/game.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/provider/provider_game_phase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 20,
      child: IconButton(
        icon: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        onPressed: () {
          context.read<ProviderGame>().setGamePhase(GamePhase.build);
          context.read<ProviderCard>().resetCards();
        },
      ),
    );
  }
}
