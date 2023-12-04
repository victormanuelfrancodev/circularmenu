class OrbitMenuConfig {
  final double menuPositionX;
  final double menuPositionY;
  final Color menuColor;
  final double radius;
  final List<Item> menuItems;
  final double itemSize;
  final Color itemColor;
  final Color itemBorderColor;
  final Color borderCentralMenuColor;
  final double itemOffsetPercentage;

  OrbitMenuConfig({
    required this.menuPositionX,
    required this.menuPositionY,
    required this.menuColor,
    required this.radius,
    required this.menuItems,
    required this.itemSize,
    required this.itemColor,
    required this.itemBorderColor,
    required this.borderCentralMenuColor,
    this.itemOffsetPercentage = 0.0,
  });
}