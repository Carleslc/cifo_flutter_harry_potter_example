import 'dart:math';

final random = Random();

extension RandomUtils on Random {
  /// Generates a positive random integer uniformly distributed on the range
  /// from [min] (inclusive) to [max] (inclusive).
  int nextIntBetween(int min, int max) => min + nextInt(max - min + 1);
}
