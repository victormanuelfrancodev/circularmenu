import 'package:flutter/material.dart';

/// A big circle widget.
class BigCircle extends StatelessWidget {
  const BigCircle(
      {required this.size,
      required this.color,
      this.borderColor,
      this.borderWidth,
      super.key});

  final double size;
  final Color color;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
            color: borderColor ?? Colors.transparent, width: borderWidth ?? 0),
        borderRadius: BorderRadius.circular((size) / 2),
      ),
    );
  }
}
