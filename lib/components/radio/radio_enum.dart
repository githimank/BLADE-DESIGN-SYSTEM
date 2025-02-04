import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

enum RadioSize {
  LARGE(20.0, 24.0, 20.0),
  MEDIUM(16.0, 20.0, 18.0),
  SMALL(12.0, 18.0, 16.0);

  final double size;
  final double height;
  final double labelHeight;

  const RadioSize(
      this.size,
      this.height,
      this.labelHeight,
      );

  TextStyle textStyle(BuildContext context) => switch (this) {
    RadioSize.LARGE => context.appTypography.bodyLarge.regular!,
    RadioSize.MEDIUM => context.appTypography.bodyMedium.regular!,
    RadioSize.SMALL => context.appTypography.bodySmall.regular!,
  };

  TextStyle textStyleForErrorAndHelper(BuildContext context) => switch (this) {
    RadioSize.LARGE => context.appTypography.captionMedium.regular!,
    RadioSize.MEDIUM => context.appTypography.captionSmall.regular!,
    RadioSize.SMALL => context.appTypography.captionSmall.regular!,
  };

  TextStyle textStyleForLabel(BuildContext context) {
    return switch (this) {
      RadioSize.LARGE => context.appTypography.bodyLarge.semiBold!,
      RadioSize.MEDIUM => context.appTypography.bodyMedium.semiBold!,
      RadioSize.SMALL => context.appTypography.bodySmall.semiBold!,
    };
  }
}

enum RadioValidationState {
  NONE,
  ERROR,
}

enum RadioNecessityIndicator {
  NONE(''),
  REQUIRED('*'),
  OPTIONAL('(optional)');

  final String value;

  const RadioNecessityIndicator(this.value);
}

enum RadioLabelPosition {
  Top,
  Left,
}
