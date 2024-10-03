class Character {
  // Person information
  final String name;

  // Attributes
  final int strength;
  final int magicPower;
  final int speed;

  // Image
  final String imageUrl;

  // Reviews
  int reviews;
  int totalRatings;

  /// Average rating
  double get rating => reviews == 0 ? 0 : totalRatings / reviews;

  Character({
    required this.name,
    required this.strength,
    required this.magicPower,
    required this.speed,
    required this.imageUrl,
    this.reviews = 0,
    this.totalRatings = 0,
  });

  Character.withRating({
    required String name,
    required int strength,
    required int magicPower,
    required int speed,
    required String imageUrl,
    required int rating,
    int reviews = 0,
  }) : this(
          name: name,
          strength: strength,
          magicPower: magicPower,
          speed: speed,
          imageUrl: imageUrl,
          reviews: reviews,
          totalRatings: reviews * rating,
        );
}
