import 'package:flutter/material.dart';

class CenteredStrikethroughPainter extends CustomPainter {
  final String text1;
  final String text2;
  final String text3;
  final TextStyle style1;
  final TextStyle style2;
  final TextStyle style3;
  final Color strikeThroughColor;
  final double strikeThroughThickness;
  final bool isStrikeThrough;

  CenteredStrikethroughPainter(
      {required this.text1,
      required this.text2,
      required this.text3,
      required this.style1,
      required this.style2,
      required this.style3,
      required this.strikeThroughColor,
      required this.strikeThroughThickness,
      required this.isStrikeThrough});

  @override
  void paint(Canvas canvas, Size size) {
    double xOffset = 0;
    double totalWidth = 0;
    double maxBaselineOffset = 0;
    double maxHeight = 0;
    double minHeight = 0;
    List<TextPainter> textPainters = [];

    // Helper to create and measure text
    TextPainter createTextPainter(String text, TextStyle style) {
      final textSpan = TextSpan(text: text, style: style);
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      )..layout();

      // Update maximum baseline offset and height
      double baseline =
          textPainter.computeDistanceToActualBaseline(TextBaseline.alphabetic);
      maxBaselineOffset =
          baseline > maxBaselineOffset ? baseline : maxBaselineOffset;
      maxHeight =
          textPainter.height > maxHeight ? textPainter.height : maxHeight;
      minHeight =
          textPainter.height < minHeight ? textPainter.height : minHeight;

      totalWidth += textPainter.width;
      return textPainter;
    }

    // Create TextPainters for each segment
    textPainters.add(createTextPainter(text1, style1));
    textPainters.add(createTextPainter(text2, style2));
    textPainters.add(createTextPainter(text3, style3));

    // Draw texts aligned to the same baseline
    for (var textPainter in textPainters) {
      double baselineOffset =
          textPainter.computeDistanceToActualBaseline(TextBaseline.alphabetic);
      double yOffset = maxBaselineOffset - baselineOffset;

      textPainter.paint(canvas, Offset(xOffset, yOffset));
      xOffset += textPainter.width;
    }

    if (isStrikeThrough) {
      // Draw the centered strikethrough line
      final Paint strikePaint = Paint()
        ..color = strikeThroughColor
        ..strokeWidth = strikeThroughThickness
        ..style = PaintingStyle.stroke;

      double leastHeight;

      final double strikeY =
          (maxHeight / 2) + (strikeThroughThickness); // Center of the text

      canvas.drawLine(
        Offset(0, strikeY),
        Offset(totalWidth, strikeY),
        strikePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  /// Dynamically calculate the required size
  Size getRequiredSize() {
    double totalWidth = 0;
    double maxHeight = 0;

    void measureText(String text, TextStyle style) {
      final textSpan = TextSpan(text: text, style: style);
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      )..layout();

      totalWidth += textPainter.width;
      maxHeight =
          textPainter.height > maxHeight ? textPainter.height : maxHeight;
    }

    measureText(text1, style1);
    measureText(text2, style2);
    measureText(text3, style3);

    return Size(totalWidth, maxHeight);
  }
}
