import 'package:flutter/material.dart';
import 'item.dart';
import 'orbit_menu_animation_type.dart';

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

  OrbitMenuConfig({
    this.animationType = OrbitMenuAnimationType.bouncing,
    this.animationDuration = const Duration(seconds: 12),
    required this.menuPositionX,
    required this.menuPositionY,
    required this.menuColor,
    required this.radius,
    required this.menuItems,
    required this.itemSize,
    required this.itemColor,
    this.titleStyle = const TextStyle(color: Colors.black),
    required this.itemBorderColor,
    required this.borderCentralMenuColor,
    this.itemOffsetPercentage = 0.0,
  });
}
