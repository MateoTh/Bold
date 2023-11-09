import 'dart:math';

import 'package:bold/model/card.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/ui/Cards/playing_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardFlipWidget extends StatefulWidget {
  const CardFlipWidget({Key? key, required this.front, required this.rear})
      : super(key: key);

  final Widget front;
  final Widget rear;

  @override
  CardFlipWidgetState createState() => CardFlipWidgetState();
}

class CardFlipWidgetState extends State<CardFlipWidget> {
  late bool _showFrontSide;

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
  }

  @override
  Widget build(BuildContext context) {
    return _buildFlipAnimation(
      front: PlayingCard(
          size: MediaQuery.of(context).size.width * 0.8,
          card: GameCard(type: CardType.flower),
          cardIllustration: AssetImage(
              context.read<ProviderCard>().selectedPlayingCardTheme.gunAsset)),
      rear: PlayingCard(
          size: MediaQuery.of(context).size.width * 0.8,
          card: GameCard(type: CardType.flower),
          cardIllustration: AssetImage(context
              .read<ProviderCard>()
              .selectedPlayingCardTheme
              .neutralFlowerAsset)),
    );
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  Widget _buildFlipAnimation({required Widget front, required Widget rear}) {
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
        child: _showFrontSide ? _buildFront(front) : _buildRear(rear),
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationX(value)..setEntry(3, 1, tilt),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  Widget _buildFront(Widget child) {
    return __buildLayout(
        key: const ValueKey(true), faceName: "Front", child: child);
  }

  Widget _buildRear(Widget child) {
    return __buildLayout(
        key: const ValueKey(false), faceName: "Rear", child: child);
  }

  Widget __buildLayout(
      {required Key key, required Widget child, required String faceName}) {
    return Container(
      key: key,
      child: Center(
        child: child,
      ),
    );
  }
}
