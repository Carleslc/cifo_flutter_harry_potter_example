import '../utils/date_utils.dart';

class Character {
  // Person information
  final String name;
  final DateTime birthDate;

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
    required this.birthDate,
    required this.strength,
    required this.magicPower,
    required this.speed,
    required this.imageUrl,
    this.reviews = 0,
    this.totalRatings = 0,
  });

  Character.withRating({
    required String name,
    required DateTime birthDate,
    required int strength,
    required int magicPower,
    required int speed,
    required String imageUrl,
    required int rating,
    int reviews = 0,
  }) : this(
          name: name,
          birthDate: birthDate,
          strength: strength,
          magicPower: magicPower,
          speed: speed,
          imageUrl: imageUrl,
          reviews: reviews,
          totalRatings: reviews * rating,
        );

  int get age => DateTime.now().difference(birthDate).inYears;

  void addReview(int rating) {
    reviews++;
    totalRatings += rating;
  }
}
