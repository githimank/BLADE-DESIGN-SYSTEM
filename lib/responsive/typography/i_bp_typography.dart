import 'package:blade_design_system/theme/blade_theme.dart';
import 'package:flutter/material.dart';

abstract interface class IBpTypography {
  TextStyle get displayXLarge;

  TextStyle get displayLarge;

  TextStyle get displayMedium;

  TextStyle get displaySmall;

  TextStyle get heading2XLarge;

  TextStyle get headingXLarge;

  TextStyle get headingLarge;

  TextStyle get headingMedium;

  TextStyle get headingSmall;

  TextStyle get bodyLarge;

  TextStyle get bodyMedium;

  TextStyle get bodySmall;

  TextStyle get bodyXSmall;

  TextStyle get captionMedium;

  TextStyle get captionSmall;

  TextStyle get codeMedium;

  TextStyle get codeSmall;

  AppTextTheme get appTextTheme => AppTextTheme(
      displayXLarge: displayXLarge,
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      heading2XLarge: heading2XLarge,
      headingXLarge: headingXLarge,
      headingLarge: headingLarge,
      headingMedium: headingMedium,
      headingSmall: headingSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      bodyXSmall: bodyXSmall,
      captionMedium: captionMedium,
      codeMedium: codeMedium,
      codeSmall: codeSmall,
      captionSmall: captionSmall);
}
