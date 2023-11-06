import 'package:bold/model/card.dart';
import 'package:flutter/material.dart';

class PlayingCard extends StatelessWidget {
  const PlayingCard(
      {super.key,
      required this.card,
      required this.size,
      required this.cardIllustration,
      this.filtre = false});

  final GameCard card;
  final double size;
  final AssetImage cardIllustration;
  final bool filtre;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.5),
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
