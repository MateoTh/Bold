import 'package:bold/model/card.dart';
import 'package:flutter/material.dart';

class PlayingCard extends StatelessWidget {
  const PlayingCard(
      {super.key,
      required this.card,
      required this.size,
      required this.cardIllustration,
      this.filtre = false,
      this.border = true});

  final GameCard card;
  final double size;
  final AssetImage cardIllustration;
  final bool filtre;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: border ? Border.all(color: Colors.white, width: 0.5) : null,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: cardIllustration,
          colorFilter: filtre
              ? ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.darken)
              : null,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
