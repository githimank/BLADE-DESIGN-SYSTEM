import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import '../../theme/tokens/borders.dart';

enum DividerThickness {
  THINNER,
  THIN,
  THICK,
  THICKER;

  double get thickness {
    return switch (this) {
      DividerThickness.THINNER => Borders.widths.thinner,
      DividerThickness.THIN => Borders.widths.thin,
      DividerThickness.THICK =>  Borders.widths.thick,
      DividerThickness.THICKER => Borders.widths.thicker,
    };
  }
}

enum DividerVariant {
  NORMAL,
  SUBTLE,
  MUTED,
}

extension DividerVariantColors on DividerVariant {
  Color color(BuildContext context) {
    return switch (this) {
      DividerVariant.NORMAL => context.colorTheme.surface.border.gray.normal,
      DividerVariant.SUBTLE => context.colorTheme.surface.border.gray.subtle,
      DividerVariant.MUTED => context.colorTheme.surface.border.gray.muted,
    };
  }
}

class BpDivider extends StatelessWidget {
  final bool isDashed;
  final Axis orientation;
  final DividerThickness thickness;
  final DividerVariant variant;
  final double? length;

  const BpDivider({
    super.key,
    this.isDashed = false,
    this.orientation = Axis.horizontal,
    this.thickness = DividerThickness.THIN,
    this.variant = DividerVariant.MUTED,
    this.length,
  });

  @override
  Widget build(BuildContext context) {
    final thicknessValue = thickness.thickness;
    final color = variant.color(context);

    final maxLength = orientation == Axis.horizontal
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    final finalLength = length ?? maxLength;

    if (orientation == Axis.horizontal) {
      return SizedBox(
        width: finalLength,
        height: thicknessValue,
        child: isDashed
            ? CustomPaint(
          size: Size(finalLength, thicknessValue),
          painter: DashedLinePainter(
            dashLength: 5.0,
            spaceLength: 5.0,
            totalLength: finalLength,
            color: color,
            thickness: thicknessValue,
            orientation: orientation,
          ),
        )
            : Divider(
          height: 0,
          color: color,
          thickness: thicknessValue,
        ),
      );
    } else {
      return SizedBox(
        height: finalLength,
        width: thicknessValue,
        child: isDashed
            ? CustomPaint(
          size: Size(thicknessValue, finalLength),
          painter: DashedLinePainter(
            dashLength: 5.0,
            spaceLength: 5.0,
            totalLength: finalLength,
            color: color,
            thickness: thicknessValue,
            orientation: orientation,
          ),
        )
            : VerticalDivider(
          width: 0,
          color: color,
          thickness: thicknessValue,
        ),
      );
    }
  }
}

class DashedLinePainter extends CustomPainter {
  final double dashLength;
  final double spaceLength;
  final double totalLength;
  final Color color;
  final double thickness;
  final Axis orientation;

  DashedLinePainter({
    required this.dashLength,
    required this.spaceLength,
    required this.totalLength,
    required this.color,
    required this.thickness,
    required this.orientation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    double startX = 0.0;

    while (startX < totalLength) {
      final endX = (startX + dashLength).clamp(0, totalLength);

      final startOffset = orientation == Axis.horizontal
          ? Offset(startX, size.height / 2)
          : Offset(0, startX);
      final endOffset = orientation == Axis.horizontal
          ? Offset(endX.toDouble(), size.height / 2)
          : Offset(0, endX.toDouble());

      canvas.drawLine(
        startOffset,
        endOffset,
        paint,
      );
      startX += dashLength + spaceLength;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
