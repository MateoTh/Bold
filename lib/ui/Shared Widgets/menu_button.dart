import 'package:flutter/material.dart';

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
