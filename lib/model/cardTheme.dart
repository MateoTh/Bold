class PlayingCardTheme {
  final String neutralFlowerAsset;
  final String flowerAloneAsset;
  final String flowerAsset;
  final String gunAsset;

  PlayingCardTheme({
    required this.neutralFlowerAsset,
    required this.flowerAloneAsset,
    required this.flowerAsset,
    required this.gunAsset,
  });
}

List<PlayingCardTheme> PlayingCardThemes = [
  PlayingCardTheme(
    neutralFlowerAsset: 'assets/neutral_flower.png',
    flowerAloneAsset: 'assets/red_flower_alone.png',
    flowerAsset: 'assets/red_flower.png',
    gunAsset: 'assets/red_gun.png',
  ),
  PlayingCardTheme(
    neutralFlowerAsset: 'assets/neutral_flower.png',
    flowerAloneAsset: 'assets/blue_flower_alone.png',
    flowerAsset: 'assets/blue_flower.png',
    gunAsset: 'assets/blue_gun.png',
  ),
];
