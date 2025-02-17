import 'package:blade_design_system/theme/theme_extensions.dart';
import 'package:blade_design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';

enum ChipSize {
  LARGE(1.3334,  48.0, Spacings.spacing7, Spacings.spacing4),
  MEDIUM(1.0000, 36.0, Spacings.spacing6, Spacings.spacing3),
  SMALL(0.7778,  28.0, Spacings.spacing4, Spacings.spacing2),
  XSMALL(0.6667, 24.0, Spacings.spacing4, Spacings.spacing1);

  final double size;
  final double height;
  final double horizontalPadding;
  final double verticalPadding;

  const ChipSize(this.size, this.height, this.horizontalPadding, this.verticalPadding);

  TextStyle textStyle(BuildContext context) => switch (this) {
    ChipSize.LARGE => context.appTypography.headingMedium.regular!,
    ChipSize.MEDIUM => context.appTypography.bodyLarge.regular!,
    ChipSize.SMALL => context.appTypography.bodyMedium.regular!,
    ChipSize.XSMALL => context.appTypography.bodySmall.regular!,
  };

  TextStyle textStyleForErrorAndHelper(BuildContext context) => switch (this) {
    ChipSize.LARGE => context.appTypography.codeSmall.regular!,
    ChipSize.MEDIUM => context.appTypography.codeSmall.regular!,
    ChipSize.SMALL => context.appTypography.codeSmall.regular!,
    ChipSize.XSMALL => context.appTypography.codeSmall.regular!,
  };
}

enum ChipNecessityIndicator {
  NONE(''),
  REQUIRED('*'),
  OPTIONAL('(optional)');

  final String value;

  const ChipNecessityIndicator(this.value);
}

enum ChipLabelPosition{
  Top,
  Left,
}

enum ChipValidationState{
  NONE,
  ERROR,
}

enum ChipSelectionType{
  SINGLE,
  MULTIPLE,
}