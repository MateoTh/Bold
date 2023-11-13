import 'package:bold/provider/provider_card.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class VictoryUi extends StatelessWidget {
  const VictoryUi({super.key});

  @override
  Widget build(BuildContext context) {
    String imagePath =
        context.read<ProviderCard>().selectedPlayingCardTheme.flowerAloneAsset;
    return Stack(
      children: [
        Positioned(
          top: -MediaQuery.of(context).size.width * 0.09,
          left: -MediaQuery.of(context).size.width * 0.09,
          child: Transform.rotate(
            angle: pi / 1.5,
            child: Image.asset(
              imagePath,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
        ),
        Positioned(
          top: -MediaQuery.of(context).size.width * 0.09,
          right: -MediaQuery.of(context).size.width * 0.09,
          child: Transform.rotate(
            angle: pi * 1.2,
            child: Image.asset(
              imagePath,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
        ),
        Positioned(
          bottom: -MediaQuery.of(context).size.width * 0.09,
          left: -MediaQuery.of(context).size.width * 0.09,
          child: Transform.rotate(
            angle: pi * 2.2,
            child: Image.asset(
              imagePath,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
        ),
        Positioned(
          bottom: -MediaQuery.of(context).size.width * 0.09,
          right: -MediaQuery.of(context).size.width * 0.09,
          child: Transform.rotate(
            angle: pi * 1.7,
            child: Image.asset(
              imagePath,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
        ),
      ],
    );
  }
}
