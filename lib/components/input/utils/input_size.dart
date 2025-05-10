import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

/// Represents the input size
enum InputSize {
  MEDIUM(
    size: Spacings.spacing4,
    cursorSize: 16,
    maxAdditionalItemsHeight: 24,
  ),
  LARGE(
    size: Spacings.spacing5,
    cursorSize: 24,
    maxAdditionalItemsHeight: 28,
  );

  final double size;
  final double cursorSize;
  final double maxAdditionalItemsHeight;

  TextStyle helperTextStyle(BuildContext context) => switch (this) {
        InputSize.MEDIUM =>
          context.appTypography.captionSmall.regular ?? const TextStyle(),
        InputSize.LARGE =>
          context.appTypography.captionMedium.regular ?? const TextStyle(),
      };

  const InputSize(
      {required this.size,
      required this.cursorSize,
      required this.maxAdditionalItemsHeight});
}
