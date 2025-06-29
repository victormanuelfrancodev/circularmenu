import 'dart:ui';

/// Item class
class Item {
  String image;
  VoidCallback onPressed;
  String title;

  Item({required this.title, required this.onPressed, required this.image});
}
