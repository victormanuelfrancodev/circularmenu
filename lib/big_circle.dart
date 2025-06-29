import 'package:flutter/material.dart';

/// A big circle widget.
class BigCircle extends StatelessWidget {
  const BigCircle(
      {required this.size,
      required this.color,
      this.border,
      super.key});

  final double size;
  final Color color;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.circular((size) / 2),
      ),
    );
  }
}
