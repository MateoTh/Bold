import 'package:bold/model/game.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/provider/provider_game_phase.dart';
import 'package:bold/ui/Rules/rule_scaffold.dart';
import 'package:bold/ui/Settings/settings_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool display = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          MenuButton(
            icon: Icons.menu,
            text: "",
            ontap: () {
              setState(() {
                display = !display;
              });
            },
          ),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            visible: display,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              opacity: display ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MenuButton(
                    icon: Icons.refresh,
                    text: "Reset",
                    ontap: () {
                      context
                          .read<ProviderGame>()
                          .setGamePhase(GamePhase.build);
                      context.read<ProviderCard>().resetCards();
                    },
                  ),
                  MenuButton(
                    icon: Icons.add,
                    text: "New Game",
                    ontap: () {
                      context.read<ProviderCard>().resetGame();
                    },
                  ),
                  MenuButton(
                    icon: Icons.close,
                    text: "Delete Card",
                    ontap: () {
                      context.read<ProviderCard>().deleteCard();
                    },
                  ),
                  MenuButton(
                    icon: Icons.star,
                    text: "Win Round",
                    ontap: () {
                      context.read<ProviderGame>().winRound();
                    },
                  ),
                  MenuButton(
                    icon: Icons.menu_book,
                    text: "Rules",
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RuleScaffold()),
                      );
                    },
                  ),
                  MenuButton(
                    icon: Icons.settings,
                    text: "Settings",
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsScaffold()),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton(
      {super.key, required this.text, required this.icon, required this.ontap});

  final String text;
  final IconData icon;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Icon(icon),
        ]),
      ),
    );
  }
}
