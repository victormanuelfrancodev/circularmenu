import 'package:flutter/material.dart';
import 'item.dart';
import 'orbit_menu_animation_type.dart';
/// Configuration for the orbit menu.
class OrbitMenuConfig {
  final Duration animationDuration;
  final OrbitMenuAnimationType animationType;
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
  final TextStyle titleStyle;
  final Widget? myWidget;

  OrbitMenuConfig({
    this.animationType = OrbitMenuAnimationType.bouncing,
    this.animationDuration = const Duration(seconds: 12),
    required this.menuPositionX,
    required this.menuPositionY,
    required this.menuColor,
    required this.radius,
    required this.borderCentralMenuColor,
    required this.menuItems,
    this.itemSize = 50.0,
    this.itemColor = Colors.red,
    this.titleStyle = const TextStyle(color: Colors.black),
    this.itemBorderColor = Colors.black,
    this.itemOffsetPercentage = 0.0,
    this.myWidget,
  });
}
