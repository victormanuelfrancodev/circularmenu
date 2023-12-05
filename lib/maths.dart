import 'dart:math';

///Formulas for calculate position x and y
/// x=  r x cos(θ);
/// y= r x sin(θ);
///
///  1 round = 360° = 2π rad

List<Point> getCircularPosition(
    int numberOfElements, double radius, double scrollY) {
  List<Point> points = [];

  for (var i = 0; i < numberOfElements; i++) {
    var angle = scrollY + (i * 2 * pi) / numberOfElements;
    var x = radius * cos(angle);
    var y = radius * sin(angle);

    points.add(Point(x, y));
  }

  return points;
}
