import 'dart:math';

import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class BpCircularProgressIndicator extends StatefulWidget {
  final double height;
  final Color? trackColor;
  final Color? arcColor;
  final double strokeWidth;
  const BpCircularProgressIndicator({
    super.key,
    this.height = 20,
    this.trackColor,
    this.arcColor,
    this.strokeWidth = 3,
  });
  @override
  State<BpCircularProgressIndicator> createState() =>
      _BpCircularProgressIndicatorState();
}

class _BpCircularProgressIndicatorState
    extends State<BpCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Repeats the animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trackColor = widget.trackColor ??
        context.colorTheme.interactive.background.primary.faded;
    final arcColor = widget.arcColor ??
        context.colorTheme.interactive.background.primary.defaultColor;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: LoaderPainter(
              rotation: _controller.value,
              trackColor: trackColor,
              arcColor: arcColor,
              strokeWidth: widget.strokeWidth),
          size: Size(widget.height, widget.height), // Adjust size as needed
        );
      },
    );
  }
}

class LoaderPainter extends CustomPainter {
  final double rotation;
  final Color trackColor;
  final Color arcColor;
  final double strokeWidth;

  LoaderPainter({
    required this.rotation,
    required this.trackColor,
    required this.arcColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Gray background arc
    final Paint backgroundPaint = Paint()
      ..color = trackColor // Gray color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Foreground arcs
    final Paint arcPaint1 = Paint()
      ..color = arcColor // Color for the first arc
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final Paint arcPaint2 = Paint()
      ..color = arcColor // Color for the second arc
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final radius = (size.width - strokeWidth) / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    // Draw the background arc (full circle)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2 * pi,
      false,
      backgroundPaint,
    );

    // Draw the first arc (rotating)
    double startAngle1 = 2 * pi * rotation; // Rotates based on animation
    double sweepAngle = pi / 2; // Arc length
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle1,
      sweepAngle,
      false,
      arcPaint1,
    );

    // Draw the second arc (opposite to the first)
    double startAngle2 = startAngle1 + pi; // 180 degrees opposite
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle2,
      sweepAngle,
      false,
      arcPaint2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
