import 'package:bold/provider/provider_card.dart';
import 'package:bold/provider/provider_game_phase.dart';
import 'package:bold/ui/game_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ProviderCard(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProviderGame(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: GameScaffold(),
    );
  }
}
