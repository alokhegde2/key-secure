import 'dart:math';

uniqueId() {
  int limit1 = 99999999;
  int limit2 = 888888;
  Random random = new Random();
  Random random1 = new Random();
  int number = random.nextInt(limit1)*random1.nextInt(limit2);
  return number;
}