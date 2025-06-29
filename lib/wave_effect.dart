import 'package:flutter/material.dart';
import 'dart:math';

class WaveEffect extends StatefulWidget {
  final double size;
  final Color color;
  final Border border;
  final double animationValue;

  const WaveEffect({
    Key? key,
    required this.size,
    required this.color,
    required this.border,
    required this.animationValue,
  }) : super(key: key);

  @override
  State<WaveEffect> createState() => _WaveEffectState();
}

class _WaveEffectState extends State<WaveEffect> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CentralWavePainter(
        size: widget.size,
        color: widget.color,
        border: widget.border,
        animationValue: widget.animationValue,
      ),
      size: Size(widget.size, widget.size),
    );
  }
}

class CentralWavePainter extends CustomPainter {
  final double size;
  final Color color;
  final Border border;
  final double animationValue;

  CentralWavePainter({
    required this.size,
    required this.color,
    required this.border,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final center = Offset(size / 2, size / 2);
    final radius = size / 2;
    
    // Dibujar múltiples ondas concéntricas MUCHO MÁS VISIBLES
    for (int i = 0; i < 5; i++) {
      double waveProgress = (animationValue + i * 0.2) % 1.0;
      double waveRadius = radius * (0.6 + waveProgress * 0.8); // Ondas más grandes
      double opacity = (1.0 - waveProgress) * 0.8; // Opacidad mucho mayor
      
      // Colores más llamativos para las ondas
      Color waveColor = i % 2 == 0 
          ? Colors.cyan.withOpacity(opacity)
          : Colors.blue.withOpacity(opacity);
      
      // Crear gradiente más dramático
      final paint = Paint()
        ..shader = RadialGradient(
          colors: [
            waveColor,
            waveColor.withOpacity(0.7),
            waveColor.withOpacity(0.3),
            Colors.transparent,
          ],
          stops: const [0.0, 0.4, 0.8, 1.0],
        ).createShader(Rect.fromCircle(center: center, radius: waveRadius))
        ..style = PaintingStyle.fill;
      
      canvas.drawCircle(center, waveRadius, paint);
    }
    
    // Dibujar el círculo central sólido
    final centralPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(center, radius * 0.6, centralPaint);
    
    // Dibujar el borde si existe
    if (border.top.width > 0) {
      final borderPaint = Paint()
        ..color = border.top.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = border.top.width.toDouble();
      
      canvas.drawCircle(center, radius * 0.6, borderPaint);
    }
    
    // Agregar un efecto de pulso adicional en el centro
    double pulseProgress = (animationValue * 2) % 1.0;
    double pulseScale = 0.8 + sin(pulseProgress * 2 * pi) * 0.2;
    
    final pulsePaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(center, radius * 0.4 * pulseScale, pulsePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
} 