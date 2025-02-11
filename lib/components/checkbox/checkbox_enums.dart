import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

enum CheckboxSize {
  LARGE(
    0.8667,
    21.0,
  ),
  MEDIUM(
    0.7556,
    20.0,
  ),
  SMALL(
    0.6444,
    18.0,
  );

  final double size;
  final double textHeight;

  const CheckboxSize(this.size, this.textHeight);

  TextStyle textStyle(BuildContext context) {
    final TextStyle baseStyle = switch (this) {
      CheckboxSize.LARGE => context.appTypography.bodyLarge.regular!,
      CheckboxSize.MEDIUM => context.appTypography.bodyMedium.regular!,
      CheckboxSize.SMALL => context.appTypography.bodySmall.regular!,
    };
    return baseStyle.copyWith(fontSize: textHeight);
  }

  TextStyle textStyleForErrorAndHelper(BuildContext context) {
    return switch (this) {
      CheckboxSize.LARGE => context.appTypography.captionMedium.regular!,
      CheckboxSize.MEDIUM => context.appTypography.codeSmall.regular!,
      CheckboxSize.SMALL => context.appTypography.codeSmall.regular!,
    };
  }
}

enum CheckBoxValidationState {
  NONE,
  ERROR,
}

enum CheckboxNecessityIndicator {
  NONE(''),
  REQUIRED('*'),
  OPTIONAL('(optional)');

  final String value;

  const CheckboxNecessityIndicator(this.value);
}
