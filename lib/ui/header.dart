import 'package:bold/model/game.dart';
import 'package:bold/provider/provider_card.dart';
import 'package:bold/provider/provider_game_phase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  Header({super.key});

  bool display = false;
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                widget.display = !widget.display;
              });
            },
          ),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            visible: widget.display,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              opacity: widget.display ? 1 : 0,
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
                      print("New Game");
                    },
                  ),
                  MenuButton(
                    icon: Icons.delete,
                    text: "Delete Card",
                    ontap: () {
                      print("Delete Card");
                    },
                  ),
                  MenuButton(
                    icon: Icons.menu_book,
                    text: "Rules",
                    ontap: () {
                      print("Rules");
                    },
                  ),
                  MenuButton(
                    icon: Icons.settings,
                    text: "Settings",
                    ontap: () {},
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
