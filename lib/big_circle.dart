import 'package:flutter/material.dart';
import 'package:orbitmenu/wave_effect.dart';

/// A big circle widget.
class BigCircle extends StatelessWidget {
  const BigCircle({
    required this.size,
    required this.color,
    this.border,
    this.enableWaveEffect = false,
    this.animationValue = 0.0,
    super.key,
  });

  final double size;
  final Color color;
  final Border? border;
  final bool enableWaveEffect;
  final double animationValue;

  @override
  Widget build(BuildContext context) {
    if (enableWaveEffect) {
      return WaveEffect(
        size: size,
        color: color,
        border: border ?? Border.all(color: Colors.transparent),
        animationValue: animationValue,
      );
    }

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
