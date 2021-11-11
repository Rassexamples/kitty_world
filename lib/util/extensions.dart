import 'dart:math';

extension RandomInRange on int {
  static int randomInRange(int min, int max) {
    final _random = Random();
    return min + _random.nextInt(max - min);
  }

}