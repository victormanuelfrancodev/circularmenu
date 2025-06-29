library circularmenu;

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:orbitmenu/big_circle.dart';
import 'package:orbitmenu/circle_item.dart';
import 'package:orbitmenu/item.dart';
import 'package:orbitmenu/maths.dart';
import 'package:orbitmenu/orbit_menu_animation_type.dart';

/// A class to create a circular menu.
class OrbitMenu {
  static List<Widget> createMenu({
    required double menuPositionX,
    required double menuPositionY,
    required Color menuColor,
    required double radius,
    required List<Item> menuItems,
    required double itemSize,
    required Color itemColor,
    required TextStyle titleStyle,
    required Border border,
    required Border borderCentralMenu,
    required double animationOffset,
    OrbitMenuAnimationType orbitMenuAnimationType =
        OrbitMenuAnimationType.rotating,
    double itemOffsetPercentage = 0.0,
    Widget? myWidget,
    bool enableCentralWaveEffect = false,
  }) {
    int numberOfElements = menuItems.length;
    double adjustedRadius = radius * (1 + itemOffsetPercentage);
    List<Point> points =
        getCircularPosition(numberOfElements, adjustedRadius, animationOffset);
    List<Widget> menuWidgets = [];

    /// Add the central menu with wave effect if enabled
    menuWidgets.add(
      Positioned(
          left: menuPositionX - radius,
          top: menuPositionY - radius,
          child: BigCircle(
            size: radius * 2,
            color: menuColor,
            border: borderCentralMenu,
            enableWaveEffect: enableCentralWaveEffect,
            animationValue: animationOffset / (2 * pi),
          )),
    );

    /// Add the items
    switch (orbitMenuAnimationType) {
      case OrbitMenuAnimationType.orbit:
        for (int i = 0; i < numberOfElements; i++) {
          double waveOffset =
              sin(animationOffset + (i / numberOfElements) * 2 * pi) * 100;
          menuWidgets.add(
            Positioned(
                left: menuPositionX + points[i].x - (itemSize / 2) + waveOffset,
                top: menuPositionY + points[i].y - (itemSize / 2) + waveOffset,
                child: myWidget != null
                    ? GestureDetector(
                      onTap: menuItems[i].onPressed,
                      child: SizedBox(
                          width: itemSize,
                          height: itemSize,
                          child: myWidget,
                        ),
                    )
                    : menuItems[i].image.isNotEmpty ? GestureDetector(
                      onTap: menuItems[i].onPressed,
                      child: SizedBox(
                        width: itemSize,
                        height: itemSize,
                        child: Image(image: AssetImage(menuItems[i].image),),
                      ),
                    ):CircleItem(
                        size: itemSize,
                        color: itemColor,
                        titleStyle: titleStyle,
                        border: border,
                        borderWidth: 1,
                        title: menuItems[i].title,
                        onTap: menuItems[i].onPressed,
                      )),
          );
        }
        break;
      default:
        for (int i = 0; i < numberOfElements; i++) {
          menuWidgets.add(
            Positioned(
                left: menuPositionX + points[i].x - (itemSize / 2),
                top: menuPositionY + points[i].y - (itemSize / 2),
                child: myWidget != null
                    ? GestureDetector(
                      onTap: menuItems[i].onPressed,
                      child: SizedBox(
                          width: itemSize,
                          height: itemSize,
                          child: myWidget,
                        ),
                    )
                    : menuItems[i].image.isNotEmpty ? GestureDetector(
                      onTap: menuItems[i].onPressed,
                      child: SizedBox(
                        width: itemSize,
                        height: itemSize,
                        child: Image(image: AssetImage(menuItems[i].image),),
                      ),
                    ): CircleItem(
                        size: itemSize,
                        color: itemColor,
                        titleStyle: titleStyle,
                        border: border,
                        borderWidth: 1,
                        title: menuItems[i].title,
                        onTap: menuItems[i].onPressed,
                      )),
          );
        }
        break;
    }
    return menuWidgets;
  }
}
