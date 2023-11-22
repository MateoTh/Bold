import 'dart:math';

import 'package:bold/model/cardTheme.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';

class SettingsScaffold extends StatelessWidget {
  const SettingsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate('headers.settings'),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text(
                    translate('languages.fr'),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    changeLocale(context, 'fr');
                  },
                ),
                ElevatedButton(
                  child: Text(
                    translate('languages.en'),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    changeLocale(context, 'en_US');
                  },
                ),
              ],
            ),
            Column(
              children: PlayingCardThemes.map((theme) {
                return coupleImage(context, theme);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget coupleImage(BuildContext context, PlayingCardTheme theme) {
  bool selected =
      context.watch<ProviderCard>().selectedPlayingCardTheme == theme;
  return GestureDetector(
    onTap: () {
      context.read<ProviderCard>().setPlayingCardTheme(theme);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 128),
              child: Transform.rotate(
                angle: pi / -8,
                child: image(
                  context,
                  theme.flowerAsset,
                  selected,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 128),
              child: Transform.rotate(
                angle: pi / 8,
                child: image(
                  context,
                  theme.gunAsset,
                  selected,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget image(BuildContext context, String path, bool selected, {double? size}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: size ?? MediaQuery.of(context).size.width * 0.5,
      height: size ?? MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: selected ? 4 : 0.5),
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(path),
        ),
      ),
    ),
  );
}
