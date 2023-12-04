import 'package:flutter/material.dart';

class AnimatedOrbitMenu extends StatefulWidget {
  final bool animate;
  final OrbitMenuConfig config;

  AnimatedOrbitMenu({Key? key, required this.animate, required this.config}) : super(key: key);

  @override
  _AnimatedOrbitMenuState createState() => _AnimatedOrbitMenuState();
}

class _AnimatedOrbitMenuState extends State<AnimatedOrbitMenu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    if (widget.animate) {
      _controller = AnimationController(vsync: this, duration: Duration(seconds: 12));
      _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
      _controller.repeat(reverse: true);
    }
  }

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
            menuItems: widget.config.menuItems,
            itemSize: widget.config.itemSize,
            itemColor: widget.config.itemColor,
            itemBorderColor: widget.config.itemBorderColor,
            borderCentralMenuColor: widget.config.borderCentralMenuColor,
            animationOffset: _animation.value,
            itemOffsetPercentage: widget.config.itemOffsetPercentage,
          ),
        );
      },
    )
        : Stack(
      alignment: Alignment.center,
      children: OrbitMenu.createMenu(
        alignment: Alignment.center,
        children: OrbitMenu.createMenu(
        menuPositionX: widget.config.menuPositionX,
        menuPositionY: widget.config.menuPositionY,
        menuColor: widget.config.menuColor,
        radius: widget.config.radius,
        menuItems: widget.config.menuItems,
        itemSize: widget.config.itemSize,
        itemColor: widget.config.itemColor,
        itemBorderColor: widget.config.itemBorderColor,
        borderCentralMenuColor: widget.config.borderCentralMenuColor,
        animationOffset: 0,
        itemOffsetPercentage: widget.config.itemOffsetPercentage,
      ),
    );
  }

  @override
  void dispose() {
    if (widget.animate) {
      _controller.dispose();
    }
    super.dispose();
  }
}