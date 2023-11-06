import 'package:bold/model/card.dart';
import 'package:flutter/material.dart';

class PlayingCard extends StatelessWidget {
  const PlayingCard(
      {super.key,
      required this.card,
      required this.size,
      required this.cardIllustration});

  final GameCard card;
  final double size;
  final AssetImage cardIllustration;

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
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.white.withOpacity(0.2),
        //     blurRadius: 4,
        //     offset: const Offset(4, 4),
        //   ),
        // ],
      ),
    );
  }
}
