import 'package:flutter/material.dart';
import 'dart:math';

class WavyTextRendering extends StatelessWidget {
  final String text;
  const WavyTextRendering({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WavyTextPainter(
        text: text,
        amplitude: 10,
        frequency: 0.02,
        textStyle: const TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
      ),
    );
  }
}

class WavyTextPainter extends CustomPainter {
  final String text;
  final double amplitude;
  final double frequency;
  final TextStyle textStyle;

  WavyTextPainter({
    required this.text,
    required this.amplitude,
    required this.frequency,
    required this.textStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < text.length; i++) {
      final char = text[i];
      final xPos = i * (size.width / (text.length - 2));
      final yPos = sin(xPos * frequency) * amplitude;

      final charPainter = TextPainter(
        text: TextSpan(text: char, style: textStyle),
        textDirection: TextDirection.ltr,
      );

      charPainter.layout();
      charPainter.paint(canvas, Offset(xPos, yPos));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
