import 'package:bold/provider/provider_card.dart';
import 'package:bold/provider/provider_game_phase.dart';
import 'package:bold/ui/Rules/rule_scaffold.dart';
import 'package:bold/ui/Settings/settings_scaffold.dart';
import 'package:bold/ui/Shared%20Widgets/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
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
                    text: translate('menu.newGame'),
                    ontap: () {
                      context.read<ProviderGame>().resetGame();
                      context.read<ProviderCard>().resetGame();
                    },
                  ),
                  MenuButton(
                    icon: Icons.menu_book,
                    text: translate('menu.rules'),
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
                    text: translate('menu.settings'),
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
