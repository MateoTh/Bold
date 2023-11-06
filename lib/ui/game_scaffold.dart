import 'package:bold/ui/Cards/board.dart';
import 'package:bold/ui/Cards/hand.dart';
import 'package:bold/ui/Cards/revealed.dart';
import 'package:bold/ui/header.dart';
import 'package:flutter/material.dart';

class GameScaffold extends StatelessWidget {
  const GameScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [const Revealed(), const Board(), const Hand(), Header()],
        ),
      ),
    );
  }
}
