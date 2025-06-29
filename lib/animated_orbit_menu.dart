import 'package:flutter/material.dart';
import 'package:orbitmenu/orbitmenu.dart';
import 'orbit_menu_config.dart';
import 'orbit_menu_animation_type.dart';
import 'dart:math';

class AnimatedOrbitMenu extends StatefulWidget {
  final bool animate;
  final OrbitMenuConfig config;

  const AnimatedOrbitMenu(
      {Key? key, required this.animate, required this.config})
      : super(key: key);

  @override
  _AnimatedOrbitMenuState createState() => _AnimatedOrbitMenuState();
}

class _AnimatedOrbitMenuState extends State<AnimatedOrbitMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  /// Initialize the animation controller and animation
  @override
  void initState() {
    super.initState();
    if (widget.animate) {
      _controller = AnimationController(
          vsync: this, duration: widget.config.animationDuration);
      switch (widget.config.animationType) {
        case OrbitMenuAnimationType.rotating:
          _animation =
              Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
          _controller.repeat();
          break;
        case OrbitMenuAnimationType.bouncing:
          _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: _controller, curve: Curves.fastOutSlowIn));
          _controller.repeat(reverse: true);
          break;
        case OrbitMenuAnimationType.orbit:
          _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(
              CurvedAnimation(parent: _controller, curve: Curves.linear));
          _controller.repeat();
          break;
      }
    }
  }

  /// Build the widget with the animation
  @override
  Widget build(BuildContext context) {
    return widget.animate
        ? AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              return Stack(
                alignment: Alignment.center,
                children: OrbitMenu.createMenu(
                    menuPositionX: widget.config.menuPositionX,
                    menuPositionY: widget.config.menuPositionY,
                    menuColor: widget.config.menuColor,
                    radius: widget.config.radius,
                    titleStyle: widget.config.titleStyle,
                    menuItems: widget.config.menuItems,
                    itemSize: widget.config.itemSize,
                    itemColor: widget.config.itemColor,
                    border: widget.config.itemBorder,
                    borderCentralMenu:
                        widget.config.borderCentralMenu,
                    animationOffset: _animation.value,
                    itemOffsetPercentage: widget.config.itemOffsetPercentage,
                    myWidget: widget.config.myWidget,
                    orbitMenuAnimationType: widget.config.animationType),
              );
            },
          )
        : Stack(
            alignment: Alignment.center,
            children: OrbitMenu.createMenu(
                menuPositionX: widget.config.menuPositionX,
                menuPositionY: widget.config.menuPositionY,
                menuColor: widget.config.menuColor,
                radius: widget.config.radius,
                titleStyle: widget.config.titleStyle,
                menuItems: widget.config.menuItems,
                itemSize: widget.config.itemSize,
                itemColor: widget.config.itemColor,
                border: widget.config.itemBorder,
                borderCentralMenu: widget.config.borderCentralMenu,
                animationOffset: 0,
                itemOffsetPercentage: widget.config.itemOffsetPercentage,
                myWidget: widget.config.myWidget));
  }

  /// Dispose the controller
  @override
  void dispose() {
    if (widget.animate) {
      _controller.dispose();
    }
    super.dispose();
  }
}
