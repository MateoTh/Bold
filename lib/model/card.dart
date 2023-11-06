class GameCard {
  final CardType type;
  final int? number = null;

  GameCard({required this.type});
}

enum CardType { gun, flower }
