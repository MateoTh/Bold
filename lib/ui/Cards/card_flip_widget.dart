import 'dart:math';
import 'package:bold/model/card.dart';
import 'package:bold/model/game.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/provider/provider_game_phase.dart';
import 'package:bold/ui/Cards/playing_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardFlipWidget extends StatefulWidget {
  const CardFlipWidget({Key? key, required this.card}) : super(key: key);

  final GameCard card;

  @override
  CardFlipWidgetState createState() => CardFlipWidgetState();
}

class CardFlipWidgetState extends State<CardFlipWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: __transitionBuilder,
      layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeOut.flipped,
      child: _isFrontVisible() ? _buildFront() : _buildRear(),
    );
  }

  Widget __transitionBuilder(Widget child, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: child,
      builder: (context, child) {
        final isUnder = (ValueKey(_isFrontVisible()) != child?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationX(value)..setEntry(3, 1, tilt),
          alignment: Alignment.center,
          child: child,
        );
      },
    );
  }

  Widget _buildFront() {
    return Container(
      key: const ValueKey(true),
      child: PlayingCard(
          size: MediaQuery.of(context).size.width * 0.8,
          card: widget.card,
          cardIllustration: _cardIllustration(context, widget.card)),
    );
  }

  Widget _buildRear() {
    return Container(
      key: const ValueKey(false),
      child: PlayingCard(
          size: MediaQuery.of(context).size.width * 0.8,
          card: GameCard(type: CardType.flower),
          cardIllustration: AssetImage(context
              .read<ProviderCard>()
              .selectedPlayingCardTheme
              .neutralFlowerAsset)),
    );
  }

  bool _isFrontVisible() {
    GamePhase gamePhase = context.watch<ProviderGame>().gamePhase;
    GameCard? lastPlacedCard = context.watch<ProviderCard>().placedCards?.last;
    List<GameCard>? revealedCards = context.watch<ProviderCard>().revealedCards;

    if (gamePhase == GamePhase.bet) return false;
    if (gamePhase == GamePhase.build && widget.card == lastPlacedCard) {
      return true;
    }
    if (gamePhase == GamePhase.reveal && revealedCards!.contains(widget.card)) {
      return true;
    }
    return false;
  }

  AssetImage _cardIllustration(BuildContext context, GameCard card) {
    switch (card.type) {
      case CardType.flower:
        return AssetImage(
            context.read<ProviderCard>().selectedPlayingCardTheme.flowerAsset);
      case CardType.gun:
        return AssetImage(
            context.read<ProviderCard>().selectedPlayingCardTheme.gunAsset);
    }
  }
}
