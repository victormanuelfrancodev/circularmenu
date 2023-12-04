library circularmenu;

import 'dart:math';
import 'package:flutter/material.dart';
import 'big_circle.dart';
import 'circle_item.dart';
import 'item.dart';
import 'maths.dart';

class OrbitMenu {
  static List<Widget> createMenu({
    required double menuPositionX,
    required double menuPositionY,
    required Color menuColor,
    required double radius,
    required List<Item> menuItems,
    required double itemSize,
    required Color itemColor,
    required Color itemBorderColor,
    required Color borderCentralMenuColor,
    required double animationOffset,
    double itemOffsetPercentage = 0.0
  }) {
    int numberOfElements = menuItems.length;
    double adjustedRadius = radius * (1 + itemOffsetPercentage);
    List<Point> points = getCircularPosition(numberOfElements, adjustedRadius, animationOffset);
    List<Widget> menuWidgets = [];


    menuWidgets.add(
      Positioned(
          left: menuPositionX - radius,
          top: menuPositionY - radius,
          child: BigCircle(
            size: radius * 2,
            color: menuColor,
            borderWidth: 1,
            borderColor: borderCentralMenuColor,
          )),
    );

    for (int i = 0; i < numberOfElements; i++) {
      menuWidgets.add(
        Positioned(
            left: menuPositionX + points[i].x - (itemSize / 2),
            top: menuPositionY + points[i].y - (itemSize / 2),
            child: CircleItem(
              size: itemSize,
              color: itemColor,
              borderColor: itemBorderColor,
              borderWidth: 1,
              title: menuItems[i].title,
              onTap: menuItems[i].onPressed,
            )),
      );
    }
    return menuWidgets;
  }
}